file=razorthinksoftware-BrainBloxAppModules-20170731-1446.git.tar.gz
bucket=nishantest
resource="/${bucket}/${file}"
contentType="application/x-compressed-tar"
dateValue=`date -R`
stringToSign="PUT\n\n${contentType}\n${dateValue}\n${resource}"
s3Key=zm,cksldnckksnc.msnvjksndv
s3Secret=,mzckscvksdnclksvksnv.m,dvkjv,mmxnvjkd
signature=`echo -en ${stringToSign} | openssl sha1 -hmac ${s3Secret} -binary | base64`
UPLOAD=`curl -X PUT -T "${file}" \
  -H "Host: ${bucket}.s3.amazonaws.com" \
  -H "Date: ${dateValue}" \
  -H "Content-Type: ${contentType}" \
  -H "Authorization: AWS ${s3Key}:${signature}" \
  https://${bucket}.s3.amazonaws.com/${file}`


#for file in `ls github-backups` 

#do $UPLOAD 

#done 
