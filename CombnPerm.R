library(gtools)
suit <- c("Heart", "Diamond", "Clubs", "Spades")
number <- c(1:13)

deck <-expand.grid(number=number, suit=suit)
deck <- paste(deck$number, deck$suit)

kings<- paste(13, suit)
p_kings <- mean(deck%in%kings)
p_kings

hands<- permutations(52,2, v = deck)

first_card <- hands[,1]
second_card <- hands[,2]

#prob second king|first king is drawn
sum(first_card%in% kings& second_card%in%kings)/sum(first_card%in% kings)
#prob blackjack
hands<- combinations(52,2,v=deck)
aces <- paste(1, suit)
facecard <- expand.grid(number = c(10:13), suit = suit)
facecard<- paste(facecard$number, facecard$suit)
mean(hands[,1]%in%aces & hands[,2]%in% facecard)

#Monte Carlo BlackJack
hand<-sample(deck, 2)
result<- replicate(100000, {
  hand <- sample(deck, 2)
  (hand[1]%in% aces & hand[2]%in% facecard)|(hand[2]%in% aces &hand[1]%in% facecard)})
mean(result)












