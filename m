Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.43.23
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794306065;
	b=nGff82wg98Ah998jspT1Ye7XRPsbd9yuUjDDBAfyETahxrhX35dee+DU0+c9KoYtk7eH
	 FXjDJ1s1dwvL7E9lfw4f0dxCy9U79EaDKFS/Fj9BACTuOYckGFLXKfJJymZhnZ8pT//6W
	 TgZN3zBDOfPa2O8MAXlsy9P0qnv3KuOl36Uj8m80C5f7XAZXXBNKTWDaRXb6PR4cOvcPk
	 7McxoLFV2NGoOZIBRfYJ4p/fQi8FmzFXOGYlP9QErC0WUSwyjL+PFGhcZs0KFcR5BlZ6p
	 9gE8bj1ZV9+9883I+9TJ+IWA/G1kGRMIuF6r2XyPH4q3k9eCiwxl930TmSVK3LryjOQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794306065;
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
	b=4aCslI3IntgVPl7xUcEP+QDz825jy5s8yZf5+Y69Jkgz2d4LTF++Ud6zTiyDFiAbnCj5
	 jPfsbEtU1QyrGIj3WTsfTo4eYB92MAf9RZ8rlBuhGcQ8KiGDZVSyQe9bIx4JRmyseCVgV
	 B+LSaQo3eg+/r0xOmsx2sEynWsGLxt3sG+KPcsNUDJZ4x8rJnfWXK3U3PwCPeAQo8pQ8F
	 JkIF4TKqD3ZjTSEVCJJG7VjYQw9tJ0RlYmGfzZaYQuJsB5+DjFy9DbC2J3Jc5RuTCwHeX
	 ievB+Y8VO7ZUeYlvvioZnRi7QPAyvoDOjwVXiKoLbvqEkIx+rSct4oakkSDnjb4j4Kg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b="EhUfX/He";
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.43.23
Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012023.outbound.protection.outlook.com [52.101.43.23])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7432960A382E
	for <nova-gpu@lists.linux.dev>; Tue, 10 Nov 2026 10:21:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7432960A382E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=EhUfX/He
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QN2KyLpcBOQdFtvZ+maH10pDUSsVXa3fDtpNfdsq4d/3dT1BoOe6cJc7zX1fxhuZ7JU4dAFA9I+CO9PO4HW6yaO2RXwaqnLWxrN5vDYPfWQjR1lgYmh9NxwMqUgSq2iHiS9f39rdtlFCvvczP16DpT7vnm0PZdA+77QUi4f16zmVCiWiHkDfqfeahWzleakyo8o/ON5qq3IApMhRKOlYaBIbqtrJp79SGZbINii1/b8YKonU0MEy3uRGKX/AMRuokZ/hg309gdNkaz97XZw4+ydA4Y2CEXMNh+EZth7OrdlCTdfODYks81s4mzFY+XIOmPhbxOkFT8JKpzs/rvHxDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5f6itDKsiz0dRIwfeZ+c5zlt6fqSfGn1ZQnII+JassQ=;
 b=AhV7FH/qUkew8JtAYqUHSdJgX5+dDTQitmJybFOTChvjNCW0RNrt80xQmepMLPdoLJfwEZmGg289FAhOGonQv3tA9kXzio0MKNu03E5AMgcJ4XUZPpX92CZhmOfXS/jpkof8gVXFemU6he85H+w59WovXwRQe2RQo7gGgas4HrUdt1+fgMPlnnHWKKwThLzk4WPXJivosAt9vmDIMI4wjwolcBi3Z/R9Y6LzTeNneRXl702+ZqZG5jeJp+16ZOccemV50OiyqvySQiw3jh9AbF44QkGXdVRWyF27Myow7gpVBIOAkS3eY1mARGGtqocFmfcVOaAq5ULhEPPkfm1pAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5f6itDKsiz0dRIwfeZ+c5zlt6fqSfGn1ZQnII+JassQ=;
 b=EhUfX/HeOl+dUQhfQdR/fs6jrnzXSCZfVyO+tz775AZIqEKroh9BCbsp9vrFs7ubjGvhlqYU3s9YD36VUkGLmHNPISr5oSrsnA36ToWRXPlkqVUQrQnhow2qfho2VAtz8QfrUcwesK2POgaCJ1VoY0Y9R9YPNxFNTdGrL8M0DsV+A46FQgYSIIP4ueJ6Me6+qAxh0g13kPgUUdxPn2+z1k2uJhSM9NlvmQrPTVa+Fun2HYW6kJ2lK1SQ/XQMeeb1mzyDyPVxX6PN9BYTXc/MzbatD8MjhGjsOJcn3CiPzJykLzuqXXWFyJiJbO48UUfpiRlmzAfk7p/YdUnkw/t35w==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MW4PR12MB6873.namprd12.prod.outlook.com (2603:10b6:303:20c::17)
 by SAEPR12MB328447.namprd12.prod.outlook.com (2603:10b6:802:209::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Tue, 10 Nov
 2026 10:21:01 +0000
Received: from MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1]) by MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1%5]) with mapi id 15.21.0592.010; Tue, 10 Nov 2026
 10:21:01 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Tue, 10 Nov 2026 19:20:50 +0900
Subject: [PATCH v3 01/13] gpu: nova-core: separate the generic falcon
 bootloader from FWSEC
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261110-r000-fw-v3-1-20d79ebb646f@nvidia.com>
References: <20261110-r000-fw-v3-0-20d79ebb646f@nvidia.com>
In-Reply-To: <20261110-r000-fw-v3-0-20d79ebb646f@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: John Hubbard <jhubbard@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Eliot Courtney <ecourtney@nvidia.com>, Zhi Wang <zhiw@nvidia.com>, 
 nova-gpu@lists.linux.dev, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: TY4PR01CA0016.jpnprd01.prod.outlook.com
 (2603:1096:405:2bf::15) To MW4PR12MB6873.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MW4PR12MB6873:EE_|SAEPR12MB328447:EE_
X-MS-Office365-Filtering-Correlation-Id: 955e0132-0a01-4771-621c-08df3f145182
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|10070799003|23010399003|10067099003|11063799006|56012099006|261022113327099003|261021123027099003|261022075727099003|261021121427099003|261022115727099003|261026121527099003|261102123227099003|261009223027099003|18002099003|22082099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	DJmRp3NsIgBz/lGAXExX/dgg2RDlTHd5Ayv6yKZYpR6QCkk4nugJ1NBfZv9DEf67kpFAK9thukrnLTfxBs5BboEo+TatE/SoYqEx/d/oFgMedJB2IYW2U29Ov+THvsfDNg0cn+OLmsDim900f6BO3SqXkU4dvuVIxaTJK6GZuyZwGmfO60J9WbIVL1y34Q/+TSrQBEivZz9RgQiUrHAjXf6g5PrBvjoFruYRtL5Jq9ssVy+e3kken8KbYqxSkvg4PS+ivj8KLrpCKK7O9yhCw8YSkazdYOE3dm/nv6fSm4HE+j742olbdKpWtOEYovKbeVPGA5yw3BmtZtVKCsulQtnMJU1wzrBFlBA/v7mQU4E6fIlgS247xILKcrAnfvu5dRYWknlTupKFSXTT6T6WDHTAUT9wI4mP1qTnq+RXXmsLkHTt8J5el3NkEsz3jFa3VBcD6neY/n108r0/YMdz35ZItEF77xgxjgJaokd5TdGzO0sWanC2JxCPL8H5vO9gSyaqOWiRvutm/GUE1cOiLcosx6YStxBcXwhzkSTfovVNMaOchOnKJVwypNoc67h5K7GD7nTmXD0jpoqftZqOAqBdn5Aa9Z9SmvN3vXMfC64jN9vB5ltXmJcnEvbf/TNKbj9AX1STuOYj8RY56DdsEkqdjrlETVDogetIeN5zdVk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR12MB6873.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(10070799003)(23010399003)(10067099003)(11063799006)(56012099006)(261022113327099003)(261021123027099003)(261022075727099003)(261021121427099003)(261022115727099003)(261026121527099003)(261102123227099003)(261009223027099003)(18002099003)(22082099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RjFneUc4My9wYUZiM1ZZZXVEZ1VIRWtsQ1F4RElMdDhNeTNPWWduOWFQSlBY?=
 =?utf-8?B?a1hGUVhyY29xdEhxazU3V0svakdxcWo3c01CeFNsMkNaSnZWSitxbGNYVjRr?=
 =?utf-8?B?Z3hLTlRFSnZ0QkUwbnRLeCtqUU5rVlpnUTN3VUJFU0NiSnlpNUE3MkM0eWRp?=
 =?utf-8?B?Q1RyWWhzMHdOeExBVkNXUkoxeUVOM21IQUZidVdsQjlseXZZV0k2S3RQNnd0?=
 =?utf-8?B?aTJIL3dYeWhSSUhMQ0h2aC85NFJteEVTYitHSS9pZTZzbEx4K1laRExVYnFs?=
 =?utf-8?B?cEJjelpXcWZmblp4VlprSUVXQmMyM2NFTDZBUS9qaFAzRjNxS2E2REd3TFVB?=
 =?utf-8?B?Rk5YWkg4UWNMM0krS2tTSjhVRlVMWUw3dTRvTlRwSFRxblBRakFNQkUxR3F2?=
 =?utf-8?B?RjBpbHFtbnpHZnF6MnZ2K21MZXNaZnRvL0wwSWpjdUZjUjNETVdUcE9aYjZo?=
 =?utf-8?B?UFFaak0zVEpEbFRYKzJDbTc0V0VmVlFxeWxKSWd0ZVN1SjR1ckMwWDcyekZZ?=
 =?utf-8?B?N1NodkhtajV5cnNFR28rOHVGZTk4VWplTVJpNGpmcUtoWXRkbUE5dXAxbDBR?=
 =?utf-8?B?NE9qTllwSWZXMXJ0dVI4NTFPZWgyUlpuUHRDRURrc1JXTlFkZUN5VnJoOW90?=
 =?utf-8?B?NzdZWUx5UlJRd3NKcW5LODEwWmQxTnh5MWNYbXptWjMzMU42UG4zaVE5Rmht?=
 =?utf-8?B?UjlaU3FEVmFRQmo1dUtOVE56Y2wrQThVcGZJL0NKcGNCYS8vZlRsN05LRS9o?=
 =?utf-8?B?dFVOWFNERUx1UXhmZDQ0dkpNb1pUSW9sTkNsWVUvTEpEQUtxQXlqSmY4Z29l?=
 =?utf-8?B?VWg4TTB5YnNXcm5acWFSbU44TjcwUmV3RVBJb3owL21JWm5kWGVyNzZZQjVW?=
 =?utf-8?B?eTZoZm5JZFJHbG5nU2pSTCtBbTAzQkdHQVFpdWdIeVFIOTF0VkZLZ1hmWUUy?=
 =?utf-8?B?cmFadGJ3WFRhMXFTcXUySm9IbkZzV0RtYkp3MUhQUy9ERmk5cTlkaHBPWm9B?=
 =?utf-8?B?aldYNURKZHExS2dGZWVPTVRPZEdVOXlVSW95ZkV2YWVlT0NzbGJPQlNYNytZ?=
 =?utf-8?B?YVlKcVhOaUp3Q2E4RXBUbUhwVnlBUFVnbjBOQXZROWFVR09YT1d2NFA4WmVC?=
 =?utf-8?B?MGQ0cVYrMm4vbUZoWkxJN1VSUGVSTTVHVjRoa282Yk1Kekd1MlpHZWJDYnlB?=
 =?utf-8?B?WFZvR25VYktsYmt5cTBvZytSTmtMZmNrQ3NRUkhDRXJtK2JWUEpkc0JLRThi?=
 =?utf-8?B?TlJZKzFQdERJNnErbXhZUFlUeGVuZm01N2doczRoeDRsWGpVdFNNdnRNbkRD?=
 =?utf-8?B?VkF4bnUyOHhuTGZNcVMyVGJnbk5OSVBDVjJ6eE5NQUhNQmpKcmhyOHZJaXNt?=
 =?utf-8?B?YURJdHg3ditRYktzcHRZWTR5RE9vNHJuTGF1SHgweTJ3UWtaTUhyKzQzVUdx?=
 =?utf-8?B?MGxtcVluTDhnWVlWTG5lK1hSZ1h4cm1EUmd1V1J6cEZrekp5bEdsUUUwVkdV?=
 =?utf-8?B?K1VyWUFMcldLRzJkdEFxeC9JcHMzaUdkY2Zzc3ZveEZ3a3RKR2RHakdXaU56?=
 =?utf-8?B?V2JSVkRRZ0xWR3VzWXZ1bm5wSHNDZ2paZkx0VU9LWTdTL0xKajZMY0xHNnRx?=
 =?utf-8?B?WXdzbGRCK1VBeXY1L1llS2VOVHpBc1hzY3RKM1JTak5Jbi83cXBvNVdiTHVL?=
 =?utf-8?B?SFlIV0hJdjdoUHY5RlpDQ1pkMHAxWWlDcThKdEVxSUt3YnVZM1NmZVlyMDB0?=
 =?utf-8?B?QURVVkM5Zi8vV08wVDJuR3lhZ2NwSE02WENTZkg3dlRjWTQyL2ZiMWxrSFpq?=
 =?utf-8?B?OG02eC8xcDlQdkFXWFFHNU1RUExHM0VEc05MckoyKzFLZVE4dGV5blFBeFR3?=
 =?utf-8?B?Sk5TbDhtZS93SDNWaGdnd1RMSUFpZkE2eEFCeUJkam9MSTI2aFRQVnFqNWsw?=
 =?utf-8?B?TTdGVGlQZFhUeVBCRU5RWjZQNEhYMWNFQ2h2M2xtakFSWVVYcGZ1L0hEY1cv?=
 =?utf-8?B?bGt4eWxUdGdDVjdOamFGWHdQaEswd2RMdzRuU1FVaS9HVTU0K2RBMjlHajZ5?=
 =?utf-8?B?Y2tZZU1KVWtlRVZEM2ltZ1d3WmQvRGRCK21hZzFaaTB6RkFVUUdPeXl2cmxq?=
 =?utf-8?B?cWhsV3RUUnFIUmxmQ05pTmQxV2VvSXRGM1VRb0U1dnp2OHhnT2xsN1hBV3dF?=
 =?utf-8?B?S0E4eVU1NEw2cHdsMmFCcW5yWmxYOEt0M0xmbFcwSFNxM1dOQjFoSXdOdVY2?=
 =?utf-8?B?TkFtRGdJK3pRMVdWdGd0bU5UendlY0RXaTZLQ0swNmppQnNIME9tcHNNckMr?=
 =?utf-8?B?M3RqcSs0ZnJQWWpFWEd0YmNIZVMwQzZtRWZMZlI4Q24wNTFKaTl4bSsyaDF1?=
 =?utf-8?Q?kmUdC296mrlY5bYO7Ht1xsammwWhPotLzCIxGSt6QjX97?=
X-MS-Exchange-AntiSpam-MessageData-1: E3OF4mSOPPG7OA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 955e0132-0a01-4771-621c-08df3f145182
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB6873.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2026 10:21:01.0849
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9gDrsUD/zm898dino2K4ojRuebwALSQfq0IjPnC2Ef4We2ST8ZpXlDHI8cGoYeRxL8ekw16e3S/yH9lc8vgnDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SAEPR12MB328447

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

