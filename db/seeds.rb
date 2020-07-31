

Gig.destroy_all
Musician.destroy_all

band1 = Musician.create(username:"TheFlatIronFunk", password:"1234", name:"The Flatiron Funk", number_of_members: 4, lead_member: "Ahmed", minimum_garuntee: 300)
band2 = Musician.create(username:"BlastNice", password:"0000", name:"Blast Nice", number_of_members: 1, lead_member: "Austin", minimum_garuntee: 150)

Gig.create(venue_name: "Moe's Original BBQ", date_time: "08-15-2020 7pm", offer: 350, accepted: true, paid: false, musician: band1)
Gig.create(venue_name: "Haley's Hang Out", date_time: "08-21-2020 8pm", offer: 300, accepted: true, paid: false, musician: band1)
Gig.create(venue_name: "Bryce's Beat Shack", date_time: "08-27-2020 5pm", offer: 350, accepted: true, paid: false, musician: band1)
Gig.create(venue_name: "Damon's Party Plaza", date_time: "08-29-2020 10pm", offer: 250, accepted: false, paid: false, musician: band1)
Gig.create(venue_name: "Kyle's Punks Only", date_time: "09-04-2020 9pm", offer: 300, accepted: true, paid: false, musician: band1)
Gig.create(venue_name: "Juju's Hippy Palace", date_time: "09-10-2020 6pm", offer: 350, accepted: true, paid: false, musician: band1)
Gig.create(venue_name: "Venue X", date_time: "09-12-2020 8pm", offer: 250, accepted: false, paid: false, musician: band2)