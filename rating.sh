dataSrc=$1
while read line
do
	ip=$(echo $line | cut -d ":" -f 1)
        if fping -c 1 -t 2000 $ip 2>&1 >/dev/null
        then
		curl -X POST -H "Host: rozklad.org.ua" -H "Content-Length: 47" -H "Origin: https://rozklad.org.ua" -H "https://rozklad.org.ua/rating/vote_teacher/4908/\?back\=teachers_group_%D1%96%D1%81-91" -H "Upgrade-Insecure-Requests: 1" --max-time 4 --data "rating1=5&rating2=5&rating3=5&rating4=5&submit=" https://rozklad.org.ua/rating/vote_teacher/4908/\?back\=teachers_group_%D1%96%D1%81-91 --proxy $line

		sleep 2
		
		curl -X POST -H "Conntent-Length: 47" -H "Origin: https://rozklad.org.ua" -H "https://rozklad.org.ua/rating/vote_teacher/4909/?back=teachers_group_%D1%96%D1%81-91" -H "Upgrade-Insecure-Requests: 1" --max-time 4 --data "rating1=5&rating2=5&rating3=5&rating4=5&submit=" https://rozklad.org.ua/rating/vote_teacher/4909/?back=teachers_group_%D1%96%D1%81-91 --proxy $line

		echo "vote done with proxy $line"
	else
                echo "proxy server $line is not responding"		
	fi	
done < dataSrc
