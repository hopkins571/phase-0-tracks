airport = {
	terminal_1: {
		restaurants: ['McDonalds', 'Chipotle', 'Starbucks', 'Cinnabun', 'Pizza Hut'],
		airlines: ['Delta', 'Air Canada', 'Lufthansa'],
		passengers: ['Clark Griswold', 'Ellen', 'Rusty'],
		gates: {
			gate1: {
				airline: 'Delta',
				flightnum: 305,
				destination: 'ATL',
				sched_depart: '12:05',
				est_depart: '12:07',
				flight_status: 'on time',
				seats_available: true,
				flight_attendants: ['Eddie', 'Elena', 'Marta']
			},
			gate2: {
				airline: 'Air Canada',
				flightnum: 4563,
				destination: 'YVR',
				sched_depart: '16:25',
				est_depart: nil,
				flight_status: 'canceled',
				seats_available: false,
				flight_attendants: ['Shannon', 'Ari']
			},
			gate3: {
				airline: 'Lufthansa',
				flightnum: 303,
				destination: 'MUC',
				sched_depart: '18:25',
				est_depart: '20:40',
				flight_status: 'delayed',
				seats_available: true,
				flight_attendants: ['Felix', 'Guenther', 'Elke']
			},
			gate4: {
				airline: nil,
				flightnum: nil,
				destination: nil,
				sched_depart: nil,
				est_depart: nil,
				flight_status: nil,
				seats_available: nil,
				flight_attendants: []
			}
		}
	},
	terminal_2: {
		restaurants: ['Wendys', 'Sushi Hut', 'Pita Pit', 'Caribou Coffee'],
		airlines: ['United', 'Aeroflot', 'Air India', 'El Al'],
		passengers: ['Eddie', 'Vicki', 'Edna'],
		gates: {
			gate1: {
				airline: 'Aeroflot',
				flightnum: 102,
				destination: 'SVO',
				sched_depart: '18:05',
				est_depart: nil,
				flight_status: 'canceled',
				seats_available: false,
				flight_attendants: ['Ivan', 'Elena', 'Natasha']
			},
			gate2: {
				airline: 'El Al',
				flightnum: 43,
				destination: 'TLV',
				sched_depart: '17:25',
				est_depart: '17:25',
				flight_status: 'on time',
				seats_available: true,
				flight_attendants: ['Jen', 'Alex', 'Yael']
			},
			gate3: {
				airline: 'United',
				flightnum: 10,
				destination: 'JFK',
				sched_depart: '09:45',
				est_depart: '10:20',
				flight_status: 'delayed',
				seats_available: false,
				flight_attendants: ['Susan', 'Marcus']
			},
			gate4: {
				airline: 'Air India',
				flightnum: 176,
				destination: 'DEL',
				sched_depart: '12:40',
				est_depart: '13:00',
				flight_status: 'delayed',
				seats_available: true,
				flight_attendants: ['Anika', 'Vanya', 'Drishya', 'Hari']
			}
		}
	},
	checkin: {
		baggage_check_open?: {
			desk1: true,
			desk2: false,
			desk3: true,
			desk4: true,
			desk5: false
		},
		assigned_airlines: {
			desk1: ['United', 'Lufthansa'],
			desk2: [],
			desk3: ['Air India', 'Delta'],
			desk4: ['El Al'],
			desk5: []
		},
		passengers: ['Pinky', 'The Brain', 'Dot'],
		restaurants: ['Chilis', 'Coffee Grind']
	}
}
# Print parent hash, check for errors
puts airport

