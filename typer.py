import os
import tempfile

from BaseSpacePy.api.BaseSpaceAPI import BaseSpaceAPI


region = os.getenv('REGION')
hla_class = os.getenv("HLA_CLASS")
primer_mask_version = os.getenv("PRIMER_MASK_VERSION")

client_key = os.getenv("CLIENT_KEY")
client_secret = os.getenv("CLIENT_SECRET")
session_id = os.getenv("SESSION_ID")

token = os.getenv("TOKEN")
sample = os.getenv("SAMPLE")

jars_dir = os.getenv("JARS_DIR")

bsapi = BaseSpaceApi(client_key, client_secret,
  'https://api.basespace.illumina.com/', 'v1pre3',
  session_id)
bsapi.setAccessToken(token)

tmpdir = tempfile.mkdtemp()
os.chdir(tmpdir)

sample = bsapi.getSampleById(sample)
files = sample.getFiles(bsapi)
for fastqfile in files:
    fastqfile.downloadFile(bsapi, tmpdir)
