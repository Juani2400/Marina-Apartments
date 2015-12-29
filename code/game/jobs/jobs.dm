// Marina Apartments

var/const/PERSONNEL			=(1<<0)

var/const/TENANT			=(1<<0)
var/const/GUARD				=(1<<0)
var/const/MAINTENANCETEC	=(1<<0)
var/const/NURSE				=(1<<0)
var/const/DOORMAN			=(1<<0)


var/const/CIVILIAN			=(1<<2)

var/const/GUEST				=(1<<0)


var/const/HALLWAYA			=(1<<0)

var/const/RESIDENTA01		=(1<<0)
var/const/RESIDENTA02		=(1<<0)
var/const/RESIDENTA03		=(1<<0)
var/const/RESIDENTA04		=(1<<0)
var/const/RESIDENTA05		=(1<<0)


var/const/HALLWAYB			=(1<<0)

var/const/RESIDENTB01		=(1<<0)
var/const/RESIDENTB02		=(1<<0)
var/const/RESIDENTB03		=(1<<0)
var/const/RESIDENTB04		=(1<<0)


var/const/HALLWAYC			=(1<<0)

var/const/RESIDENTC01		=(1<<0)
var/const/RESIDENTC02		=(1<<0)
var/const/RESIDENTC03		=(1<<0)
var/const/RESIDENTC04		=(1<<0)
var/const/RESIDENTC05		=(1<<0)
var/const/RESIDENTC06		=(1<<0)
var/const/RESIDENTC07		=(1<<0)
var/const/RESIDENTC08		=(1<<0)
var/const/RESIDENTC09		=(1<<0)
var/const/RESIDENTC010		=(1<<0)
var/const/RESIDENTC011		=(1<<0)


var/const/HALLWAYD			=(1<<0)

var/const/RESIDENTD01		=(1<<0)
var/const/RESIDENTD02		=(1<<0)
var/const/RESIDENTD03		=(1<<0)
var/const/RESIDENTD04		=(1<<0)
var/const/RESIDENTD05		=(1<<0)
var/const/RESIDENTD06		=(1<<0)
var/const/RESIDENTD07		=(1<<0)
var/const/RESIDENTD08		=(1<<0)


var/const/HALLWAYE			=(1<<0)

var/const/RESIDENTE01		=(1<<0)
var/const/RESIDENTE02		=(1<<0)
var/const/RESIDENTE03		=(1<<0)
var/const/RESIDENTE04		=(1<<0)




var/list/personnel = list(
	"Tenant",
	"Guard",
	"Maintenance Technician",
	"Nurse",
	"Doorman",
)

var/list/hallwaya = list(
	"Resident A01",
	"Resident A02",
	"Resident A03",
	"Resident A04",
	"Resident A05",
)

var/list/hallwayb = list(
	"Resident B01",
	"Resident B02",
	"Resident B03",
	"Resident B04",
)

var/list/hallwayc = list(
	"Resident C01",
	"Resident C02",
	"Resident C03",
	"Resident C04",
	"Resident C05",
	"Resident C06",
	"Resident C07",
	"Resident C08",
	"Resident C09",
	"Resident C010",
	"Resident C011",
)

var/list/hallwayd = list(
	"Resident D01",
	"Resident D02",
	"Resident D03",
	"Resident D04",
	"Resident D05",
	"Resident D06",
	"Resident D07",
	"Resident D08",
)

var/list/hallwaye = list(
	"Resident E01",
	"Resident E02",
	"Resident E03",
	"Resident E04",
)


// Old

var/const/ENGSEC			=(1<<0)

var/const/CAPTAIN			=(1<<0)
var/const/HOS				=(1<<1)
var/const/WARDEN			=(1<<2)
var/const/DETECTIVE			=(1<<3)
var/const/OFFICER			=(1<<4)
var/const/CHIEF				=(1<<5)
var/const/ENGINEER			=(1<<6)
var/const/ATMOSTECH			=(1<<7)
var/const/AI				=(1<<8)
var/const/CYBORG			=(1<<9)


var/const/MEDSCI			=(1<<1)

var/const/RD				=(1<<0)
var/const/SCIENTIST			=(1<<1)
var/const/CHEMIST			=(1<<2)
var/const/CMO				=(1<<3)
var/const/DOCTOR			=(1<<4)
var/const/GENETICIST		=(1<<5)
var/const/VIROLOGIST		=(1<<6)
var/const/PSYCHIATRIST		=(1<<7)
var/const/ROBOTICIST		=(1<<8)
var/const/XENOBIOLOGIST		=(1<<9)


var/const/CIVILIANOLD		=(1<<2)

var/const/HOP				=(1<<0)
var/const/BARTENDER			=(1<<1)
var/const/BOTANIST			=(1<<2)
var/const/CHEF				=(1<<3)
var/const/LIBRARIAN			=(1<<5)
var/const/QUARTERMASTER		=(1<<6)
var/const/CARGOTECH			=(1<<7)
var/const/MINER				=(1<<8)
var/const/LAWYER			=(1<<9)
var/const/CHAPLAIN			=(1<<10)
var/const/CLOWN				=(1<<11)
var/const/MIME				=(1<<12)
var/const/ASSISTANT			=(1<<13)
var/const/JANITOR			=(1<<0)


var/list/assistant_occupations = list(
)


var/list/command_positions = list(
	"Captain",
	"Head of Personnel",
	"Head of Security",
	"Chief Engineer",
	"Research Director",
	"Chief Medical Officer"
)


var/list/engineering_positions = list(
	"Chief Engineer",
	"Station Engineer",
	"Atmospheric Technician",
)


var/list/medical_positions = list(
	"Chief Medical Officer",
	"Medical Doctor",
	"Geneticist",
	"Psychiatrist",
	"Chemist"
)


var/list/science_positions = list(
	"Research Director",
	"Scientist",
	"Geneticist",	//Part of both medical and science
	"Roboticist",
	"Xenobiologist"
)

//BS12 EDIT
var/list/civilian_positions = list(
	"Head of Personnel",
	"Bartender",
	"Botanist",
	"Chef",
	"Janitor",
	"Librarian",
	"Quartermaster",
	"Cargo Technician",
	"Shaft Miner",
	"Lawyer",
	"Chaplain",
	"Assistant"
)


var/list/security_positions = list(
	"Head of Security",
	"Warden",
	"Detective",
	"Security Officer"
)


var/list/nonhuman_positions = list(
	"AI",
	"Cyborg",
	"pAI"
)


/proc/guest_jobbans(var/job)
	return ((job in command_positions) || (job in nonhuman_positions) || (job in security_positions))

/proc/get_job_datums()
	var/list/occupations = list()
	var/list/all_jobs = typesof(/datum/job)

	for(var/A in all_jobs)
		var/datum/job/job = new A()
		if(!job)	continue
		occupations += job

	return occupations

/proc/get_alternate_titles(var/job)
	var/list/jobs = get_job_datums()
	var/list/titles = list()

	for(var/datum/job/J in jobs)
		if(!J)	continue
		if(J.title == job)
			titles = J.alt_titles

	return titles

