webhook=$(cat .config | grep SlackWebhook | sed "s/SlackWebhook://")

send_message(){
        data='{"text":"'$1'"}'
        curl -X POST -H 'Content-type: application/json' --data "$data" ${webhook}
}
send_message "$1"
