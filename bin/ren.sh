#!/bin/bash

DIR=$1

rename 's/ /-/g' $DIR/*
rename 's/‐/-/g' $DIR/*
rename s/[\(\)\'\,\`\’\‘]//g $DIR/*
rename s/[\{\}]//g $DIR/*
rename s/_$// $DIR/*
#rename 's/,//g'  $DIR/*
rename 's/đ/d/g' $DIR/*
rename 's/Đ/D/g' $DIR/*
rename 's/(Â|Ä)/A/g' $DIR/*
rename 's/(É|Ë|Ê|É)/E/g' $DIR/*
rename 's/(ñ|ń|ń)/n/g' $DIR/*
rename 's/ļ/l/g' $DIR/*
rename 's/Ï/I/g' $DIR/*
rename 's/Ś/S/g' $DIR/*
rename 's/(Ö|Ö|Ô)/O/g' $DIR/*
rename 's/Ẁ/W/g' $DIR/*
rename 's/(Ü|Ü|Ú)/U/g' $DIR/*
rename 's/й/и/g' $DIR/*
rename 's/ł/t/g' $DIR/*
# Some of these are ok, some may still not match. There appears to be some discrepancy in character encodings.
# Just have to cut and paste the ones that aren't working.
rename 's/(ó|ô|ò|ò|ò|ỏ|ỏ|õ|õ|ó|ό|ớ|ọ|ô|ồ|ổ|ỗ|ố|ộ|ộ|ơ|ơ|ờ|ở|ỡ|ớ|ợ|ợ|ö|ö|ó)/o/g' $DIR/*
rename 's/(ä|ă|ằ|ẳ|ẵ|ắ|ắ|ặ|ặ|â|â|ầ|ầ|ẩ|ẫ|ấ|ấ|ậ|à|ã|ả|á|á|ạ|ạ|ä|å|å)/a/g' $DIR/*
rename 's/(é|è|è|ẻ|ẽ|é|ẹ|ê|ẽ|ề|ể|ễ|ế|ệ|ë|ё)/e/g' $DIR/*
rename 's/(ù|ú|ư|ụ|ủ|ủ|ü|û|ü)/u/g' $DIR/*
rename 's/(î|ì|ỉ|í|ï|ί|ĭ)/i/g' $DIR/*
rename 's/(ỳ|ý)/y/g' $DIR/*
