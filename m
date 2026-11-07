Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.56.36
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794044925;
	b=FhAD2E0DV0RpdKumEYV8jYbnWeNNVl9FL8slI56IZxE2neuFeorpQ6eZX8g/Cd9SIM7W
	 j3QOX9j1KToHhRvUeXIkHzxnO5GcfY5ESQ424VgDgM3Z0+PP0KT7NeSx4dbHuvDVDZTBT
	 F/aKaDtKHeujXbtT3pv3UpO5KAprnq/mAfMbJshVOUXeHeQpa0Y4rvYGS+qNGsU6QEPtk
	 A1LAEgr/Wp3o8XzffSmiKuI3PZWvoQc4ntiz9p6yO+NhpCt10gcYYC46PvfCHibANEl6u
	 mgzd2TCKd97rGiuSCOB5q7AE2ofONltdBLqtS13xjqzi4NVIt6BGjCy4ramEA0v/qBA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794044925;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:Date:Subject:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:
	 X-MS-Exchange-AntiSpam-MessageData-1:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=5f6itDKsiz0dRIwfeZ+c5zlt6fqSfGn1ZQnII+JassQ=;
	b=vryGoQ9J+pNyS4W/BsWTFZ0Pk2haBUS1Urdf4VOaJmwfZgLRpySG6oOxR58wfmlNvSO+
	 pin36vJqBSju+KsAJyVy/y1ZyFwNdB9ZxPxYSJ2GNxvACdGsrEP/E2NOk7dDZdMi+i4no
	 x5VtdstO2yZ3UqI7ToDAsywSFJxVCRApu8FkcUXcqKgx/nA212/obDw2g0thqnWxlUEPI
	 dWo9AOxAycjhHswh4x1NhZvc5V18DKW3iE7556AgAagmfKT47r1C7BW/ASkEuJM2xtwK3
	 p3wGmaVJdu8Ldf2yQ5ZGmWcMpm8MZUh8qKk4efVomO1nmra3P6dMjYXvrKktuSuIcAQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=OFmWuQjD;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.56.36
Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010036.outbound.protection.outlook.com [52.101.56.36])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97D0F606D806
	for <nova-gpu@lists.linux.dev>; Sat,  7 Nov 2026 09:48:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 97D0F606D806
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=OFmWuQjD
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tPwjyhW9A3pI5Tba66RtLQ2x8KJ9u0ksOmPhHUsZ+uZKMqZTgo1ama5niys9t4EjYU4ajmXV4LVianQmH4G/uF1kSyDaoYbBTnRnhcPHOxTjAUAbjESuty7i9vgv7GQclnCLhNUZ/AJePTf1htp41zh0IbCxNqdB0ZK2V4Di/ikQWf/wQR2tO/tcAGfZL2WveZ7Uk1CuWu7+khsHM7qL9rcbD5gAm9gHyuHqtNfgQp9LWJ5wFtNzhx66+gjfNq8NK7QSMBW8MU0riHRWlGVvYbZ+BlQYe098lerf17nrfTUehGkr05NzQToKmxUIe5OMlmUCXcNr6zWYHxAFK97Sug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5f6itDKsiz0dRIwfeZ+c5zlt6fqSfGn1ZQnII+JassQ=;
 b=k4jBdWRJy4C/FarHt0wkVEQJH8HF4tliYpmnFCW0lYwp6/KDnxNOtCV40THV4xJxjq2gF40FeChUFs/iwly7h5Lx0RyPYYlOZYHfCt04LocTkcRqY8vlAaYpovW9Uq8cT5Qg3keRKg8ijVY9qdIhmpVOebCMk8bHDGiK7oI7vMvT7IO2bxDwS9pxkVk/HqH3Pa1zArdwEPrrfdYO7hA/B1m05bU7etg+rmi7x1vqc66+J+MJ3Mrejdb6dIK/PTO4KMTO/E3W2G3PTNGZEgYCW2HZ163KnHkHdTltpH+9Q2kh1skllUe/Tdi/yrUs/vjvZihhNtuaWxRbhRtREZjWTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5f6itDKsiz0dRIwfeZ+c5zlt6fqSfGn1ZQnII+JassQ=;
 b=OFmWuQjDvv5q07ybafifCM8zcu3M/CHyQB1GLgO/KtLHGj9BWvgdo/a+EtfeotA9ggXtW/A+Os+OlEE7Xhibqgji6TpkzHEsdB2KOJZjWihKoAALOYlbbUY4IbfQz+e0tjNVQ5nFgnrjZ7zWZoe2JZQRBTtkLBfYTjAH6gcP6yLyEqtkpAxCYaZMBX2FsAtZKt7OzBWZMeTmzGOII1gBENz54mAPx65J/lDO9cnRK+kKLqCvFhzAdcz5eWK/YdccNCTXlKKINLyTg3phztSONi+eukpLhZQP4GIB6n4SNwjjgWrDmd1aD7dAU/474pkX++wbOXYB+q2837GTKOc7fw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MW4PR12MB6873.namprd12.prod.outlook.com (2603:10b6:303:20c::17)
 by DS0PR12MB8269.namprd12.prod.outlook.com (2603:10b6:8:fd::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.11; Sat, 7 Nov
 2026 09:48:22 +0000
Received: from MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1]) by MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1%5]) with mapi id 15.21.0592.007; Sat, 7 Nov 2026
 09:48:22 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Sat, 07 Nov 2026 18:47:57 +0900
Subject: [PATCH v2 01/12] gpu: nova-core: separate the generic falcon
 bootloader from FWSEC
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261107-r000-fw-v2-1-fb37cc5b20cd@nvidia.com>
References: <20261107-r000-fw-v2-0-fb37cc5b20cd@nvidia.com>
In-Reply-To: <20261107-r000-fw-v2-0-fb37cc5b20cd@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: John Hubbard <jhubbard@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Eliot Courtney <ecourtney@nvidia.com>, Zhi Wang <zhiw@nvidia.com>, 
 nova-gpu@lists.linux.dev, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: OS0P286CA0025.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:9d::12) To MW4PR12MB6873.namprd12.prod.outlook.com
 (2603:10b6:303:20c::17)
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Post: <mailto:nova-gpu@lists.linux.dev>
List-Help: <mailto:nova-gpu+help@lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
List-Owner: <mailto:nova-gpu+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR12MB6873:EE_|DS0PR12MB8269:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a2bb2b6-cb53-4fa1-fc11-08df3cb442d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|10070799003|376014|23010399003|18002099003|22082099003|10067099003|6133799003|3023799007|11063799006|261026121527099003|261102123227099003|261022113327099003|261021123027099003|56012099006|261021121427099003|261022075727099003|261022115727099003|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	QtjVJ2tPU2hBdEAwpHgHi6Sfsan3/X8oMrAGihhXzwXqzKki2Ic1/1QF8WZOw6GefdzlVmdqFxm0Pyk/jFbqpiYHjNogV14v9xRKpAs8n4PXsA9FIS7p+BfFRBkC1FD/BRVm9a03TTWcDWha7u5yVdOnFKpzDDzTTBi5JRDSuZBStSqZ8AQ5C1hRC+mXKKmW5tuzamsvjLcBXpZAd2wUemRA8favWkpcMSPFL7DJ3YZIq4cFF7roA7/D0r45tM1o2ckw+ORSJLQMW5NJBgt7N8IDCrjjfbXAbwlxdhw7buXGlkVRpET9ni/MzbBriUV/c5BRNSsYvH9tSI2sK5ufOmHuOfwyJi/kzvOxQfTlqASbQ93nwD/wyivrZVVTUGg7hlabXpXjPAml4oNl0rajK47FggoYbxXtb/hrNitd4uFk7zvhjGEZ5B74lT1o6aRzcCnSwmQTSIzRoR4gHJ2eXlVQGwpIb23/b0d54h67RcWDMhynybkb4e/YT/WaoJoKiqMVxBDBsjS4T+1G3jMmh93JfTyBXZxP83qMQW91a3Opj1y2S0Hxz9acWEvIXrBG7ArZJDzLuVRRxyVnjGBbbaochVsS+yyZaTVFMFUgoguodU4VSeR5RxEBNQ/k4P/p/eqYbzhVmPM1+f8FNr+don6Q0HCsDfc5TdmRq4OR+No=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR12MB6873.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(10070799003)(376014)(23010399003)(18002099003)(22082099003)(10067099003)(6133799003)(3023799007)(11063799006)(261026121527099003)(261102123227099003)(261022113327099003)(261021123027099003)(56012099006)(261021121427099003)(261022075727099003)(261022115727099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZkhXRExhcnpTTG5HUnV5V2RVVzJCTmpOY05paFB3UitTTTFISWxMcUREQld5?=
 =?utf-8?B?M2UwWGhYdGtvL3lhVFY3b1E3RHEvQkFqM2tBYkxpeWZ3V3huanZUUlpiSEdl?=
 =?utf-8?B?R2N4VnJteVBsbHZIVzgweEZEQ2YrZ0c2YnMzVHVrSFdqYzRrU3phWDE2TGpE?=
 =?utf-8?B?Mzdkb2Z2NDJUVm9Xc1Rud1dzQzltamxwR1BYOEUyakZ2SU1GOUdGU3hoSHdn?=
 =?utf-8?B?NXVoNHlITnRiR05lU2JtZkZBSDl0eklsMWM5M1NVZURab1libHpDcTBHVUp3?=
 =?utf-8?B?MFA0SEEyaHo3NGFqQWxIaVkvRVhiVU8wSkVmN3JINmh0dzVxQkljbklWVXcy?=
 =?utf-8?B?ZC9qeFNYSUFFMFZRaklxWkZmUk5JTnNYM2JjbzZmSFlWS2VVZngwVGNCYjNC?=
 =?utf-8?B?aWc1dUpycVdyUStuTTl2b2YyL2M5LzRsNFViamdnbzYzT2tNUi9UbVB3NFlX?=
 =?utf-8?B?dW9QOXBKczd1U2RwdWtlL1lPMjRhNEpFYmNveVVkS1FlM2dWY1VHazlsTXly?=
 =?utf-8?B?WTFOSGpISEg2YnVTb0dJbkxvM241d3VOL2NpekN3VnhURWxIKzR1bGxwcDRy?=
 =?utf-8?B?OFUrNzdidlFDc0VZSHBmOTZOaDJPTU1Pc295d3dtUU1rM2VpemhKTUxJajdZ?=
 =?utf-8?B?a1BvTFZqNk1TQXU3WVJZeUVyQnlHbWFGVjV1d3hEbFRvdU1rQnIrSkhVMnh6?=
 =?utf-8?B?Z3orU0ZSdkFFTVZTeGJIWUFkNnpjcUVJSVFQRmVEczNRaHd6WVh5MzNVc01B?=
 =?utf-8?B?UWdQZjAya3hYZDNmelJJcnJ2aE1JZEhGS1Q5Y24rdjMwZjd5S3djUUxSbGNq?=
 =?utf-8?B?WWM0TEdUeFRTWDNTbjF5OUZMVXhZWG9JRzdWNE9KMHhTclRFQURIUytaODVP?=
 =?utf-8?B?N3pxeUlFb25leENDUGl4cDBVbndQeGoyNC9XT3hnU2w5SitpRk1CYlJKSU4y?=
 =?utf-8?B?T0pIb1Rha29WRG03d0JZZXdDTTVmZGxaWEhsTjlqNDNnODBhc2tqeGZNYWp3?=
 =?utf-8?B?TEhKSjhudk9FcExTK3hrQTZYUWhaYXlkWEVRN2JtM1ExTm1NMHBiL2JIMlpI?=
 =?utf-8?B?ZUE5MGZTaU00UzRUcW9zTjN5SDZNSm5UYWhhZ2ZwY2J2UzhYWjVjc0tjeG12?=
 =?utf-8?B?K2JxeVBNZkNvaWVHMTYwSHkrcHYwNUhHcFhoTXhoR0lqMVhUUjVDbFN1b0Vs?=
 =?utf-8?B?WGZDbW9QZEREOXN4V0tkdTFreWIzVkg5eUpOSTJFVm5WYWQ3SVlYT1pTK3BC?=
 =?utf-8?B?RW1YdUVmamFTUjd0UVBmbEY4L3BpdGNQTHBtaDEyTDVLa0JoMGF1d3VmWDRE?=
 =?utf-8?B?OHAwUUg1UHlwdTlkMUhucmdPRHlMeTRac0lPOTZNUTQ0NWpFZ2ZsQitQNHpQ?=
 =?utf-8?B?bVNiVFR0TFgvZms2RXFBZ1h2YVQrb0JQT0pMNFVFMk5kQ3ZTbElEZ1ZYY08v?=
 =?utf-8?B?Q2JpYzh6YjlXVm9wWlBqamRNbm5jZkJrRDlwTjh4ei93NEN3M1ozdXl6bEg2?=
 =?utf-8?B?QUtrYUZWckJhcVE2WnVyVUV2QS9od3Z3NFRKUjQ3VUxMZmNZR1Z2K21iYWxk?=
 =?utf-8?B?UlRYRFdJbnNqQTYvOCs0WEFIOGZWUU1Rck1Nb2VyUmlVcnlmc2NJKy9WKy9k?=
 =?utf-8?B?ZGFXSy9kWjFuQjlrQnpPaUE4dXYyL0FWUm5NeCs5d1hyeFhsQ3pLcm5LUW5x?=
 =?utf-8?B?c01mTU4wOVRPZVJKc2xnd2RIQk1yZWZVNGdYWVE2RzZoN1NCbDlhMk5FOGp1?=
 =?utf-8?B?SytQUDdrZ3ZvbkRsenFEOVNPNjlUM3Ayc200M3pMeThCMEVPa1UxakNZRHFV?=
 =?utf-8?B?eXoxS0pKd0taT2k0ZGo1K1VFREtRZGhCdzg4aVRUSVJmclozN05FQk1JR0h6?=
 =?utf-8?B?em9jNnFGb010bkh3MG9FQWhVQXFzeGRHZ1dQTjFQZHA3T2FHTDVGWEFpM3Vv?=
 =?utf-8?B?TEVOVElpVE9DVk9zNno5VEtKSXAxekFEMkZOUk1ZUjJOZ2ltTWIxam5IQll4?=
 =?utf-8?B?bCtKZXB2NzlyQ2JadjU4MTFVTWNzcFlVVlJrdnRvK0dVaS9LSkxSUVJSWUQw?=
 =?utf-8?B?L0QxL1ZEY1JYNk9rTUJ4WGlhMVExWGN3c0NhSUs3MlcyaytQNzJmelI0TDY5?=
 =?utf-8?B?ZjEyWmpDMlExeUZWWHp5b0V4dlVtVnRzVWlTVmN3TGlLbVJZQWpKK09rZGli?=
 =?utf-8?B?T2UxczNTcW1sbE44R0E5bmliWkRBaDQ0cXlEZHBFRnVHcGxLdG1ydHFDdzFH?=
 =?utf-8?B?QTVQd2Jyd3lHcm96aFFnMTJTYTFnVkRsaXhkaW4rZFFTRDE5MWlpTjlVNzk3?=
 =?utf-8?B?ZGdZWWpBVDJpcjRUbGhMcmduV0J3N0NNeUNIWDA0djNnaDZiMzRZclNJN0N0?=
 =?utf-8?Q?46F2n/+pGSwOSwE6/zM76/VozvMJGizyiS+GIJv/Iy5WJ?=
X-MS-Exchange-AntiSpam-MessageData-1: Pbo8mVLBfHAURg==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a2bb2b6-cb53-4fa1-fc11-08df3cb442d9
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB6873.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2026 09:48:22.5247
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S1oJL38xiehl3qGRFIIZdYh6j7w9Hf9GaF5JPQQslblWhizpKGunDfsReiyRoafYEEH5PoyLpTgUXKQpR41r2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8269

From: John Hubbard <jhubbard@nvidia.com>

The generic falcon bootloader is a small program that loads a larger
image into a falcon. The r000 boot protocol needs it to run an image
that GSP-RM names in a load-and-execute event during boot.

Nova-core used the bootloader only to load FWSEC, so the bootloader code
was part of the FWSEC code, and there was no way to run it on another
image.

Move the bootloader into its own type, which FWSEC then uses.

No functional changes.

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
Reviewed-by: Timur Tabi <ttabi@nvidia.com>
Reviewed-by: Zhi Wang <zhiw@nvidia.com>
Reviewed-by: Eliot Courtney <ecourtney@nvidia.com>
[acourbot: document boot_addr(); split the change of IMEM placement into
 its own patch]
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/firmware.rs                  |  1 +
 drivers/gpu/nova-core/firmware/fwsec/bootloader.rs | 60 ++-----------
 drivers/gpu/nova-core/firmware/gen_bootloader.rs   | 99 ++++++++++++++++++++++
 3 files changed, 107 insertions(+), 53 deletions(-)

diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/firmware.rs
index d8f6509a35d1..358c9b8db0b8 100644
--- a/drivers/gpu/nova-core/firmware.rs
+++ b/drivers/gpu/nova-core/firmware.rs
@@ -24,6 +24,7 @@
 
 pub(crate) mod booter;
 pub(crate) mod fwsec;
+pub(crate) mod gen_bootloader;
 pub(crate) mod gsp;
 pub(crate) mod gsp_fmc;
 pub(crate) mod radix3;
diff --git a/drivers/gpu/nova-core/firmware/fwsec/bootloader.rs b/drivers/gpu/nova-core/firmware/fwsec/bootloader.rs
index 68858b48390e..80239301bbfa 100644
--- a/drivers/gpu/nova-core/firmware/fwsec/bootloader.rs
+++ b/drivers/gpu/nova-core/firmware/fwsec/bootloader.rs
@@ -17,14 +17,11 @@
         Io, //
     },
     prelude::*,
-    ptr::Alignable,
-    sizes,
     transmute::AsBytes,
 };
 
 use crate::{
     falcon::{
-        self,
         gsp::Gsp,
         Falcon,
         FalconBromParams,
@@ -38,10 +35,7 @@
     },
     firmware::{
         fwsec::FwsecFirmware,
-        tlv::{
-            request_tlv, //
-            Tlv,
-        },
+        gen_bootloader::GenericBootloader, //
     },
     gpu::Chipset,
     num::FromSafeCast, //
@@ -100,16 +94,12 @@ unsafe impl AsBytes for BootloaderDmemDescV2 {}
 pub(crate) struct FwsecFirmwareWithBl<'a> {
     /// DMA object the bootloader will copy the firmware from.
     _firmware_dma: Coherent<'a, [u8]>,
-    /// Code of the bootloader to be loaded into non-secure IMEM.
-    ucode: KVec<u8>,
+    /// The bootloader that copies the firmware.
+    bootloader: GenericBootloader,
     /// Descriptor to be loaded into DMEM for the bootloader to read.
     dmem_desc: BootloaderDmemDescV2,
-    /// Range-validated start offset of the firmware code in IMEM.
-    imem_dst_start: u16,
     /// BROM parameters of the loaded firmware.
     brom_params: FalconBromParams,
-    /// Range-validated `desc.start_tag`.
-    start_tag: u16,
 }
 
 impl<'a> FwsecFirmwareWithBl<'a> {
@@ -120,28 +110,7 @@ pub(crate) fn new(
         dev: &'a Device<device::Bound>,
         chipset: Chipset,
     ) -> Result<Self> {
-        let fw = request_tlv(dev, chipset, "gen_bootloader")?;
-        let tlv = Tlv::new(fw.data())?;
-        dev_dbg!(
-            dev,
-            "loaded generic bootloader firmware v{}\n",
-            tlv.get_string(b"VERS")?
-        );
-
-        let ucode = {
-            let blob = tlv.get_bytes(b"BLOB")?;
-            let code_size = usize::from_safe_cast(tlv.get_u32(b"CDSZ")?);
-            let code = blob.get(..code_size).ok_or(EINVAL)?;
-            let aligned_code_size = code_size
-                .align_up(cv!(falcon::MEM_BLOCK_ALIGNMENT))
-                .ok_or(EINVAL)?;
-
-            let mut ucode = KVec::with_capacity(aligned_code_size, GFP_KERNEL)?;
-            ucode.extend_from_slice(code, GFP_KERNEL)?;
-            ucode.resize(aligned_code_size, 0, GFP_KERNEL)?;
-
-            ucode
-        };
+        let bootloader = GenericBootloader::new(dev, chipset)?;
 
         // `BootloaderDmemDescV2` expects the source to be a mirror image of the destination and
         // uses the same offset parameter for both.
@@ -211,21 +180,11 @@ pub(crate) fn new(
             }
         };
 
-        // The bootloader's code must be loaded in the area right below the first 64K of IMEM.
-        const BOOTLOADER_LOAD_CEILING: usize = sizes::SZ_64K;
-        let imem_dst_start = BOOTLOADER_LOAD_CEILING
-            .checked_sub(ucode.len())
-            .ok_or(EOVERFLOW)?;
-
-        let start_tag = u16::try_from(tlv.get_u32(b"STRT")?)?;
-
         Ok(Self {
             _firmware_dma: firmware_dma,
-            ucode,
+            bootloader,
             dmem_desc,
             brom_params: firmware.brom_params(),
-            imem_dst_start: u16::try_from(imem_dst_start)?,
-            start_tag,
         })
     }
 
@@ -274,7 +233,7 @@ fn brom_params(&self) -> FalconBromParams {
     fn boot_addr(&self) -> u32 {
         // On V2 platforms, the boot address is extracted from the generic bootloader, because the
         // gbl is what actually copies FWSEC into memory, so that is what needs to be booted.
-        u32::from(self.start_tag) << 8
+        self.bootloader.boot_addr()
     }
 }
 
@@ -284,12 +243,7 @@ fn imem_sec_load_params(&self) -> Option<FalconPioImemLoadTarget<'_>> {
     }
 
     fn imem_ns_load_params(&self) -> Option<FalconPioImemLoadTarget<'_>> {
-        Some(FalconPioImemLoadTarget {
-            data: self.ucode.as_ref(),
-            dst_start: self.imem_dst_start,
-            secure: false,
-            start_tag: self.start_tag,
-        })
+        Some(self.bootloader.imem_load_params())
     }
 
     fn dmem_load_params(&self) -> FalconPioDmemLoadTarget<'_> {
diff --git a/drivers/gpu/nova-core/firmware/gen_bootloader.rs b/drivers/gpu/nova-core/firmware/gen_bootloader.rs
new file mode 100644
index 000000000000..1e7ff9699174
--- /dev/null
+++ b/drivers/gpu/nova-core/firmware/gen_bootloader.rs
@@ -0,0 +1,99 @@
+// SPDX-License-Identifier: GPL-2.0
+// SPDX-FileCopyrightText: Copyright (c) 2026 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
+
+//! The generic falcon bootloader: a small program that the driver loads into a falcon's IMEM by
+//! PIO. It reads a descriptor that the driver writes at DMEM offset 0, and loads the image that
+//! the descriptor names into IMEM and DMEM by DMA.
+
+use kernel::{
+    device,
+    prelude::*,
+    ptr::Alignable,
+    sizes, //
+};
+
+use crate::{
+    falcon::{
+        self,
+        FalconPioImemLoadTarget, //
+    },
+    firmware::tlv::{
+        request_tlv, //
+        Tlv,
+    },
+    gpu::Chipset,
+    num::FromSafeCast, //
+};
+
+/// The generic falcon bootloader image and its IMEM load parameters.
+pub(crate) struct GenericBootloader {
+    /// Bootloader code, zero-padded to a whole number of falcon memory blocks.
+    ucode: KVec<u8>,
+    /// Byte offset in IMEM at which the code is loaded.
+    imem_dst_start: u16,
+    /// Tag under which the first code block is loaded.
+    start_tag: u16,
+}
+
+impl GenericBootloader {
+    /// Loads the generic bootloader image for `chipset`, placed right below the first 64 KiB of
+    /// IMEM.
+    ///
+    /// # Errors
+    ///
+    /// - `EINVAL` if a required TLV field is absent.
+    /// - `EOVERFLOW` if the image does not fit below 64 KiB.
+    /// - `ENOMEM` if the padded copy of the code cannot be allocated.
+    pub(crate) fn new(dev: &device::Device, chipset: Chipset) -> Result<Self> {
+        let fw = request_tlv(dev, chipset, "gen_bootloader")?;
+        let tlv = Tlv::new(fw.data())?;
+        dev_dbg!(
+            dev,
+            "loaded generic bootloader firmware v{}\n",
+            tlv.get_string(b"VERS")?
+        );
+
+        let ucode = {
+            let blob = tlv.get_bytes(b"BLOB")?;
+            let code_size = usize::from_safe_cast(tlv.get_u32(b"CDSZ")?);
+            let code = blob.get(..code_size).ok_or(EINVAL)?;
+            let aligned_code_size = code_size
+                .align_up(cv!(falcon::MEM_BLOCK_ALIGNMENT))
+                .ok_or(EINVAL)?;
+
+            let mut ucode = KVec::with_capacity(aligned_code_size, GFP_KERNEL)?;
+            ucode.extend_from_slice(code, GFP_KERNEL)?;
+            ucode.resize(aligned_code_size, 0, GFP_KERNEL)?;
+
+            ucode
+        };
+
+        // The bootloader's code must be loaded in the area right below the first 64K of IMEM.
+        const BOOTLOADER_LOAD_CEILING: usize = sizes::SZ_64K;
+        let imem_dst_start = BOOTLOADER_LOAD_CEILING
+            .checked_sub(ucode.len())
+            .ok_or(EOVERFLOW)?;
+
+        Ok(Self {
+            ucode,
+            imem_dst_start: u16::try_from(imem_dst_start)?,
+            start_tag: u16::try_from(tlv.get_u32(b"STRT")?)?,
+        })
+    }
+
+    /// Returns the address at which the falcon starts executing the bootloader: the IMEM virtual
+    /// address of its first code block.
+    pub(crate) fn boot_addr(&self) -> u32 {
+        u32::from(self.start_tag) << 8
+    }
+
+    /// Returns the PIO parameters that place this bootloader in non-secure IMEM.
+    pub(crate) fn imem_load_params(&self) -> FalconPioImemLoadTarget<'_> {
+        FalconPioImemLoadTarget {
+            data: self.ucode.as_ref(),
+            dst_start: self.imem_dst_start,
+            secure: false,
+            start_tag: self.start_tag,
+        }
+    }
+}

-- 
2.56.0

