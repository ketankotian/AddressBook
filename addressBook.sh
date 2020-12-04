#! /bin/bash
declare -A User
AUTHOR="Ketan Kotian"
echo "******Address Book******"
echo "Please Select Your Choice here 1.Create 2.Retrive 3.Update 4.Delete"
read userChoice

function userDetails() {
   User["NAME"]=$1
   User["AGE"]=$2
   User["MOBILENUMBER"]=$3
   echo "Your Profile Is Created :)"
   echo "${User[@]}"
   read -p "If You Update Anything 1.Name 2.Age 3.Mobile number 4.No Interest" value
   if [ $value -le 3 ]
   then
   updateUserInfo $value
   else
   echo "Thank You :) ...."
   fi
   
}
function retrieveUser() {
  User["NAME"]="Any Name"
  User["AGE"]="Any Age"
  User["MOBILENUMBER"]="Any Number"
  length=${#User[@]}
  if [ $length -eq 0 ]
  then
   echo "Sorry! Your Profile Is Empty :("
  else
   echo "Happy To Assist You :)"
   echo "Your Profile :"
   echo "${User[@]}"
  fi
}
function updateUserInfo(){
   one=1
   two=2
   if [ $1 -eq $one ]
   then
     localVariableName="NAME"
     read -p "Enter Your New Name Im going to set now " newName
     User[$localVariableName]=$newName
     echo "Happy :) Your Request Is Updated"
     echo "${User[@]}"
   elif [ $1 -eq $two ]
   then
     localVariableAge="AGE"
     read -p "Enter Your New Age Im going to set now " newAge
     User[$localVariableAge]=$newAge
     echo "Happy :) Your Request Is Updated"
     echo "${User[@]}"
   else
     localVariablePhone="MOBILENUMBER"
     read -p "Enter Your New Mobile Number Im going to set now " newPhone
     User[$localVariablePhone]=$newPhone
     echo "Happy :) Your Request Is Updated"
     echo "${User[@]}"
   fi
}
function businessLogic(){
  echo "Welcome $2"
  case $1 in
   1)
      echo "Hurray! Ready To Create :)"
      read -p "Enter Your Fullname here : " fullname
      read -p "Enter Your Age hee : " age
      read -p "Enter Your Mobile Number : " mobilenumber
      userDetails $fullname $age $mobilenumber
      ;;
   2)
      echo "Hurray! Ready To Retrive :)"
      retrieveUser
      ;;
   3)
      echo "Hurray! Ready To Update :)"
      echo "Which One Need To Update"
      read -p "1.Name 2.Age 3.Mobile Number" updateUserInput
      updateUserInfo $updateUserInput
      ;;
   4)
      echo "Hurray! Ready To Delete :("
      ;;
   *)
       echo "Please Enter Between 1 and 4 :("
     ;;
  esac
}
businessLogic $userChoice $AUTHOR