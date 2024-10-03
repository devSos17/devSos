export interface Experience {
	start: string;
	end?: string;
	title: string;
	company: string;
	location: string;
	modality: string; // this should really be an ENUM...
	activites: string[];
	skills: string[];
}
