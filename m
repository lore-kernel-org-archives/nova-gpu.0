Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.43.63
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794352923;
	b=ekkQ1ktNeQjBLhoB8x9ul4b+R1/1vZbDTdAhGjOuN2AuyX+ciw9HKBPoIvBbLzs/nWfl
	 Nx/YsxX5WKbIH0NUg62JuNbZn4nNinPnN14up0+g3uCp4HTiPgp0+D+8AHmyh6mJsb5ZS
	 LRUW55e0vgXL1Tpg//ALerxMrdWZHqwn/HJk40YWtx0YQKNGvx+iINP64BCCwwxDqyCuK
	 5dYLlJtwX3RFmtzeJtPJMIqaJ6R21rECsMEiWoeTkzbHG5kBHr8Upx24zAS7ZFCnMweW7
	 nIrGF8JFAtNzzNSI9uJKTioV9WZsc0KTK+oLIS5a8zLl328wTmjLVws4O9Z6mtfi2uA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794352923;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Subject:
	 Thread-Topic:Thread-Index:Date:Message-ID:References:In-Reply-To:
	 Accept-Language:Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
	 user-agent:x-ms-publictraffictype:x-ms-traffictypediagnostic:
	 x-ms-office365-filtering-correlation-id:x-ms-exchange-senderadcheck:
	 x-ms-exchange-antispam-relay:x-microsoft-antispam:
	 x-microsoft-antispam-message-info:x-forefront-antispam-report:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:Content-Type:Content-ID:
	 Content-Transfer-Encoding:MIME-Version:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
	 X-MS-Exchange-CrossTenant-userprincipalname:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=z4huStTD++zmYHTh5p+PsDSSkjKs73S35qJ7x47a/KI=;
	b=zSMf0M+o+fOnya9kQvTnpikM4tRxdIK1jKhqL5pjABCxKUk+cXS7RZU+GiW8nzPog/nY
	 e9bM5Jv7gOjzW2OtV7qewRcjdrCDRTtQXQH35mVkAgJLYAadylSP6L6mE66bh0PJa8r1h
	 XoUwiR9LwFUeZgGTdHK5qd1yGRRYUNZH5v6QXYy6yrvQRgPPgFCgiZXMghbPkLcuWER0m
	 n8xPIrySf6CfpF9oLG/+kuv51pcJ7VD4dZiGNqStnDP15mtUjgfdyXfI7A/T7mCrVl9Ix
	 JkIp/8Vb0ddujps2aT2ISfp2Rg18s3mFWLao5IbDStDJiQ2CjWVZO99foj3R0jLSCUg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=UP5f1+AF;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.43.63
Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012063.outbound.protection.outlook.com [52.101.43.63])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A44F606A31C
	for <nova-gpu@lists.linux.dev>; Tue, 10 Nov 2026 23:22:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4A44F606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=UP5f1+AF
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OiaAElRJkat4bI3DLn488bhM/2xJsmwUInAG5WYr8Ety1DgVwsU9jIYwOO7jMUr+sRvCdT2hwcT+bjKs7uaek7g6eHvopyuZJYBhSEFF2sgetKk307CO41v6ys4nz0SIZ0ZSPm1++dVJW3RbWV3EzBQDk8B7nyoUUHvQncfQ9E989WeOt6zNKErgl5iNI4oOuJvyBq/lDeTJWXC+zpmTOz58DwukB/VlmEHWdhmM1RAkdludRreYJ5sw3u5Hi75VZWab+a9SWlRrY4BnxrH6MjfoKt/89VTycQTeEkUnWm5P0yqosBhXel48UwYdAft70LPxCwL6ewg+Tl17P28qWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z4huStTD++zmYHTh5p+PsDSSkjKs73S35qJ7x47a/KI=;
 b=uLGv8RZcy2XZSPLMZ3qTvPMUyAZoDhJKA1cc55sWTNgJPf1BZOvqZyv4BSd39pXS7qZh/SfjuJMpmvu7QjrVwLUjDXgL15t4hNF7a5ubu8VW7J1D08wgDqYyz5duJ+zksT1tYkJ68VgC59FOd5FM3FaXMIcvu5pfIqoCWhmpmGuyvg5ASuYFmEQxKkGVMzLO7pCS4yZkiErWR7l4oZ8/IBBpOT4DJ9sxRxeszZpvtUxGirEddYJLMLzhlGNwILkDhfr+4Rhr9TAIwONBHcwQaWAwadHikTyTnCEEYoEQY5YlgWsGKSEHUfauwOYC20Igd/Vq4smf/ADBN+Kx6cp+0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z4huStTD++zmYHTh5p+PsDSSkjKs73S35qJ7x47a/KI=;
 b=UP5f1+AFh+0Bmq5BLUMqs32ckJWfj1iEr2CYXvQgmPMXhoppxzAJ4NKigsrz5OH9nk00g0+DzNBp912viqamxbJC01zkSp1RcMgK0+lbRQ6pMM75mz1OAz7WOPZtAaGEI1DSSzZDD2tcueNjMiAtCerLYEgPVznu68vVWKicTDUeAMfj09pSlMLKZY4fHvcizqHymQYxFsbx3ZLSWJTRRiKQe+uF4RaBHZEI5R/kdxWCgKH3UfbMB1PWxhno9CjnXGdyGsLavJ4UuXvxIh3+4n4iqyQ4Ym5taPPXKVEfMImlDkEaDADD8QRhtkuRvdW21yj/2Nscgn3e1lMCdMX3Vg==
Received: from MN6PR12MB8568.namprd12.prod.outlook.com (2603:10b6:208:471::19)
 by PH7PR12MB6000.namprd12.prod.outlook.com (2603:10b6:510:1dc::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.11; Tue, 10 Nov
 2026 23:21:58 +0000
Received: from MN6PR12MB8568.namprd12.prod.outlook.com
 ([fe80::f13:fa29:e7b3:4d3a]) by MN6PR12MB8568.namprd12.prod.outlook.com
 ([fe80::f13:fa29:e7b3:4d3a%4]) with mapi id 15.21.0615.007; Tue, 10 Nov 2026
 23:21:58 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "nova-gpu@lists.linux.dev" <nova-gpu@lists.linux.dev>, Alexandre Courbot
	<acourbot@nvidia.com>, "dakr@kernel.org" <dakr@kernel.org>, Eliot Courtney
	<ecourtney@nvidia.com>, John Hubbard <jhubbard@nvidia.com>
Subject: Re: [PATCH 0/5] Transition nova-core to use TLV variables for heap
 sizes
Thread-Topic: [PATCH 0/5] Transition nova-core to use TLV variables for heap
 sizes
Thread-Index: AQHdcWjR4ZSoJhVZgUOt/6QWbwzJBbcn8bwA
Date: Tue, 10 Nov 2026 23:21:58 +0000
Message-ID: <f1f132172061996beb4b5d64ebc68e4a6bb0a1e2.camel@nvidia.com>
References: <20261110231053.1352163-1-ttabi@nvidia.com>
In-Reply-To: <20261110231053.1352163-1-ttabi@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.56.2-9 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN6PR12MB8568:EE_|PH7PR12MB6000:EE_
x-ms-office365-filtering-correlation-id: a4ee484e-f748-4b02-46a9-08df3f816a97
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|22082099003|18002099003|10067099003|38070700021|11063799006|56012099006|261028144727099003|261022105027099003|261021121427099003|261026140227099003|261009223027099003|261102123227099003;
x-microsoft-antispam-message-info:
 48UhXQrOKX/RDvsGUQHk9at6WToV2Y/U3TXHJNqudlUmkZAe25SSJMVDenllRST4S7TTii4W61ISJ9mocEaE0qbHjvZBg3DCCv/EioDl+DBWMxJUSx7AcNPzcOTetuMIm80kZYONe2DtjADTILaaZ/3Yymq2VgTWOo0S4rlzKKwQo38xE02T0Ox6nxpZQlGr82cGVgpskcTH7YzegpL8Mcui6FAsjaxDdNiYVPXJT1eUBOmfhyazRpyv78TUbgM9+uHAJeTsetR4shE3g8zfYzZBoy354yFi6Qc4dQoPT4+zd8jVlAQvM+nb4Uo3ZBkPYm/M3ocKpckqc1H8mLYlIsHnBDqEH2c4vu2z3X319ryTjnsTUWutD9URF6KDelaM5pwNF9qir0gWUV4ASV9FQbaJ973/yKm5nIwv1Psj2SO/XYlKQfu66mLoaKKpWkFZbB6FGwvUqm6MYpWdeQOREJnWkvDzQHAa4uuWdBOI+zOKYOl/f3bgqlczm5sRYZa2n3I5nML+z/Gci4wrWhjptnJ+YpPstg/lJZUq3dMtGzGm2Zjbd7eesVH89eBr7sbnsPkXhjKSQe+DlynQt0VtKY6dU2AQFF8zImYBPBsfkM+g0bZeJ9y5zX70dZc+TXpVIqxNvRNaaUFH6xF1hHuylfcBcy8X+A9yPTnDJCtYpq7kODenAwDY6RViVaagZeTwAPh3uHMINSnct42O2OL/pdivFkRruvCmcV5N/yYWCIo=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN6PR12MB8568.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(22082099003)(18002099003)(10067099003)(38070700021)(11063799006)(56012099006)(261028144727099003)(261022105027099003)(261021121427099003)(261026140227099003)(261009223027099003)(261102123227099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ZG5aTjV3ZjVxYmt3eTA0UHpLUERiMkg3ZENiS0NtNERVT004R05xWTlWd2JK?=
 =?utf-8?B?U0czSm93eEFkVFBvNXg3blhkeUpSVmFzT0FlNitIV0hzelF3R2l6cktKNHNF?=
 =?utf-8?B?Qm90SG8yRlFmeGsvaDBOeUJzZFAzdXl4cUVBcEU4TW9ETTR0bGwwaHFmQS9j?=
 =?utf-8?B?d0c1eGFGejBkV1VCRml2dGI5aFNrdFFjQi82clk0YTBDUXVMN0pyOEhhTGxr?=
 =?utf-8?B?aTRCM1pyM1BlZGVBOEk5bDRVdGxtREVQMHMzWkF5dnVENjRqZGJ6TzQ3eHBF?=
 =?utf-8?B?NXdDUnhlVXorTmI2YThETGVPNmhOMHdhdjNuS1BCenk0Qmg5VXQ0dENIOEc2?=
 =?utf-8?B?bXY0YmhBQUtVRkFHank5QWREWGQ0T3NFLzBQVlZJVHFPd2RXQ1h0dVk1RlNF?=
 =?utf-8?B?YjRSRmtUbTRpejdlcmxzMTA2TDM4MTgySmUxNmppdzJLWlNHQko1bHVsRmRZ?=
 =?utf-8?B?eXp5Y2szS2ZrWHd6Y2tSVXJ3MXZxTzZrTmhNMk1tdUhjNXBvQWRZYWp5cFNt?=
 =?utf-8?B?R1lNL1JrYjBmdlc1U0JOR2tpRWxsb1lzbGEzMS9sVzNxemlObWJZLy9CaUNZ?=
 =?utf-8?B?c1VsRXVjbkRHWGhOcnpUZVVWanZ3cVgwNDJ6TGxsY0k3S0FCODhaZ2EwdFJk?=
 =?utf-8?B?WU5YdkxaRzlocXBabXdHOVZUci9wdXd4OElEaWZWZktpV2xkVlVFV1pGU0w2?=
 =?utf-8?B?aTVWYXlPZzN6YlNGK3lyK0wyK0xKOUVqTkQwMjdUL0owU1k2b254VGxaTzA2?=
 =?utf-8?B?OFh6V01JQ3laRjhjMXVXb3liK0U1VFUwVVl4bVVYWVhSbWZWT0FQYnZaZjl4?=
 =?utf-8?B?MCtTeW5oMnA3VkcrVGQ4RHI2TmtkZi90b3M3SWdwU3o3NGRNWTBqcVR3dy9w?=
 =?utf-8?B?ZzhHb2lhN2djdVd6ZWRiRGdNNVVPVGtRVDdmMEcwVGhZVVdZU04zNkhxNDhN?=
 =?utf-8?B?K29pM0x3VmxjbFBMUmJqQjkxajQxYzlFWkhMVEJlNjdNYlNzbmlCNEp0VUZP?=
 =?utf-8?B?L29XL045bkp2QnR6NzlhdTRGUlpUTEhvY0Q4cEVVTXRiVWVxNWdqWlZsU1lO?=
 =?utf-8?B?V0FWL2ExUXR5RGY4YzBsZGdjb1hwZ1V1d0JOUnJZRzVoTHpkdDA3a3RKV1gz?=
 =?utf-8?B?UGM2OXJZbURTZW40MnJwZEVqYnVHQ0U4NFRsYjVuNG8vYVoyL0poNlVEakZV?=
 =?utf-8?B?RG9kUXc3WkZHT09zUUJNalN4cnVTT3pwMysveTZkTTdoaEhlSW1iRFRyYnJG?=
 =?utf-8?B?MkJKR2EvY0laOHd0Um8xbTIvQ3MySmtsOUJiT1VWTDRuMUY5NHNGQjFsaHAx?=
 =?utf-8?B?UEYya09FWG1nck41S2VSb1puMngxSmFQY0FSK2JDV1Z0dHVhL0hsRWcySnhI?=
 =?utf-8?B?bHZkdHpWSHduWDRORGt5MlRTK0YzNnBicXNlaVQ4MzZaVFgrUDFjeGZPTERN?=
 =?utf-8?B?VXpQZTF3VEllSW5CV0VYNmJIQUE5SDB1VythSEZ6R0pwT2RJOUo5VTNVVTc3?=
 =?utf-8?B?N0U4bjIyY2JBWG5JcmgycnczakZlY0N6QXpUUEJXRnNuajk0VTBmTlpyYkpu?=
 =?utf-8?B?cEJHaGxQNW1vNmRGV0dYdDRNQVlZSTVTOUlScmpKQ01Tdkg0Qkx0WUl6dmNu?=
 =?utf-8?B?WEZNTGNwMmZXZlBLTmdMMUxrWWY0dGRXQm91bU40aGVna2d1NUpuUG1oVWhq?=
 =?utf-8?B?V01udGNRRm1oQU9rWDF0dXhUd3BYRkFZUUJtaC9YaDR4MHFnWVhxN21PdUdi?=
 =?utf-8?B?N3o1SEZPY016aVVvZVNnSVVMOStwM2F1K1lDeTNNaHdMLzVycmRZQVBPVmxX?=
 =?utf-8?B?elBqYjRvbmhoc2dsMVMxYUJyL0pzV3FpV2dZTFVhUlFab2dUTEM0dXgvS1dM?=
 =?utf-8?B?WEJHQlB2QzlhTHlVUU5qYnNLa042ZHNkN21XM2p4Um5VdnlKbE82UGJZdEta?=
 =?utf-8?B?Sjd1SDR3OGpkVGkvS1RwWDc5MktBUnBabks5OW8wVmIrTVJrQW1iS3NYbFpN?=
 =?utf-8?B?Y0tQTGExQjJTdnNBZWI4UE5nUEJ5bXc3bDkzYzkvdFJKVVJsU2JoNzZidUZL?=
 =?utf-8?B?alZTSFVyNzREMms2MExoNFB0UGo4Q1hzTzVKN3ZtUVV2Y001U2tXclFxSXR3?=
 =?utf-8?B?M0JyVS9wczRFNWJvRm5QaU5Oako1aFlqb2ZxdEdsb2VEWU9GME8zSEd4SDJT?=
 =?utf-8?B?TDl3MmtzamdkL05lZzZOWklxOEZwTXlzalVUeVdteklKczJyTnNDbGI5eFJF?=
 =?utf-8?B?blljVGtvTUlGRm5YbUhQeVRyZ2xHNVMvT09GUHVVYzRHWHI3TjEzMVRCaEhM?=
 =?utf-8?B?d3NHNjdaYnViT2NKY3pnT05XaHZzNnk5QXFNREJzMTRoTXRxL2hsZz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1F1A6A8B4BD6F549A309D50A5A4F83AC@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Post: <mailto:nova-gpu@lists.linux.dev>
List-Help: <mailto:nova-gpu+help@lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
List-Owner: <mailto:nova-gpu+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN6PR12MB8568.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a4ee484e-f748-4b02-46a9-08df3f816a97
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Nov 2026 23:21:58.1185
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hX4gInEDftcQYhy6xqaVd2t+NJFM5YtNqnUkvlpZBCuUCLe8OHU8ot4rr7DUUiV6elflM+vXlUVp5UuDdRh9fg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6000

T24gVHVlLCAyMDI2LTExLTEwIGF0IDE3OjEwIC0wNjAwLCBUaW11ciBUYWJpIHdyb3RlOg0KPiBT
dGFydGluZyB3aXRoIHI2MTUsIHRoZSBHU1AtUk0gZmlybXdhcmUgVExWcyAoaS5lLiBnc3AudGx2
KSBjb250YWluIGFuDQo+IGFuIGFkZGl0aW9uYWwgc2l4IHZhcmlhYmxlcyB0aGF0IHRoYXQgc2hv
dWxkIGJlIHVzZWQgdG8gY2FsY3VsYXRlIHRoZQ0KPiB2YXJpb3VzIGhlYXAgc2l6ZXMgdGhhdCBH
U1AtUk0gbmVlZHMgaW4gb3JkZXIgdG8gYm9vdC4NCj4gDQo+IFRoZXNlIHZhbHVlcyBhcmUgc3Bl
Y2lmaWMgdG8gZWFjaCBHUFUgYW5kIFJNIHZlcnNpb24sIGFuZCBhcmUgb2J0YWluZWQNCj4gYnkg
c2NyYXBpbmcgdGhlbSBmcm9tIHRoZSBPcGVuUk0gc291cmNlIHRyZWUuDQoNCkkgZm9yZ290IHRv
IG1lbnRpb24gdGhhdCB0aGlzIGlzIGJhc2VkIG9uIEFsZXgncyByMDAwX3JlYmFzZV9hbGwgYnJh
bmNoOg0KDQpodHRwczovL2dpdGh1Yi5jb20vR251cm91L2xpbnV4L3RyZWUvcjAwMF9yZWJhc2Vf
YWxsDQoNCg==
