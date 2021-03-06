resource "aws_cloudwatch_dashboard" "main" {
  dashboard_name = "Petclinic_Dashboard"

  dashboard_body = <<EOF
{
  "start": "-PT9H",
  "periodOverride": "inherit",
  "widgets": [
    {
      "type":"metric",
      "x":0,
      "y":0,
      "width":18,
      "height":9,
      "properties":{
        "metrics":[
          [ { "expression": "SEARCH('{AWS/EC2,InstanceId} MetricName=\"CPUUtilization\"', 'Average', 300)", "id": "e1" } ]
        ],
        "view": "timeSeries",
        "stacked": false,
        "region":"eu-west-1",
        "title":"Node Instance CPU"
      }
    }
  ]
}
EOF
}