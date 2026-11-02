Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.208.35
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793607693;
	b=TVZtNvzE6hExCcZR5CLnR5ZAr9w1dEOSq7+2Y486aw10qX+DQgmG5vKV07VyoleFJkKQ
	 Uc1zRYTTlI4sfib8gHlvuuqO/u2dX5lrSbUmCuYRH8pX3fW+wSx4RWlsR/tnb5vSK59xR
	 yQjXB6kcJdamPN6YR9gfe6073aCD74gRxe07f2r2swg7mlzerdew+y3xDGkO0V3amg7nC
	 D9fkydIYMikVVT3MktsVjbjbP944PT8zlgDUKmPhnyWx9exB9dY3RFMGsyODfVAlDIGZI
	 vnHUWymyeu1Lz+jONjIytTuxV01ehKxAs+iKB2nQpJ8tyb61LR8JNdGsOT1oBaYa6nQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793607693;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Content-Type:Date:
	 Message-Id:Cc:Subject:From:To:Content-Transfer-Encoding:References:
	 In-Reply-To:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
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
	bh=MSIMijlFfmkf9i3w/gR7aI59H2oYyDKzDzHlA/2dZnc=;
	b=0REDmmkWcSxsLkqM1Rbg/a19vlEfGRDMohF5p1RYG7+R6XJ20w+yDqlzAjeYYxfrS7tf
	 DGwD/5Yu1g2kCwxOU1Wf9qLnzwuSxNB2pNPm4DRcFeScykrx9AT5eLwFm85cAYsJ0g/ys
	 RmrMllF8j3NCiH/C0tMr5SLR1/SkVCoG9zx77QLTzs38kb1uWcXOcYGrX8aNaJtqu8/sW
	 cGt/EUIDoBosY3ulSAk6TCHCCqSBgSxv9/XaoxZxWC5kbDQbWae2VvYWFbgcByuyGA953
	 SuuRRn3w3sAVOFTsKlLnf9t9uM1PozE8PsJWkBAY/9j6F8ZzWFWEtF1R8m27TU0Ayjg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=NPjgMK4Z;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.208.35
Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011035.outbound.protection.outlook.com [40.107.208.35])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C5E6606A327
	for <nova-gpu@lists.linux.dev>; Mon,  2 Nov 2026 08:21:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C5E6606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=NPjgMK4Z
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ksf2urz5mhI2eDBBHIpsJ3MeSePBEz1nbZ94xAbJbBN7g6/o7bxjesuKZvLNZTbkErpxrd4DDQ+GMnuiyE1kU/S5Ylgr0DgczqQf3k2crrHSNloAlgXyPoANg/0mCsQf12NtND2gse2QDltzUG+KWJJ/BzBhiMHsyggzsTPAXmVVDaShzexkhBokW7MDpZqbC4iuM1Uh+MsUzX2OJkcRK+sOk6ltELr+z6UqSQOpTQkhex/oUoE5xnSa10zdama8aIBTJ4UUSoCsIpNlQqY7aFtOQ24uOEMVNx6kzlGRaJ5NVC6r3sVXnSIZRYH7tBaG4DK5ohePQZJBZwlVFjSnPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MSIMijlFfmkf9i3w/gR7aI59H2oYyDKzDzHlA/2dZnc=;
 b=Lphkhu6dmW2oUBlRsBueokP7hJSF6iarXuxsifPs0eH3H4WGcQzjy5WSJmSFqylNpezVqCEZNUDe69BCpS4VqLbXpi7JAaGfsMxZDe6RUAsB5DfSo/V2b/2wnaas38w7J+5gMNI7GJGkAE0fEVplS25UOUU6Y8tRMYrtHJKaWoN2SEwxN/38mOrD5Zx6LL0WhwP9NZwhpsa+UmxbsYSBTyGInLr5MPo2k3ZxDf3pdPeBJUTLT675dzLYVgCmY+EBQQ+qa7ou1Ii6yBg3b6zc8Bc0eEVlrsPlP7KupKotiwauARBw8TXXBfEyCjTrXWIIiL1q6SNW1StYas0tH2vVEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MSIMijlFfmkf9i3w/gR7aI59H2oYyDKzDzHlA/2dZnc=;
 b=NPjgMK4Z1XVRxkZRpkJyTAS8i02A2u0vEakDOtndxhMUbiZeFxSwgshPzMCY1F80nymYMLsvzFdrLtNoRIw69uF94GHaN8vse0yHQMizHr1c6os/D+EWJ71RA1W6jZ3ywyDkodqun45CMa/2EhwObBhI3Vbuc7mQlQu3tE0wMrFB/RHqdOi634ev3DqQ6RwuupFHJCe4iZCm3NfFvZkyZR56zQ0Om9lx2MevSLUFaopu/Ya3CF/KfUfZwmHmQFS601GiZj68slzcX+gkCkM1i5tN+yUb84t1z8qo2EejcYm8KjTCFZnAozrRs09A+iiyM1ZXrpXIIhrT3ajyYGJ2qg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MW4PR12MB6873.namprd12.prod.outlook.com (2603:10b6:303:20c::17)
 by IA0PPFB6B4D32F9.namprd12.prod.outlook.com (2603:10b6:20f:fc04::be3) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Mon, 2 Nov
 2026 08:21:28 +0000
Received: from MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1]) by MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1%5]) with mapi id 15.21.0569.011; Mon, 2 Nov 2026
 08:21:27 +0000
Content-Type: text/plain; charset=UTF-8
Date: Mon, 02 Nov 2026 17:21:23 +0900
Message-Id: <DMKKUYPSESMS.10KUP2YTWFAF9@nvidia.com>
Cc: <dakr@kernel.org>, <airlied@gmail.com>, <simona@ffwll.ch>,
 <ojeda@kernel.org>, <alex.gaynor@gmail.com>, <boqun.feng@gmail.com>,
 <gary@garyguo.net>, <bjorn3_gh@protonmail.com>, <lossin@kernel.org>,
 <a.hindborg@kernel.org>, <aliceryhl@google.com>, <tmgross@umich.edu>,
 <jhubbard@nvidia.com>, <ecourtney@nvidia.com>, <joelagnelf@nvidia.com>,
 <apopple@nvidia.com>, <cjia@nvidia.com>, <smitra@nvidia.com>,
 <kjaju@nvidia.com>, <alkumar@nvidia.com>, <ankita@nvidia.com>,
 <aniketa@nvidia.com>, <kwankhede@nvidia.com>, <targupta@nvidia.com>,
 <nova-gpu@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
 <zhiwang@kernel.org>
Subject: Re: [PATCH v2 1/1] gpu: nova-core: populate GSP_VF_INFO when vGPU
 is enabled
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Zhi Wang" <zhiw@nvidia.com>
Content-Transfer-Encoding: quoted-printable
References: <20260804170045.902069-1-zhiw@nvidia.com>
 <20260804170045.902069-2-zhiw@nvidia.com>
In-Reply-To: <20260804170045.902069-2-zhiw@nvidia.com>
X-ClientProxiedBy: OS7PR01CA0060.jpnprd01.prod.outlook.com
 (2603:1096:604:254::19) To MW4PR12MB6873.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MW4PR12MB6873:EE_|IA0PPFB6B4D32F9:EE_
X-MS-Office365-Filtering-Correlation-Id: 58da2fa9-4533-4b59-4b0e-08df38ba4a4d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|23010399003|1800799024|10070799003|366016|4143699003|11063799006|56012099006|261009223027099003|261021121427099003|261026121527099003|261022075727099003|10067099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	aaXKkuWzRRKBJo5wk7h3B/OxHlNXy30cNRnn03ezzSHHvi6XvHMotyfrNCTev6fnH1pC4dd3i9donz5GawMilt9tcvuy2z9gbSChkp/Ud2QYYH8O8AjA7+0gkZbuxxYXC1wGZRp4K+jinssJxDhY9hd0gXTGx41iby93REJncL1n3ybUA/bRtxyZDLZNGhfPIdI7sGsfkSu7/uKHe3nf2FXbkDBSI7dOy7IlWTTpWwOYjCH2kTgyqjmqq/WaHkohETAQqBTghEEH25bpWWP5BJunoPh5lGGE+M8QbjetgxjRG1SbZY64Z6OWylYUQl1QX8fgUF+ZEK66ghPNe0v3Wqq2qiZLjdorGgGousx/H4k/gwC/oA78WoEbsEy6BY7somK2CdalRovKunJq8qJRjFmx4JDOuidQNWZZanoBjwG+1na/w7j5PRPvvdNaMUGf/f4qLPPz3Tq+rgRpEhENtyz+MVJM/Fz4az7TuHks9BfHPm+uOgJG1X98RQpFSzlQdJUIxacHevnVtuuTTipoWYPSXc0qc0xKia7zClZvU4p9hvG1h4MKTRpXHCXzt8qACHLpB9OUMQeAZ4ECOvZRUj4mWUVD2SFSN3xpl0jrmbPrKOvBeiVNEYs3VaonX2zqyHcOk7IKrPBu7k6+a9zPMQ4yocYVUTkWTnc/rHYSIFM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR12MB6873.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(23010399003)(1800799024)(10070799003)(366016)(4143699003)(11063799006)(56012099006)(261009223027099003)(261021121427099003)(261026121527099003)(261022075727099003)(10067099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dXZQbjh1Qk9RVnV3cDdHK3gzb1hMZW4wZXZ2aWUvM3lFdHROazM3d0EzUmx2?=
 =?utf-8?B?MkUxNjFLMm55bFRHalFWTnpwVFhpOFJJZzhETHVia2QxYzZJdE9HNVZUUndB?=
 =?utf-8?B?ajV4V01FZFgrM242TmZGYzhsNVRIVzRNaUs1UGlWOXQ0dnI4ZkVLV2FVUlEy?=
 =?utf-8?B?djg0a09pSnU5dWtieDJBMGxvTUJNdWpDYlpMRXAzSDRKNG92ZEhueWd2VVpD?=
 =?utf-8?B?M2pmTjdTY3IyYlVCM0lrU3ZxMGdUeXNhU0Jkc0pDTTh0c3dlODc2N3NTVnA3?=
 =?utf-8?B?cmVJU1JNdUViMEpvakdHQ3hGMVc4MjJuTnFUZHNGUytjQnFab2ZVZWZPNkpi?=
 =?utf-8?B?TTFpY09MMjg4K0l4SitvaTgzZXhtaFJ3dVUwNnJCNGlhZnZWdTV6aWVFZE5x?=
 =?utf-8?B?MngzU1V1STU4bEF4ZC9SY01vR3J4d2FpVlNDUVdkazZrQk0rWkdzSGNWczBn?=
 =?utf-8?B?bEYzWlRTaUR0S2V4eno0ZzJ1aGN1amZ2ZVJyMGlldDRBbVZuWTAybTVyNTlW?=
 =?utf-8?B?NFQzcXJLZFF2MXl1OWVaa3Z4UzFSZE4xZEJCdGhtVG9VRHc5UXcvRVNwQWw0?=
 =?utf-8?B?WEI0WHQ5UFZ6RXJGT3R6U2hTZUV3WUVmV0FjdkkyWVFQK0RtSDduZEJocDRJ?=
 =?utf-8?B?QTd2bzROZFNqcFhCN3NiOXVYNTNpd1phK3NwcThYaCtGYUNrTjIzeGEwK0JM?=
 =?utf-8?B?NGpnSms3Mk05R1hMa2NONFM4YUVXT0V4OU5IN2JoMHB1dHMzNXl1VXdnb2tk?=
 =?utf-8?B?OHh3aTF5YkhkRTJGakJGQ3FSSy9LYkFQUTJpbXJ2T1hrVDliWXlybmtTM3F5?=
 =?utf-8?B?OHByUWxyaXJuWkhlcytXKy9KMWlpbllkNEduenJSSXRYSFQwRGNoc0k5ZUpu?=
 =?utf-8?B?RmxFU2tvUmk1eXBjR2JnSUNTZ0Z5eisrSm0xdkhwSzczb25SUFpFZlhwMnBE?=
 =?utf-8?B?U2RndDB4RnM0VzcyTkdWMzBnUnowTjhJcWg5OGNQSHR2ajJveHRPZS9yYm5v?=
 =?utf-8?B?QUpxdno0NTg4dWZBUGJSekxTVHF2R3p5Wis0U3lIZkg3SlN3NTFoWlQyTXhB?=
 =?utf-8?B?WDZPNkxzUGExTlRCLzlmT1Z0WHVoY0V0WE8zRjdudFJsNkxIeGVmZFprcmox?=
 =?utf-8?B?bTJTWVhUNS9sWUY5ajQ4UU03eFlmTEphVk0vVGh4aUYzOWFDV1VBbXJUU2lL?=
 =?utf-8?B?ZVlaanM0cUg5cXh3VTRNTGJjMDhqVjRicVF2SWRLS05wbC94OUNmekthOHB4?=
 =?utf-8?B?UW95Z1dKdWh2MTd2SGRoTXJGeWo3UHZwRENGYzRHVkRtNzJobzdERkpCaWNo?=
 =?utf-8?B?amp3V0xGbFM1SGFYaU9zWGI4UytlMXIwVHFaeWdLem5KU3N2MUZadmM4ZkZP?=
 =?utf-8?B?Vjg4d01iSllqSkwxRVVvSitLeFF6bEkrdmZiRUpqdTBDN3l2ZGhzTHE0Zy9r?=
 =?utf-8?B?MERQdDQyTUFKcGZtZWZVLzE2TWhwcTJjT2hXV3JHMnpEdWFRVlZyYW9RYWl4?=
 =?utf-8?B?akQ1cmtJZGd5N2hOMHByUHo3SzEzdEpBazhmSEM5c1NKV2oyTmZsb0NsTGtW?=
 =?utf-8?B?OWZaYUc4VDFNSVV2enRUTmJhM1hpemhCSGJxRTR6NDFRQ2FQMm1NaDBuLy9q?=
 =?utf-8?B?Z2ZHalNNR09OT2tkcUpCQWRMVzQ0TmtSYzJqT29lTnB1bHpVaVBKQkJKY21V?=
 =?utf-8?B?TlVmNy8wUFlVZ2VaMkFuOFlUWDZHdjN3QnRqa2hKVWN3b282bVZ5WXE1YXJv?=
 =?utf-8?B?MldYV3BVQ0hsU0twMml2OXBreGlGc0s0L2hpWGs3alJlVWdhV0hwTmFNYTdI?=
 =?utf-8?B?SXZ5UUdvNzE0YjRRelNKMjVzNTZjZHBzVjBVVlpmRHRMazJmbFNUOHZ2RXI5?=
 =?utf-8?B?MG0reWtmaTM5NFA3aXhyb3lSTzN2K1kwbW9NLytTNjg4R20zNURpT3lFbWk5?=
 =?utf-8?B?ODZqOGVuT1E3OTAxT3QxTDNtZUtPUXV6SEZQcmw0Ulh3SWpBMERoUGlyNVdz?=
 =?utf-8?B?MVdxRkpIVlFCdENxYU1iTjBOWXU3RExiSXB6aFI2T2Z4MU80eFg3ZUprMWh6?=
 =?utf-8?B?VnVUcDk1U3plQng0V2ZOTUZMQ0U0ZUV1aThscEFiYWFBd08rVVFFYkkwM2lE?=
 =?utf-8?B?OC9pbUtzbzJpWURLZVg1SEZ2dUdNbU1yZEFBMFI5bXRjSXpCRy9LcUhCWE9S?=
 =?utf-8?B?Qld4eVRyMW5sOVU5dDJBTWh4QmF2czNoSDd2U256dTlWakhIVis0NGtPdytw?=
 =?utf-8?B?cHRLa1QyNmhSa3JiNXRMTEFSYnVSQ3ZEakJsS3BnOXBlZjBuKzNpaWlSWXE1?=
 =?utf-8?B?VUZOdTR4LzZFSGx1ZXc1MW9YOHhnTWdVdHNhakpGSXMyM2o2RE0zNmxJVkpL?=
 =?utf-8?Q?XTRS/Xlf5gJdd/CAlje0CBrtedYfRT8IIJ2x255K3MjRx?=
X-MS-Exchange-AntiSpam-MessageData-1: lCyBfNnwrMNdHA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58da2fa9-4533-4b59-4b0e-08df38ba4a4d
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB6873.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2026 08:21:27.3619
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n5sTX/R70vxVS62VC1dLgJYOMWYSacZZaanEjR/3Yra8/fPIC2Tpnn0lpmGNaXn4Hu3dvVL9wE28OMlzURRwKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PPFB6B4D32F9

On Wed Aug 5, 2026 at 2:00 AM JST, Zhi Wang wrote:
> GSP firmware requires VF BAR layout information to correctly route
> interrupts and doorbell events to individual virtual functions.
> Without this data the firmware cannot set up per-VF event routing.
>
> When vGPU mode is enabled, read the VF topology from the typed PCI
> SR-IOV extended capability and populate the GSP_VF_INFO embedded in
> the GSP_SYSTEM_INFO command. Keep the VF information builder associated
> with GspSetSystemInfo since it is only used to construct that command.
>
> Link: https://lore.kernel.org/nova-gpu/20260730181404.776028-2-zhiw@nvidi=
a.com/
> Signed-off-by: Zhi Wang <zhiw@nvidia.com>

Pushed to drm-rust-next, thanks!
