BEGIN {
#declare FS to split rows by comma
#also initialize high and low score and names for each 
        FS = ","
        h_score = -1
        l_score = 1000
        h_student
        l_student

}
{
        #skip first line since it is just variable names
        if (NR == 1) {
                next
        }

        #reset total for each student
        total = 0
        for (i = 3; i <= NF; i++){
        #add total using for loop, starting at 3rd column and going to last column
                total+= $i
        }
        #finding average (/3 since assumption shows that three different grades) 
        avg = total/3

        #assigning total and avg by using student name as key in array
        student_total[$2] = total
        student_avg[$2] = avg

        #determining status of student and assigning status using name as key
        if (avg >=70) {
                student_status[$2] = "Pass"
        }
        else {
                student_status[$2] = "Fail"
        }

        #determining highest and lowest scoring students
        #if current total is greater than h_score, then it will become new h_score; same principle applied to lowest score
        if ( total > h_score){
                h_score = total
                h_student = $2
                h_avg = h_score/3
        }
        if ( total < l_score ){
                l_score = total
                l_student = $2
                l_avg = l_score/3
        }
}
END {

    print "Name Total Avg Status"

    #going through array of student total; will work for all three arrays since same number of enteries 
    for (name in student_total) {
        print name, student_total[name], student_avg[name], student_status[name]
    }

    print "\nHighest Scoring Student: ",  h_student, "with total of ", h_score, " and an average of ", h_avg
    print "\nLowest Scoring Student: ",  l_student, "with total of ", l_score, " and an average of ", l_avg
}
