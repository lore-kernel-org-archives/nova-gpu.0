Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.52.36
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793840850;
	b=nt7LzEiSKCMAc4FHeHS9+Wtta5gacU4pnEZQ5Bq5wjlHiaskb6nV0Z3TqjcC6ETUzKN6
	 OH9oGQnk0YHRIl8ZDdeC6/36X8k7lDpRCKkqfX6cHpd4reVTYwRbKfsjORF9y7SqyGn27
	 bBTb75HtRpTH1x9n7uFXiK/4uwc0S+vWuO8T2NOXLgIzOUgfxvOqZgoAiqRqBVPw7kBx4
	 bQ+bD6grGxjunuHvfP0zsK18gJR/kdzag5d6aeicYUth3FEZaMHyn8zuQzqYjsCu8ZjIo
	 dCbk9UkVoH/GE56t6tpRfOBc34O5B0W/TI2GSeASlxZBYMgxfcq+3DbBXag/DzVhEcA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793840850;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:Subject:From:
	 To:Cc:X-Mailer:References:In-Reply-To:X-ClientProxiedBy:MIME-Version:
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
	bh=rPALfvKcghhgzvA7CVhpdKISszem6NDocCuBj2A+hSM=;
	b=qQgk658M9fAtdH/pJDLoleAO3TNYLFERkZouI9WxZLmw6bSfBfc5Poky8RU3JzWH2Q0S
	 /JBD5jm/bMf0AB4bigtI+6yttPE8j9hh2md3rETIbTcbt9x2+mhKOe8N3MBc0z9Cx1OYj
	 iT+KToAoLcIsUyua4TXHVAOWjBqP47JOEcw/QVrVp4P879AAV04bUIwIrgW5h0jqWNQyZ
	 JyJmY8UJsUmjdq4Y3zJEvTx966juT+xw4HqZHMI2QV4ESNV4WW2NEVn+NB6oi8ezt7r6e
	 pLQoDYjvDu8pQDARt9wLK2gOpVY3YyYHHJGd/BF0yy7a+h3gx1ZFbr5ubeGbjqydeiA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=oWmZcaMM;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.52.36
Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011036.outbound.protection.outlook.com [52.101.52.36])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC68F606A328
	for <nova-gpu@lists.linux.dev>; Thu,  5 Nov 2026 01:07:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AC68F606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=oWmZcaMM
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RNdydGhPmcnqMBZysUGkitzmoPWhMIqc6QB5f/ABzd9uVFXXYFW41H+11AfEFpOYR+rOuEKmgHdyszI1k8qVcKM/I+NjQXjZohzxNODLycqwfWDuE5i8+kfRtEQKYuY3mOo/H1oyB/GhXrFy3WTJt7e154mFJZyJs+V7UBeFterAneVGFgFcWILHtVn0KGoq+TsvmyXhnUKGJ+c/d61yp9CiBqEMkI3FAYqV8LCCeNp6gzdDR86qJm9bVLmBDE0VIMBbZVbDRB2ed0BmJ1HdQXCL1+Wc0bgTX7iR3c0GuFotHTdTXqqIMuITJHhjfmYEQsaYdVny72J+kcAoQvkR7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rPALfvKcghhgzvA7CVhpdKISszem6NDocCuBj2A+hSM=;
 b=QO15KigadnUT5y/L8N9m6l1uJn+9GBbdYkHuS1EyIJGhabeA2Ou3mOmZF2h62XmUcaa97jDrLq37JlZhDf46vPKSGaSvsXTWNjv+8t5SfiWZl3Jj6JL8xY0UHmeLR/ASbBsgqRXs7o4jyjuEvC6typhaJBg1WTf7ONE3N7nCpLyssFxYHQBdwYdxfsL9PpU4yo2V+rlcHtisySSNjzAMRCIVN/ApxCXnraipscIirjwJI00Qp2zPyHIKFqudsJy8oqBAgX/KpuDzhuLFsRSgsUF6xz06PL8A8q2gl1aV7ufZLfoRCHQ2V5LYAvpkBL+NprmmFSeSdijkkhDaQW5x6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rPALfvKcghhgzvA7CVhpdKISszem6NDocCuBj2A+hSM=;
 b=oWmZcaMMoSVT6iW/9IPnHMpmlBLBQi/kWUpgDSsoWw7y3fvR13bbeChrA6pWJCYSW3yC8aUfJq100zm8JTvsUOY6veY64ymbbRbydiN+Ys74/j3Imp50dhWTFsDWZphnBS9HyndCvPSszbBa5/x46FqblN9OPhw37j+wX57W45W2uiJBCtulZ3njWlGeEz9B6B4fBA6rrXtfXfesl6QOX3qZ41iSHDS/zQVERSBHNV42VsO7Ajf9SUxLSUWnn9AGadJInz9p0KGelYC5gUa8GQYSdUZTtVvKs0+gKjt0iwhOoSvCmB2nx4IIAb8Y/0GTQif/OUMI6dkCff9ReS+ALw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6413.namprd12.prod.outlook.com (2603:10b6:8:ce::10) by
 IA3PR12MB246477.namprd12.prod.outlook.com (2603:10b6:208:70e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Thu, 5 Nov
 2026 01:07:26 +0000
Received: from DS0PR12MB6413.namprd12.prod.outlook.com
 ([fe80::e82a:6673:4142:37fa]) by DS0PR12MB6413.namprd12.prod.outlook.com
 ([fe80::e82a:6673:4142:37fa%5]) with mapi id 15.21.0592.009; Thu, 5 Nov 2026
 01:07:26 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 05 Nov 2026 10:07:22 +0900
Message-Id: <DMMVIAO8XXBT.16VBF80JAPMXZ@nvidia.com>
Subject: Re: [PATCH 3/4] gpu: nova-core: gsp: cmdq: add the GMC send path
From: "Eliot Courtney" <ecourtney@nvidia.com>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Benno Lossin"
 <lossin@kernel.org>, "Gary Guo" <gary@garyguo.net>
Cc: "John Hubbard" <jhubbard@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Eliot Courtney"
 <ecourtney@nvidia.com>, "Zhi Wang" <zhiw@nvidia.com>,
 <linux-kernel@vger.kernel.org>, <nova-gpu@lists.linux.dev>,
 <rust-for-linux@vger.kernel.org>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261103-r000_rebase_on_cmdq-rpc-v1-0-189f9ff3bfd2@nvidia.com>
 <20261103-r000_rebase_on_cmdq-rpc-v1-3-189f9ff3bfd2@nvidia.com>
In-Reply-To: <20261103-r000_rebase_on_cmdq-rpc-v1-3-189f9ff3bfd2@nvidia.com>
X-ClientProxiedBy: TY4P301CA0002.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:26f::15) To DS0PR12MB6413.namprd12.prod.outlook.com
 (2603:10b6:8:ce::10)
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
X-MS-TrafficTypeDiagnostic: DS0PR12MB6413:EE_|IA3PR12MB246477:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c5a7f60-95d7-40f1-e051-08df3ad927e2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|366016|10070799003|1800799024|22082099003|18002099003|6133799003|10067099003|3023799007|4143699003|56012099006|11063799006|5023799004|261026140227099003|261026121527099003|261028144727099003|261021121427099003|261021123027099003|261022075727099003|261009223027099003|261102123227099003|261022113327099003|261022105027099003;
X-Microsoft-Antispam-Message-Info:
	2CCORKXyntxiTzd+5ggOaJQ2/O6D6YtYe6s3GVjqRUOdZgo6DpL2KiXrhT1+Gt++bA+oP24Mgz0o8O765uB7lBaVc8kh99NQEu7pn3frToLBI0qE9XGMLH4j4a1ASv7lU9Swy33STtTQTnnPKlttlAgHCwaJ0E2/Bua0V56ZdXXeD973H+bqNx+wEr7tpbETel2VfUDXYlFvad9TPOEFqkz+CsmkhBXgNcEMfqjVnpbo+abQCE4JA7tJbG0JtK7kp2e7q17gXCyMjLK72If4Sqd41D38RR0m320CVYoQEISGCDfRYfiGaAJCKoaWaippGblwXaseP51/ANrIE7DWDdVsDG3SloHQUP9yi499vTcFYchs2CKW+1HfQkRjvfIA6mdhqYfwkn7niJwOItQIskzi/cMVIpwFNBVR5lF2FSoncwH5m9pn3mcKRZDSHc/MRc9Snp5Su8ZXKqNIAgPs35QA5evokKfQw3duSbKdavb3DxTa4f2PDIK2a2A+kPDq2hFxmdpkvwKQuXHqB+quht19U2c6ayIVWmE/6Gr2wgFLBYoXlEUXIJ+bHneoS+NesJ1GMfoG5HIGsGFv9dmBfsyi8G4XsY+ENPwxuN3Lm0CG6HgsSieDoZ24cH97M/T8e1tLQVNR6dMvJf7iixF1MwawF34vn0IhpKYYol+ph9I=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB6413.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(10070799003)(1800799024)(22082099003)(18002099003)(6133799003)(10067099003)(3023799007)(4143699003)(56012099006)(11063799006)(5023799004)(261026140227099003)(261026121527099003)(261028144727099003)(261021121427099003)(261021123027099003)(261022075727099003)(261009223027099003)(261102123227099003)(261022113327099003)(261022105027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZU1YU0hwV2Y2eWpkSmJ5RlFjT20zTUJidEJMOUt2eDFpbVMyb21yd2lSZStK?=
 =?utf-8?B?V0NraFozbW1wdndXajZ0ekY4c0RTZ29QQ3dTVy91SVZIREtmTm94c0J1aWlP?=
 =?utf-8?B?ZGg5RVJpSkNNT3RReEhockZPVmx2aW5xeE9BaG5oYk1NWG4wc0FreXlBM0JU?=
 =?utf-8?B?d1VLd01rRlB0ZU00Q0VZZ0drNGhIeW4wKzFMaHVEaUhhdkIxN3ZIM3ZEVG9L?=
 =?utf-8?B?MTVGcmlYd29lai9LUjJNcTQwUXM0MGQzZ2x6WlRnaXQyMzgwNXN0S3B6OC9j?=
 =?utf-8?B?eDRUQVRvdFJMSjNBeTlwUVZDZVVIZmZQaTVxTEFaYitUTk1BaEtqb0NoK0g3?=
 =?utf-8?B?RS83RGJ2bkNmYWdkMlFtS20xTEdFYjByWWRBeXBQa0k0ZEV1V0sySEhBSHk1?=
 =?utf-8?B?QWNVSzhCbnd5VE9yV1dKbXBjZXFicVBqY2Q2NENBcTNzZE4xOUtXV1Nlb1Vs?=
 =?utf-8?B?UUN3Vk5rbU5DWXNEaHAyV2NwSTFHZUtwaGZPczBHUXdjRE0rWFpaUDVWWkda?=
 =?utf-8?B?YWRUVHZjTHBoanRuUVRXeFAxcnJhaUtweHAxUlY0dXAzVnJYVHM4M0xPUG52?=
 =?utf-8?B?K0hJRVlRcjk3TDBqUHBYa3Y4UWZnN1VOazM1VXRqMkI5NmR6YnhObHF4M0Jw?=
 =?utf-8?B?N0ozUFJsTCtHVS9sTnRycGQwWTlXdVZjbHVrVmkxN1RlTWE0ZFBPN1JDVWY3?=
 =?utf-8?B?cHlMeS9ZeDZFRUttaXRkRkxuYjUzaWU1bkFBT09hTzBwaFRDQ29wTEhvTy9w?=
 =?utf-8?B?VnZEQ2FYWXAwbG9waThXZndVaGppWXlKeEhlS01oMHdCTnJ6ekpqTUhta2pU?=
 =?utf-8?B?RnBOVUUxcjE2a2IreGF3ZDBMRkkxT0hobWVaOVdxRUtGU0xaa29LK3FCQnNz?=
 =?utf-8?B?L1Qra04xZHF5QjlESjV2VEJQRUFXY0ZnZlhhOCtpQ053cTVOclYwaHEwWlkr?=
 =?utf-8?B?aUhTZldrN2lwUmFsOHQ2UUNaSGRqMHY3SmszZjMxVkpxM3NxYTdkaEE4RXNi?=
 =?utf-8?B?eG11OHJkdlpjazFYN0pJZ1BmME1hYlFlVTB1RTI2cWJJTmxPYkw4amNML1JZ?=
 =?utf-8?B?QTg1Z21WQjM3RklBL3lPQmNWY1Z0czkzTkpiMlUvM2lKVm1oNjNrNitnbGNv?=
 =?utf-8?B?YXRSb1B4dlpQZzFtcHVpT09oYWt5bUViMS9KVE0yeGUrbE14QmlGMDJLOS9R?=
 =?utf-8?B?RUtYQ2RKek1DQ3M1VTBZVjRWUUJwRE8rUVJRK1ozT2ZoTXR1OGJ1YW5TdjVi?=
 =?utf-8?B?Z29RS2hCMDVzYUFIV2dCSThoRThTdk9hd2U1SUIxOVBhU2RQU3BUbEx2aFV3?=
 =?utf-8?B?bzlyR1kyK1RaUjVJeEh1WVNzMTBjKzBGUGd2NXVJUXZtWTVhbmZOSnlZYkhr?=
 =?utf-8?B?eGhmWlRoTmwzTTgzMFRodmVQaHkraHFKVlVEL3krQWZvd29VamZFTEFSamVt?=
 =?utf-8?B?cVIycHB6WFhXMVhQbUFrUzIzcEVWajZqVEVaQzVtUmZyN2lIYTQrdnF0SC9y?=
 =?utf-8?B?Qk5RSEtMRXZ2UGNjdDZtNVI5R25JK3BteCtlTE9TK05OelNvbVlPc3VXc294?=
 =?utf-8?B?eEtMVDBzb1gySWJXYUgwZ2k2T3JKdFV3UnRhUG5FNWFsUTVGMTRQWi8zQ2tU?=
 =?utf-8?B?aGc3S2h5NUlrWGZmVUtKYmllMzE4ZWZCakpRYUpUUlJyVnNwc2tJSDE4N0F2?=
 =?utf-8?B?S2I2Y285ZGV5NVQwOWVxVFEyOHVyK0VtL2UzdzNrTlYrS1VHdXpyZlArS0hr?=
 =?utf-8?B?QzdETmNKbWxqM3RMMTd2NGFWdjlEWExVSllxS0FZeEJPVXpramRxaDNTTFB6?=
 =?utf-8?B?c01YVndaQThVd29zWDVmdmpiejExRFlBME5nUWlmR24xUnR2Ly9XR0UyN0ZE?=
 =?utf-8?B?YXcxS1dDb081RnZJWFRXV0xEd2xOczJETUR1Vkh1L0QzMFBpbGtUejRjRkU3?=
 =?utf-8?B?anBlOXZESU93V1M3WVFGbUordU1kV0FLK3ZSSy9sTDV2MEszNkliblZRVVNF?=
 =?utf-8?B?aGl1Z1JaNDZ0T0VNTkNIRUZ4V0IvaHlNb3NOa0V0azlxTVRFMlNDVW9wSUVZ?=
 =?utf-8?B?cGcxb0VtZllldkxTamluVVFhVDVtZ2hBUE9FdU16emw0WXNObmo4SGFqSFl6?=
 =?utf-8?B?Skh1QnVLd09wc3l6ci9GNzJ2QTFVYUdqaVFlOUdpOEtKZm1UM3h2VExVQXpt?=
 =?utf-8?B?dFRKclNsbU84cU1UNytHOTBPZ3RmbnJWK09JV0hFeHN2Ui9aTFhyOG53aGtT?=
 =?utf-8?B?L0Nzc1plZGsxbHBUdGVxMW11b3N6Z0hQRFoxUXQvZVJtY0Rtam5SV2dsMXNo?=
 =?utf-8?B?WTA4Uit3b0pzUmNURzFzSy9zTHNpcWgvRkRCV1U2L3h1NUhtWlNUc0dST2Mv?=
 =?utf-8?Q?LlVQrdLR2riqwpWb6i8DgdO5dSimUdyC+QN4jZT/RhfA3?=
X-MS-Exchange-AntiSpam-MessageData-1: 9sN1bHkD+f0DeQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c5a7f60-95d7-40f1-e051-08df3ad927e2
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6413.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 01:07:26.3134
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yBIjRTjFMs3+nhAqw9HIkNBjNnuNE+xIpbWxlizRMmFudP+as7v34DzV8m0SBne11rSCvdpqyNi01TGr9v576w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR12MB246477

On Tue Nov 3, 2026 at 9:02 AM JST, Alexandre Courbot wrote:
> From: John Hubbard <jhubbard@nvidia.com>
>
> The r000 boot protocol has the driver send GSP_INIT, the request that
> carries the driver's configuration to GSP-RM, as a GMC (GPU Management
> Controller) API command. GMC and RPC commands share the command queue
> and its sequence counter. A GMC command always fits in one element, as
> the GMC API has no continuation records.
>
> Add the gmc sub-module of the command queue, sibling of rpc, traits and
> types definitions mirroring those of rpc and adding support for GMC messa=
ges.
>
> The module has no user yet, and is built as dead code until the switch
> to r000.
>
> Assisted-by: LLM
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
> Co-developed-by: Alexandre Courbot <acourbot@nvidia.com>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> ---
>  drivers/gpu/nova-core/gsp/cmdq.rs     |   4 +
>  drivers/gpu/nova-core/gsp/cmdq/gmc.rs | 194 ++++++++++++++++++++++++++++=
++++++
>  2 files changed, 198 insertions(+)
>
> diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gs=
p/cmdq.rs
> index c8b103a0785d..629ab8d35f87 100644
> --- a/drivers/gpu/nova-core/gsp/cmdq.rs
> +++ b/drivers/gpu/nova-core/gsp/cmdq.rs
> @@ -1,6 +1,10 @@
>  // SPDX-License-Identifier: GPL-2.0
>  // SPDX-FileCopyrightText: Copyright (c) 2025-2026 NVIDIA CORPORATION & =
AFFILIATES. All rights reserved.
> =20
> +// The transport header of the r570 firmware carries no message type, so=
 nothing can produce or
> +// consume a GMC message before the switch to r000. Until then the modul=
e is built as dead code.
> +#[expect(dead_code)]
> +pub(super) mod gmc;
>  pub(super) mod rpc;
> =20
>  use core::mem;
> diff --git a/drivers/gpu/nova-core/gsp/cmdq/gmc.rs b/drivers/gpu/nova-cor=
e/gsp/cmdq/gmc.rs
> new file mode 100644
> index 000000000000..b035f30479a8
> --- /dev/null
> +++ b/drivers/gpu/nova-core/gsp/cmdq/gmc.rs
> @@ -0,0 +1,194 @@
> +// SPDX-License-Identifier: GPL-2.0
> +// SPDX-FileCopyrightText: Copyright (c) 2026 NVIDIA CORPORATION & AFFIL=
IATES. All rights reserved.
> +
> +//! Support for the GMC (GPU Management Controller) API message type on =
the GSP command queue.
> +
> +use kernel::{
> +    device,
> +    prelude::*,
> +    transmute::{
> +        AsBytes,
> +        FromBytes, //
> +    },
> +};
> +
> +use crate::{
> +    gsp::{
> +        cmdq::{
> +            GspCommand,
> +            NoReply, //
> +        },
> +        fw::{
> +            GmcApiHeader,
> +            GmcCommandId, //
> +        },
> +    },
> +    sbuffer::SBufferIter,
> +};
> +
> +use super::{
> +    Cmdq,
> +    CmdqInner,
> +    CommandElement, //
> +};

nit: importing from the same module through both crate:: and super::?

> +
> +/// Trait implemented by types representing a GMC command to send to the=
 GSP.
> +///
> +/// The main purpose of this trait is to provide [`Cmdq`] with the infor=
mation it needs to send
> +/// a given command.
> +///
> +/// [`CommandToGsp::init`] in particular is responsible for initializing=
 the command directly
> +/// into the space reserved for it in the command queue buffer.
> +///
> +/// Some commands may be followed by a variable-length payload. For thes=
e, the
> +/// [`CommandToGsp::variable_payload_len`] and [`CommandToGsp::init_vari=
able_payload`] need to be
> +/// defined as well.
> +pub(crate) trait CommandToGsp {
> +    /// Id identifying this command to the GSP.
> +    const COMMAND: GmcCommandId;
> +
> +    /// Type generated by [`CommandToGsp::init`], to be written into the=
 command queue buffer right
> +    /// after the GMC API header.
> +    type Command: FromBytes + AsBytes;
> +
> +    /// Type of the reply expected from the GSP, or [`NoReply`] for comm=
ands that don't have a
> +    /// reply.
> +    type Reply;
> +
> +    /// Largest reply this command accepts, in bytes. Zero for commands =
that the GSP does not
> +    /// answer.
> +    const MAX_REPLY_SIZE: u32;

Same issue here as patch 2 - max reply size 0 and no reply are not the
same IIUC.

I considered the idea of putting this on the Reply type instead. It
would be simpler now, but conceptually the max reply size depends on the
content of the command, not just the reply type. And in the future we
might want to make this into a trait method not a constant. So lgtm.

[...]

> +    fn write(&self, dev: &device::Device, seq: u32, dst: &mut GspCommand=
<'_>) -> Result {
> +        let command =3D &self.0;
> +        let payload_size =3D command.size();
> +        // Extract the areas for the GMC API header and the command itse=
lf. The GSP message
> +        // header, the GMC API header and the command header together ar=
e guaranteed to fit
> +        // entirely into a single page, so it's ok to only look at `dst.=
contents.0` here.

optional nit: add const assert for checking the sizing fits in one slot
here, since it's a protocol constraint that we can check statically.

Reviewed-by: Eliot Courtney <ecourtney@nvidia.com>
