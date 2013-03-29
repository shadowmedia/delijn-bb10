// Default empty project template
import bb.cascades 1.0

// creates one page with a label
Page {
    Container {
        id: container;
        layout: StackLayout {

        }
        
        Label {
            text: qsTr("Koop een sms-ticket")
            textStyle.base: SystemDefaults.TextStyles.BigText
            verticalAlignment: VerticalAlignment.Center
            horizontalAlignment: HorizontalAlignment.Center
        }

        Divider {

        }
        TextArea {
            editable: false
            scrollMode: TextAreaScrollMode.Elastic
            textStyle.textAlign: TextAlign.Center
            text: "U kan uw bus- of tramrit van De Lijn per gsm betalen indien u klant bent bij Base, Mobistar of Proximus."

        }
        Divider {

        }
        TextArea {
            editable: false
            scrollMode: TextAreaScrollMode.Elastic
            textStyle.textAlign: TextAlign.Center
            text: "Een sms-ticket voor 1 uur kost 1,30 euro (+ 0,15 euro voor de aanvraag sms.)"

        }
        Button {
            id: oneHourButton
            text: qsTr("1 uur")
            horizontalAlignment: HorizontalAlignment.Center
            onClicked: {
                //console.debug("Clicked the one hour button.");
                container.sendSms("DL");
            }
        }
        TextArea {
            editable: false
            scrollMode: TextAreaScrollMode.Elastic
            textStyle.textAlign: TextAlign.Center
            text: "Een sms-ticket voor 2 uur kost 2,10 euro (+ 0,15 euro voor de aanvraag sms.)"

        }
        
        Button {
            id: twoHourButton
            text: qsTr("2 uur")
            horizontalAlignment: HorizontalAlignment.Center
            onClicked: {
                //console.debug("Clicked the two hour button.");
                container.sendSms("DL120");
            }

        }

        function sendSms(arg1) {
            var obj = {
                "to": [ 4884 ],
                "body": arg1,
                "send": "false"
            };
            var output = '', name, value;
            for (name in obj) {
                output += name + ':';
                value = obj[name];
                if (typeof value === 'string') {
                    output += ':' + value;
                } else if (typeof value === 'number') {
                    output += 'n:' + value;
                } else if (typeof value === 'boolean') {
                    output += 'b:' + value;
                } else if (typeof value === 'object') {
                    output += 'json:' + JSON.stringify(value);
                }
                output += '\n';
            }
            //console.debug("Output for SMS:\n" + output);
            _delijnapp.InvokeSms(output);
        }
    }
}

