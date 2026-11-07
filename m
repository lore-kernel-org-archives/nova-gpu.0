Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.201.26
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794044139;
	b=s+KNeuujS2ePS9X4IMDR+85ytH8jCvqGpAAUOr3C/EXwuZi8k5YRR23FVj7hq0q5uXGy
	 yMKtroPHyJK08RUUMrU8b3tz0YKs3Qr4rWCtLrnqJ7cP9Re7uFos+mGFVOt0//8Mq0RW2
	 xZL42jUyMLbpdfEgvETrRmEkczgIrMzO9QWAfqJWWuW4cbEQqIEDZqAjXYdTKVHIMLZ5b
	 jA+gDRdTVzOAHSQH+Vj8+C5cgZyzMRcqPKODWJDvphviY+m+w9rq40WuKRZr1dTA6rthy
	 lQnN7YzBy/Fp0asHg2BdBrQOMFUYvo/E1FirufEXJ6HvoN1k70RpvOtq++m6qvtavEQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794044139;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:Subject:From:
	 To:Cc:References:In-Reply-To:X-ClientProxiedBy:MIME-Version:
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
	bh=laPkF5DtktEs22iPkfDtliygVDSepk9GtGkYyJwL39g=;
	b=Fsx5Ly8JSgxBXbyLQtwHn58v+7iWWXQ7Xboj546btvFZY810ji198a+BzNMZMf5yfP6i
	 th6UJDRTzty0d9/BxFc7xufSVGgMOhjy8VnwPpPBrx/ijfLbGxn6xfEUmV+YE8z1XvSwN
	 VVAz8jugoNaqbbL4/3A+tMItbikNmLsteahSucw+V5UwsXT13iozaPfilsJ2Ajph4oW83
	 VEkRmLMR7PPP4cVrjqnPlWvXXnHZGxtaC54rVsbvQZ0ngjQfD8CzPrOHSvzu8YUgFfeMo
	 89L30S0qGL0xafFpLPRhrJaP7O69snIJqE+yDWRQ9kcFLjLKhWgROTNF1sFrO3hZ8kw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=L4tPOI0D;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.201.26
Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010026.outbound.protection.outlook.com [52.101.201.26])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B4ED606A32C
	for <nova-gpu@lists.linux.dev>; Sat,  7 Nov 2026 09:35:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B4ED606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=L4tPOI0D
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jXwoL1vDVvzPLz9c6U8zJxGUHNxLbhlfpN3CFa7kC9LoNgHAQUKuLWmH5G1W88Qk7v7RQDxit09ag+CimhPOdjmUsDa19z8dYdIZJ+3QEAA049HJVXUeZcXf5edbGRDCrUtbsey7w15j0NvZiSrhT/r8wF6g2sOp0y4UdWzxu5bLQIjrlBIWZPGLgFzY5xL5NLKYPVbfuUMpVTjgxTtmZzvEcY416NAc4/UIMKL4exaXts7h55a6Ubntoae4mrBQwy8G7ct3P1g3HSrLF36/tb8tV86vsVP7zuN5h2r+hM4DmN/qazC8miWdWD43HyEUqJx2Wla6tZKE5/xK5UssAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=laPkF5DtktEs22iPkfDtliygVDSepk9GtGkYyJwL39g=;
 b=Zs+yfunDsk6WC0m3tM7OoO9IFFKF6wzF4gWn+9PO7H0NYwGLBwjNmMCis31nKE59CbaAAVg5jVmz4feli6QwBPgjVcl1iflKGwgjfLcunCLJxoVK+6YevbY6z6budY1tjnVw4hTTtMyeFwhWOCOeLd0wXQ3m722Qgl1Eu6AdgyvtP9Y0RSiSKaXtdnGQOLHHSheGkPFs+gOhSg9zAL5b03NXXKz/q3ahTvcptrVlp4YfysqU9SkxIas25n5H7ucC1e6gF1ho31DP3RplQaQsj6Q6p74+gtslh6dafVpF8Lq52DM42CwZc1075aR7Tmt84yMq/zx7r1CLojMLBzTMWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=laPkF5DtktEs22iPkfDtliygVDSepk9GtGkYyJwL39g=;
 b=L4tPOI0D0hvfi1Wp3Lbdprd5MvDx/W6xrbHVwM2Dfak0k6InDFSGuLIOte6OhTl/V2erpE4sFgHDv1iKstW1YxEZof6oZpyD3UYQZ0vJgP0mbqwoCIVIsPsMExtOveMfkSVQyrXhCUCxEC9YkVDofa/2oQRnt414h/oaCQhfxEoRiqbwTVh0nYHHuCyahfHRIY7C78xjjd+nUEdeCTyM3yD4sEDG7jNEvSwwvHctP2KuDHjOJENiV5LGGUil6Z+bXoUAuFcNcbVq3S2FqGy7oE8OurS+FhvCgpyshg3gZyCnhPXd4H0dYXlUYYyDTcKZ67R6Bp04iVnBilen9gAmxw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MW4PR12MB6873.namprd12.prod.outlook.com (2603:10b6:303:20c::17)
 by SN7PR12MB7853.namprd12.prod.outlook.com (2603:10b6:806:348::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Sat, 7 Nov
 2026 09:35:35 +0000
Received: from MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1]) by MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1%5]) with mapi id 15.21.0592.007; Sat, 7 Nov 2026
 09:35:34 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 07 Nov 2026 18:35:31 +0900
Message-Id: <DMOVKG56YW1X.20QFQF08VXIIV@nvidia.com>
Subject: Re: [PATCH 6/7] gpu: nova-core: falcon: allow DMA transfers to read
 from a framebuffer address
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Eliot Courtney" <ecourtney@nvidia.com>
Cc: "Danilo Krummrich" <dakr@kernel.org>, "Alice Ryhl"
 <aliceryhl@google.com>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, "John Hubbard" <jhubbard@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Zhi Wang"
 <zhiw@nvidia.com>, <nova-gpu@lists.linux.dev>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20261103-r000-fw-v1-0-e3d38fc130e3@nvidia.com>
 <20261103-r000-fw-v1-6-e3d38fc130e3@nvidia.com>
 <DMNWO08EFJD8.D2G9X082FUKN@nvidia.com>
In-Reply-To: <DMNWO08EFJD8.D2G9X082FUKN@nvidia.com>
X-ClientProxiedBy: TY4P286CA0097.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:369::12) To MW4PR12MB6873.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MW4PR12MB6873:EE_|SN7PR12MB7853:EE_
X-MS-Office365-Filtering-Correlation-Id: 69618bd8-5efd-4ae5-7651-08df3cb278eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|376014|1800799024|366016|23010399003|3023799007|10067099003|6133799003|22082099003|18002099003|261102123227099003|261021121427099003|56012099006|261022075727099003|4143699003|261022115727099003|261009223027099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	lOZSF64s0TeNUl5t5/pGxOc5sc7XHlOlDqujS+5/28OW88EHAnZSjRuOSSiq6KLO1O+MSaw4WQWZbYAx3Lsnnb9Bqu9azJTyP/5i5eLdiiGMjzIzFQBzbSwWWDqGxLyHtTunGy135L5atN1g9gxYbww27D48B690lGS36OO69R5zWDnVLVPKrFUDQTYLDNYhldCS/6XRCUSHYQk7umCDFTLup4zliaKOP0+8ryrTNb4f6pDFF8phzEGDnWXwX5lwPHnSW/aPX2sQh3G5WfpxbApffgg1tUYrMKESwjO6q3v63ccl6g4mpWZMNHbK111d0N7jkoI3DI/ATKzOX56vLojFwAltws/36kNinWtkMBrqWpwA+zznRlAfKgz6+ZyDzFfead53Ey6Okrm4ZqI9edLLSn1fjWKptnvqO0+ASMOUDqeUcVn6fascbKCwsztaMMuO47tKBjYQjLHR7EBLQeAkvuNaUFg9KVLXyd55uL63yrnJ8ire6f06ZfPay/Z7JgtBnsGoxBppEZ/AMOGEBDDFonJu+KgQRglVTw2TI9qEBiBFTxXWFUNkpeUHlHl9uIP/tVXUaLDnjR4B74rgTPiEDBc0WI1FzvILIZf6uZfEgQCbRNGbrsKzoTkbt+h6AeVzJKwUvbZE1a7KaMHIYfR+nw6tpx+aORw5QhGrX0M=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR12MB6873.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(376014)(1800799024)(366016)(23010399003)(3023799007)(10067099003)(6133799003)(22082099003)(18002099003)(261102123227099003)(261021121427099003)(56012099006)(261022075727099003)(4143699003)(261022115727099003)(261009223027099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M3NhM0NsUE9uQ0wyc0JGY3V4ekUwT3hQR3FGay9Ma00rcmxlNFZMVUN2UjN5?=
 =?utf-8?B?cWFWS2l5Y2E1U21ScUYzUUFQNkJ6RExJZ1liZ2dIMDRUSnZTN3FheVp1YW5E?=
 =?utf-8?B?aW5oRG9SV3ZXNjQ1WC84Wk0xTEFLMVdvZStvZzMrUW5RR1N1bm0zSGFkcWRj?=
 =?utf-8?B?dXh1WjlTeXU4ckVMSVkzd0UyRldOZ2VJWGEzUnlicHBGU2RrMGVMd2JpNTNv?=
 =?utf-8?B?N3RXQzhPSDlveVc5SjRUSDMvZE1LZURVUzlrblJsMTBwVXc5KytwQ2YwSEUv?=
 =?utf-8?B?OS80elpaY3k4T0U0cjlXK2cxbG13L1d5TnpxNG5YTDBiYXRPYml0VnFjeXNF?=
 =?utf-8?B?TnlCM0lRUVhvanpGdWxZZFhtVmdIK1JEVkdubUZhaFZITCtlZHVkcFo4M24z?=
 =?utf-8?B?T2tqTFY4OTgxZ1NlZm8xeUdZSVg1Vis4dEVRVU1wREtMZjVQZGlHMkZ0VnJ2?=
 =?utf-8?B?RFZEaUVETHA5ck1TOG1pSkx2WHl5OHZMYzVpOEw5VEgzZ0dwTCtMWENZbGNt?=
 =?utf-8?B?WlR3YlVQY2ZWdWdzaE1VZkVSZFhkdlVsM2cxQkZWR1ZvRFREb0RPMzV1Y2Zu?=
 =?utf-8?B?dUhKaHpiTk5mQkZjZmxIbWJKMWsvdWwxNGNiMjJJaDA3dDJGUHM1ZitzVWFW?=
 =?utf-8?B?TllQOFJoT25yZE1UYVo2ODA1SlFTZVBhTjZtVTNBMzVmNGxiamcxUWI4c2d3?=
 =?utf-8?B?Q1g1d012dUp0L1o3V1dkOVNlZVZjQjNHN0FNRkxrZTRKY2FSeWV4UkUvYXNP?=
 =?utf-8?B?bjJTU0t4dVFTRFg1VUxYR0hZNTZLMldSMTA0eWExaDNoY2dnUVc2alF0T1o4?=
 =?utf-8?B?SC90azBFSlRYYkhza29hTFZsVG9GV2NtMWN3bWtnWnhLZ2Z1UFE4ZmJibDM3?=
 =?utf-8?B?NVB5OCtrelRQWWp1Wm1UUTF1N2J3eDlPRm50UVoxUXVsMGh3czdhdmJ2eWZ5?=
 =?utf-8?B?cFo5czF1b1F4VTNnK1RzczhLclFnWHRJaThQNVRkYVBsQ0d3ZVgyUGpvR0NF?=
 =?utf-8?B?STNNaFNZMUhDOXFVckNHdW9Vc2hrT3RMREcwVjBzRHlJSldQenNhc0YvYnJF?=
 =?utf-8?B?TXhtZ3NLWExNcXV3d29PK2Z4TjJBdjVxMFR4MUtxM1N1VERnVUxvNzRDamZV?=
 =?utf-8?B?SFZPamdNYy9icUhJZXgzcnhuVjBmVDlyUjhRTFhCbG5aRVNtWVoycmh2S253?=
 =?utf-8?B?am9TaE5OSWtVWUV6TE1JcVJBQnI3NHVuZXVGbEMyRVJ2aUdNdUhlR2VaZTIr?=
 =?utf-8?B?b0xPbTBlZ0pGcmdIYWZWZHErQ3NFczY3a2YxQ3craU0xRERadzRCWGZEV0RO?=
 =?utf-8?B?QWIrZ0R3a3A1OTEvOHZKd1NUSS9BZ1FzaUwrQUhJb2hLNG0vN1pWd2RQK01a?=
 =?utf-8?B?My84ZjBaZXN0dVRJdzFoSXlnZFAvbFRjSndpSHRndUxOTGlhQnZ2RUpjanF3?=
 =?utf-8?B?dUJPcFZDUVQ3SDZMWDFiRFNZM1lWNDh0NFJJQUc3aExqNmdYK3dXV3I3UWhX?=
 =?utf-8?B?ZFFEdUh0TEhtcUxzeGpZb1RqS2FieUNLK0RacmV6MFIyZGRsZGJjT3RQNjd6?=
 =?utf-8?B?U0UzSmhOTGZzaU5DUkl6YWtDaUhlNDFnTU1SdXFhTHQxTk8zM01VN29qb3ZW?=
 =?utf-8?B?ZktIQmc2VGJleHdNQytZNXpKdDBUdFRiOUExQmdVL0JFNE1HTWorWTlsd1Uw?=
 =?utf-8?B?V3FNWlZkM1ZKSlZQZVdGT3ZwVjUxSHhnejRGc1pLZnFWaTlNa2pRNFVhd1k2?=
 =?utf-8?B?WjNXWXM2RjgxK21xM0tIYVo4K2d6dlpzOVp6RzhvQXZwaGtsQmF1K1paSXNT?=
 =?utf-8?B?QVF4Y3JEUHR6dnpyTWNCbUdQSkp0Z3BzazlqN0JJYW02KzZwLzdJMnlkdE9J?=
 =?utf-8?B?a21OWnJ2ZlVQaWVMV2svZGpsQjF0S28yMU5oUnhMSzR5Sml4ck1PNHBPRmQw?=
 =?utf-8?B?Z2ZUUTBqRkRpcExVZkVXRldLQjBzdnNMNFlkOXFmY0liejhSVHpId1UrN0hG?=
 =?utf-8?B?WGZSUDIzZk9yQWxHemVhbWE3Nm1wMWN6bGY5S3JJTHlWYjEyOFFpR1NTajdK?=
 =?utf-8?B?US8wV0c5ci96TnlVNVZTcjNJRFVHMFJ5Zy9BVmdTZUhIK29iVXVLSlNWNFpu?=
 =?utf-8?B?UU00R1hnb3Y1RE5XKzk4WHUrcFJ1czg5N0lNd3dGY05YTXFvK1c4dVNlVHpp?=
 =?utf-8?B?N1R5c0JON2lvMlJMKzAwVUpFd1lNRis2blRJRlBvb2dXNzNyNHNJamptaVlC?=
 =?utf-8?B?ak9iL0NFdzFqRWtmZDNNa1BGdkZORVlVejRYVkZTZ1NmL2hXRDJFTWxPVGlT?=
 =?utf-8?B?ZHZra1k5a2JocEdMNUtyNTFZMXExNlZqL0lZYk9mc0daOGo5WFBQQ3VxUS9a?=
 =?utf-8?Q?1OnttYI4pHKEqkq1WfuLySt35dL3qMbBVlNk5yh3Jddma?=
X-MS-Exchange-AntiSpam-MessageData-1: qSfMjZWNuZswhQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 69618bd8-5efd-4ae5-7651-08df3cb278eb
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB6873.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2026 09:35:34.2365
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zSN5/94NXDHH7H3V4EzERHCp9CzH1gd1l9Nx97h1ppIAGdILbMGyA7CnB08DQufRVOeJqXH21W2lwP06NsaEfw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7853

On Fri Nov 6, 2026 at 3:14 PM JST, Eliot Courtney wrote:
> On Tue Nov 3, 2026 at 7:22 PM JST, Alexandre Courbot wrote:
>> The r000 boot protocol has a load-and-execute event in which GSP-RM asks
>> the driver to load a Heavy-Secured binary from framebuffer memory into
>> the GSP falcon's memory by DMA in order to run it.
>>
>> Nova-core's falcon DMA loading method currently only supports loading
>> from a DMA object that the driver had allocated, so there is no way to
>> copy an image from framebuffer memory that an event supplied.
>>
>> Address this by making the source of a falcon DMA transfer an enum,
>> which can be either a DMA object, or a GPU framebuffer address.
>>
>> The framebuffer address source has no user yet, but will be used by the
>> r000 boot protocol.
>>
>> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
>> ---
>
> [...]
>
>> @@ -626,9 +649,13 @@ fn dma_load<F: FalconFirmware<Target =3D E> + Falco=
nDmaLoadable>(&self, fw: &F) ->
>>                      .with_mem_type(FalconFbifMemType::Physical)
>>              });
>> =20
>
> Suggest moving the NV_PFALCON_FBIF_TRANSCFG write into dma_wr because
> once we make the source configurable (i.e. allowing vram as a source)
> it's now possible to call dma_wr with a bogus NV_PFALCON_FBIF_TRANSCFG
> setup with the wrong FalconFbifTarget (but that's determinable from
> `FalconDmaSource`).

Indeed, and actually even without the source being configuration this
should have been programmed there from the get-go! Thanks, will add a
patch for that.
