public class StateFormatter {
	
	public static State getState(String instate) {
    	
    	instate = instate.trim().replaceAll(' ', '').replaceAll('\\.', '').toLowerCase();
    	
    	if(instate == 'al' || instate == 'alabama' || instate == ('alab')) {
			return new State('Alabama', 'AL');
    	} else if (instate == 'ak' || instate == 'alaska' || instate.startsWith('alas')) {
			return new State('Alaska', 'AK');
		} else if(instate == 'as' || instate == 'americansamoa' || instate.startsWith('amer')) {
			return new State('American Samoa', 'AS');
		} else if(instate == 'az' || instate == 'arizona' || instate.startsWith('ari')) {
			return new State('Arizona', 'AZ');
		} else if(instate == 'ar' || instate == 'arkansas' || instate.startsWith('ark')) {
			return new State('Arkansas', 'AR');
		} else if(instate == 'ca' || instate == 'california' || instate.startsWith('cal')) {
			return new State('California', 'CA');
		} else if(instate == 'co' || instate == 'colorado' || instate.startsWith('col')) {
			return new State('Colorado', 'CO');
		} else if(instate == 'ct' || instate == 'connecticut' || instate.startsWith('con')) {
			return new State('Connecticut', 'CT');
		} else if(instate == 'de' || instate == 'delaware' || instate.startsWith('del')) {
			return new State('Delaware', 'DE');
		} else if(instate == 'dc' || instate == 'districtofcolumbia' || instate.startsWith('dis')) {
			return new State('District Of Columbia', 'DC');
		} else if(instate == 'fm' || instate == 'federatedstatesofmicronesia' || instate.startsWith('fed')) {
			return new State('Federated States Of Micronesia', 'FM');
		} else if(instate == 'fl' || instate == 'florida' || instate.startsWith('flo')) {
			return new State('Florida', 'FL');
		} else if(instate == 'ga' || instate == 'georgia' || instate.startsWith('geo')) {
			return new State('Georgia', 'GA');
		} else if(instate == 'gu' || instate == 'guam' || instate.startsWith('gua')) {
			return new State('Guam', 'GU');
		} else if(instate == 'hi' || instate == 'hawaii' || instate.startsWith('haw')) {
			return new State('Hawaii', 'HI');
		} else if(instate == 'id' || instate == 'idaho' || instate.startsWith('ida')) {
			return new State('Idaho', 'ID');
		} else if(instate == 'il' || instate == 'illinois' || instate.startsWith('ill')) {
			return new State('Illinois', 'IL');
		} else if(instate == 'in' || instate == 'indiana' || instate.startsWith('ind')) {
			return new State('Indiana', 'IN');
		} else if(instate == 'ia' || instate == 'iowa' || instate.startsWith('iow')) {
			return new State('Iowa', 'IA');
		} else if(instate == 'ks' || instate == 'kansas' || instate.startsWith('kan')) {
			return new State('Kansas', 'KS');
		} else if(instate == 'ky' || instate == 'kentucky' || instate.startsWith('ken')) {
			return new State('Kentucky', 'KY');
		} else if(instate == 'la' || instate == 'louisiana' || instate.startsWith('lou')) {
			return new State('Louisiana', 'LA');
		} else if(instate == 'me' || instate == 'maine' || instate.startsWith('mai')) {
			return new State('Maine', 'ME');
		} else if(instate == 'mh' || instate == 'marshallislands' || instate.startsWith('mars')) {
			return new State('Marshall Islands', 'MH');
		} else if(instate == 'md' || instate == 'maryland' || instate.startsWith('mary')) {
			return new State('Maryland', 'MD');
		} else if(instate == 'ma' || instate == 'massachusetts' || instate.startsWith('mas')) {
			return new State('Massachusetts', 'MA');
		} else if(instate == 'mi' || instate == 'michigan' || instate.startsWith('mic')) {
			return new State('Michigan', 'MI');
		} else if(instate == 'mn' || instate == 'minnesota' || instate.startsWith('min')) {
			return new State('Minnesota', 'MN');
		} else if(instate == 'ms' || instate == 'mississippi' || instate.startsWith('missi')) {
			return new State('Mississippi', 'MS');
		} else if(instate == 'mo' || instate == 'missouri' || instate.startsWith('misso')) {
			return new State('Missouri', 'MO');
		} else if(instate == 'mt' || instate == 'montana' || instate.startsWith('mon')) {
			return new State('Montana', 'MT');
		} else if(instate == 'ne' || instate == 'nebraska' || instate.startsWith('neb')) {
			return new State('Nebraska', 'NE');
		} else if(instate == 'nv' || instate == 'nevada' || instate.startsWith('nev')) {
			return new State('Nevada', 'NV');
		} else if(instate == 'nh' || instate == 'newhampshire' || instate.startsWith('newh')) {
			return new State('New Hampshire', 'NH');
		} else if(instate == 'nj' || instate == 'newjersey' || instate.startsWith('newj')) {
			return new State('New Jersey', 'NJ');
		} else if(instate == 'nm' || instate == 'newmexico' || instate.startsWith('newm')) {
			return new State('New Mexico', 'NM');
		} else if(instate == 'ny' || instate == 'newyork' || instate.startsWith('newy')) {
			return new State('New York', 'NY');
		} else if(instate == 'nc' || instate == 'northcarolina' || instate.startsWith('northc') || instate.startsWith('ncar')) {
			return new State('North Carolina', 'NC');
		} else if(instate == 'nd' || instate == 'northdakota' || instate.startsWith('northd') || instate.startsWith('ndak')) {
			return new State('North Dakota', 'ND');
		} else if(instate == 'mp' || instate == 'northernmarianaislands' || instate.startsWith('northernmar') || instate.startsWith('nmar')) {
			return new State('Northern Mariana Islands', 'MP');
		} else if(instate == 'oh' || instate == 'ohio' || instate.startsWith('ohi')) {
			return new State('Ohio', 'OH');
		} else if(instate == 'ok' || instate == 'oklahoma' || instate.startsWith('okl')) {
			return new State('Oklahoma', 'OK');
		} else if(instate == 'or' || instate == 'oregon' || instate.startsWith('ore')) {
			return new State('Oregon', 'OR');
		} else if(instate == 'pw' || instate == 'palau' || instate.startsWith('pala')) {
			return new State('Palau', 'PW');
		} else if(instate == 'pa' || instate == 'pennsylvania' || instate.startsWith('pen')) {
			return new State('Pennsylvania', 'PA');
		} else if(instate == 'pr' || instate == 'puertorico' || instate.startsWith('pue')) {
			return new State('Puerto Rico', 'PR');
		} else if(instate == 'ri' || instate == 'rhodeisland' || instate.startsWith('rho')) {
			return new State('Rhode Island', 'RI');
		} else if(instate == 'sc' || instate == 'southcarolina' || instate.startsWith('southc') || instate.startsWith('scar')) {
			return new State('South Carolina', 'SC');
		} else if(instate == 'sd' || instate == 'southdakota' || instate.startsWith('southd') || instate.startsWith('sdak')) {
			return new State('South Dakota', 'SD');
		} else if(instate == 'tn' || instate == 'tennessee' || instate.startsWith('ten')) {
			return new State('Tennessee', 'TN');
		} else if(instate == 'tx' || instate == 'texas' || instate.startsWith('tex')) {
			return new State('Texas', 'TX');
		} else if(instate == 'ut' || instate == 'utah' || instate.startsWith('uta')) {
			return new State('Utah', 'UT');
		} else if(instate == 'vt' || instate == 'vermont' || instate.startsWith('ver')) {
			return new State('Vermont', 'VT');
		} else if(instate == 'vi' || instate == 'virginislands' || instate.startsWith('virginis')) {
			return new State('Virgin Islands', 'VI');
		} else if(instate == 'va' || instate == 'virginia' || instate.startsWith('virginia')) {
			return new State('Virginia', 'VA');
		} else if(instate == 'wa' || instate == 'washington' || instate.startsWith('was')) {
			return new State('Washington', 'WA');
		} else if(instate == 'wv' || instate == 'westvirginia' || instate.startsWith('wes') || instate.startsWith('wvir')) {
			return new State('West Virginia', 'WV');
		} else if(instate == 'wi' || instate == 'wisconsin' || instate.startsWith('wis')) {
			return new State('Wisconsin', 'WI');
		} else if(instate == 'wy' || instate == 'wyoming' || instate.startsWith('wyo')) {
			return new State('Wyoming', 'WY');
		}
		    	
    	return null;
	}
	
	public class State {
		
		public String statename {get; set;}
		public String statecode {get; set;}
		
		public State(String statename, String statecode) {
			this.statename = statename;
			this.statecode = statecode;
		}
		
	}
	
	static testmethod void testAllStates() {
		
		System.assertEquals(StateFormatter.getState('alabama').statecode, 'AL');
		System.assertEquals(StateFormatter.getState('Alaska').statecode, 'AK');
		System.assertEquals(StateFormatter.getState('American Samoa').statecode, 'AS');
		System.assertEquals(StateFormatter.getState('az').statecode, 'AZ');
		System.assertEquals(StateFormatter.getState('arkans').statecode, 'AR');
		System.assertEquals(StateFormatter.getState('Calif').statecode, 'CA');
		System.assertEquals(StateFormatter.getState('co').statecode, 'CO');
		System.assertEquals(StateFormatter.getState('Conn').statecode, 'CT');
		System.assertEquals(StateFormatter.getState('Delaware').statecode, 'DE');
		System.assertEquals(StateFormatter.getState('Dist. of Colombia').statecode, 'DC');
		System.assertEquals(StateFormatter.getState('Fed. States of Micro').statecode, 'FM');
		System.assertEquals(StateFormatter.getState('florida').statecode, 'FL');
		System.assertEquals(StateFormatter.getState('georgia').statecode, 'GA');
		System.assertEquals(StateFormatter.getState('guam').statecode, 'GU');
		System.assertEquals(StateFormatter.getState('hawaiiiiiii').statecode, 'HI');
		System.assertEquals(StateFormatter.getState('idaho').statecode, 'ID');
		System.assertEquals(StateFormatter.getState('illisnosis').statecode, 'IL');
		System.assertEquals(StateFormatter.getState('INDIANA').statecode, 'IN');
		System.assertEquals(StateFormatter.getState('iowa').statecode, 'IA');
		System.assertEquals(StateFormatter.getState('kans').statecode, 'KS');
		System.assertEquals(StateFormatter.getState('kentucky').statecode, 'KY');
		System.assertEquals(StateFormatter.getState('lou isan aa').statecode, 'LA');
		System.assertEquals(StateFormatter.getState('me').statecode, 'ME');
		System.assertEquals(StateFormatter.getState('marshall').statecode, 'MH');
		System.assertEquals(StateFormatter.getState('mary').statecode, 'MD');
		System.assertEquals(StateFormatter.getState('MASSACHU').statecode, 'MA');
		System.assertEquals(StateFormatter.getState('Mich').statecode, 'MI');
		System.assertEquals(StateFormatter.getState(' mn').statecode, 'MN');
		System.assertEquals(StateFormatter.getState('mississississippi').statecode, 'MS');
		System.assertEquals(StateFormatter.getState('missouri').statecode, 'MO');
		System.assertEquals(StateFormatter.getState('montana').statecode, 'MT');
		System.assertEquals(StateFormatter.getState('nebrask').statecode, 'NE');
		System.assertEquals(StateFormatter.getState('NV').statecode, 'NV');
		System.assertEquals(StateFormatter.getState('new hampshire  ').statecode, 'NH');
		System.assertEquals(StateFormatter.getState('new jers.').statecode, 'NJ');
		System.assertEquals(StateFormatter.getState('new mex').statecode, 'NM');
		System.assertEquals(StateFormatter.getState('ny').statecode, 'NY');
		System.assertEquals(StateFormatter.getState('n. carolina').statecode, 'NC');
		System.assertEquals(StateFormatter.getState('n. dakota').statecode, 'ND');
		System.assertEquals(StateFormatter.getState('n. mariana').statecode, 'MP');
		System.assertEquals(StateFormatter.getState('oh').statecode, 'OH');
		System.assertEquals(StateFormatter.getState('oklah oma').statecode, 'OK');
		System.assertEquals(StateFormatter.getState('or').statecode, 'OR');
		System.assertEquals(StateFormatter.getState('pala').statecode, 'PW');
		System.assertEquals(StateFormatter.getState('penn').statecode, 'PA');
		System.assertEquals(StateFormatter.getState('pue').statecode, 'PR');
		System.assertEquals(StateFormatter.getState('ri').statecode, 'RI');
		System.assertEquals(StateFormatter.getState('s. carolinaa').statecode, 'SC');
		System.assertEquals(StateFormatter.getState('s. dakota').statecode, 'SD');
		System.assertEquals(StateFormatter.getState('Tennessee').statecode, 'TN');
		System.assertEquals(StateFormatter.getState('TX').statecode, 'TX');
		System.assertEquals(StateFormatter.getState('ut   ').statecode, 'UT');
		System.assertEquals(StateFormatter.getState('vt').statecode, 'VT');
		System.assertEquals(StateFormatter.getState('virgin isl.').statecode, 'VI');
		System.assertEquals(StateFormatter.getState('virg inia').statecode, 'VA');
		System.assertEquals(StateFormatter.getState('washington').statecode, 'WA');
		System.assertEquals(StateFormatter.getState('w virginia').statecode, 'WV');
		System.assertEquals(StateFormatter.getState('wisc').statecode, 'WI');
		System.assertEquals(StateFormatter.getState('wyoming').statecode, 'WY');
		
	}
	
	static testmethod void testNoStateFound() {
		
		System.assertEquals(StateFormatter.getState('Somewhere'), null);
		
	}

}