import 'package:bmi_calculator/icon_content.dart';
import 'package:bmi_calculator/reusable_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'const.dart';
import 'results_page.dart';


enum Gender {
  male, 
  female
}

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  Gender selectedGender = Gender.male;
  int height = 180;
  int weight = 60;
  int age = 19;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('BMI CALCULATOR',),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    color: selectedGender == Gender.male? kActiveCardColor: kInactiveCardColor,
                    cardChild: const IconContent(icon: FontAwesomeIcons.mars, label: "MALE",),
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                  )
                ),
                Expanded(
                  child: ReusableCard(
                    color: selectedGender == Gender.female? kActiveCardColor: kInactiveCardColor,
                    cardChild: const IconContent(icon: FontAwesomeIcons.venus, label: "FEMALE"),
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },                  
                  )
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    color: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("HEIGHT", style: kLabelTextStyle,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              height.toString(), 
                              style: kNumberTextStyle,
                            ),
                            const Text(
                              "cm", 
                              style: kLabelTextStyle,
                            ),
                          ],                          
                        ),
                        Slider(
                          activeColor: const Color(0xFFEB1555),
                          inactiveColor: const Color(0xFF8D8E98),
                          value: height.toDouble(), 
                          min: kMinHeight,
                          max: kMaxHeight,
                          onChanged: (double newValue) {
                            setState(() {
                              height = newValue.round();
                            });
                          }
                        ),                        
                      ],
                    ),
                    onPress: () {},
                  )
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    color: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "WEIGHT",
                          style: kLabelTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  weight = weight + 1;
                                });
                              },
                            ),
                            const SizedBox(width: 10.0,),
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  weight = weight - 1;
                                });
                              },                              
                            ),                          
                          ],
                        ),
                      ],
                    ),
                    onPress: () {},
                  )
                ),
                Expanded(
                  child: ReusableCard(
                    color: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Age",
                          style: kLabelTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  age++;
                                  print(age);
                                });
                              },
                            ),
                            const SizedBox(width: 10.0,),
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(() {
                                  age--;
                                });
                              },                              
                            ),                          
                          ],
                        ),
                      ],
                    ),
                    onPress: () {},
                  )
                ),
              ],
            ),
          ),  
          GestureDetector(
            onTap: () {
              BMICalculator bmiCalculator = BMICalculator(height: height, weight: weight);

              Navigator.push(context, MaterialPageRoute(builder: (context) => ResultsPage(bmiCalculator: bmiCalculator,)));
            },
            child: Container(
              color: const Color(0xFFEB1555),
              margin: const EdgeInsets.only(top: 10.0),
              padding: const EdgeInsets.only(bottom: 20.0),
              width: double.infinity,
              height: 80.0,
              child: const Center(child: Text("CALCULATE", style: kLargeLabelTextStyle,)),
            ),
          ),        
        ],
      ),
    );
  }
}

class RoundIconButton extends StatelessWidget {
  const RoundIconButton({
    required this.icon,
    required this.onPressed,
    super.key
  });
  
  final IconData icon;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      shape: const CircleBorder(),
      fillColor: const Color.fromARGB(255, 37, 38, 44),
      constraints: const BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      elevation: 3.0,
      onPressed: onPressed,
      child: Icon(icon, color: Colors.white,),
    );
  }
}