Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.52.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794361215;
	b=dPjlH9y8l92okvkqsgS7fHiTPaPPq5NNZSZgMtlNDj8blFquMeTG0NUeZ6Gm8BTH0a1G
	 g2dvah4a0hJqruEBEDLQRNoZiIZckxVbYOULLaMqKaLgoDQNHsCmIeT4HfJTTG3bq2Gn3
	 3nKAGJdjSDiiYd7dyckA5+wlJZG6QF1T2BE9vKUXp/jJPPU58/Lp4VYdrttCegsIe85vu
	 Qrdd4clS2BixLk0/JfZ4YuoFdnKcfWQxCj7dbQMNYk2fqU3VgimThIj0LyoAvZmCys2iX
	 pjWNVfBX6o4NsiIXbAy8u3lPmRmtf/cLy0QsW2erafhnC0FHhlGKpmtTMRI0Kope5eQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794361215;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:Subject:Date:
	 Message-Id:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-ClientProxiedBy:MIME-Version:
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
	bh=8vLMC7GmyFDXT581O9rOwctl3rMuk0XeOS+WDmAFdrA=;
	b=KFF/Hetr5i8JqZHiiYPLOk9GMF/oij1+/IjufoPQgO/sFF3c2w7LTKy4kWr64L33lUAX
	 VIu51EHCrpy1zMrpqutLNUfPsODOrBcu2uuCPsmViRgstXo11MajG4ToroPU3DXxQp2Y/
	 1+rhj/BoliJ7DW9vU+9kbZWiv+pC3ndKTXH3HYVoNIitm1s9ypB5g3bjhZCdVU/CDMPpD
	 M34jcT7a2usIn76ltUiarIcfx/Es+7O3c3Kne2razygmY04lGRz2i0LZC2kZBrBpDVgZ+
	 3xQ8In2ZVOp1y7uSgJEavksSu5C6+n2Ye2B0p6p/X0x/Kw7s8qrPDKXxrCRo0kXZE6Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=bz1Y93sr;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.52.53
Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011053.outbound.protection.outlook.com [52.101.52.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40043606A333
	for <nova-gpu@lists.linux.dev>; Wed, 11 Nov 2026 01:40:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 40043606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=bz1Y93sr
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kFXE4z9wvtblSCgfkJmSPrdLPdgOE7mErFMAq6XzWqPYw4jOANAKu355bV6RTKV/IK4mRYJoj3xWThha7zMrGprPCenlKj2rYSwBOEK6h0PePYFf9rQpSNFJfjv31eHMysSP7aM/X1G1RzivaqCbZ3XYhmV3Yd0IeW+yS8TfqtCr7q5dLc2BBwUvpXSe/BCIROkMnKe3rScfH6oxMrh6m/fR4ytVe+RlYyLILBDct9R+PlyP0yRT+lZB9548qpmyzfeMEqUq08zAQarR6OFUZUnlM0/D/OTqB/5E0JUbEZS8RGoIKRg+FKKtNobVclKgZ2E+IZA5XoP2Q/YoCS+d0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8vLMC7GmyFDXT581O9rOwctl3rMuk0XeOS+WDmAFdrA=;
 b=Za7ymxjwuRGR3vPpFQ62+dL5PMsGtNzTm/K/mj5aKgG6oSPvmmti319GyvtB3Mu16eiOnG5CA/HxdcVGek0szLn5uJ769tBpF6IhnxMDLEXEzOBs6MEEVOAkv1Dxbl809wqcmyxysoCrUkcB0mv4Qv/mtjHRIIZHKBBs2/BIcKdh7OFoRkaFm1xDdk7w0/cH+VsFYyXK+vBEaOIaQxjQraqsfRuSahBkFo5vLTAW/t+KTHoHDlt8auC+uUZ8KNGLLGjAYtC+5UU07E3m9/tE7luZLj82WVEFDqEZ2SpwYR0qBuIKPvqRkDRuP9CYwl2UWrICfEcArr9IChFbMzMVSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8vLMC7GmyFDXT581O9rOwctl3rMuk0XeOS+WDmAFdrA=;
 b=bz1Y93sru88h8VkhxQZOL55hBHYjsyIY8oeE8jvEgMS/2YcbTDyKNCavZUHEMYNr0PNh2TmwrLqwLGm8Kj7XJQNRWZzdbs2MkV7Egbz6W5OqKfKFn86V4AQ09hNaYIqjE+GzlEjY3JOLcOo/kt++6qqdsY7C/Vbpbv/vUm/3pa5Jq1sTaLmX2/MYbOtOfHeJHuc30R4i4ZPSNOBH13mRL8v9y6yEUovWdsfRjngEwNXRMLMDMxpX8pyDajCTtsLgf4jPWYLKBSAswoBcadx76WElV3N2TJV+gviXlv2aDyoVYFWw/ooNJKC3bl56GHJt4LO8auMIci/plpAjeOx8Lw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6413.namprd12.prod.outlook.com (2603:10b6:8:ce::10) by
 EAYPR12MB796180.namprd12.prod.outlook.com (2603:10b6:303:2fb::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Wed, 11 Nov
 2026 01:38:11 +0000
Received: from DS0PR12MB6413.namprd12.prod.outlook.com
 ([fe80::e82a:6673:4142:37fa]) by DS0PR12MB6413.namprd12.prod.outlook.com
 ([fe80::e82a:6673:4142:37fa%5]) with mapi id 15.21.0592.010; Wed, 11 Nov 2026
 01:38:10 +0000
From: Eliot Courtney <ecourtney@nvidia.com>
Subject: [PATCH 0/2] gpu: nova-core: gsp: fix misc cmdq issues
Date: Wed, 11 Nov 2026 10:37:33 +0900
Message-Id: <20261111-msgq-64-pages-v1-0-d8c56b6fdd6c@nvidia.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/y2NywrCMBBFf6XM2kA6sY/4K9JFJpnUCH0lrQil/
 260Lg+ce+4OiWPgBLdih8ivkMI0ZigvBdiHGXsWwWUGlFiXpdRiSP0i6quYTc9JkCGFVipXYwN
 5M0f24f3r3buT00ZPtus38jciL1s+Wk8NyCQWdhqGsN6Khq3TzKh9Q55YG9RKV+jJtsoq35JrU
 FbOQXccHw/GSG69AAAA
X-Change-ID: 20261109-msgq-64-pages-bab32c03d627
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Alexandre Courbot <acourbot@nvidia.com>
Cc: John Hubbard <jhubbard@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 nova-gpu@lists.linux.dev, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Eliot Courtney <ecourtney@nvidia.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: TYCP286CA0136.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31b::20) To DS0PR12MB6413.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: DS0PR12MB6413:EE_|EAYPR12MB796180:EE_
X-MS-Office365-Filtering-Correlation-Id: fb75a534-9c58-40c3-7c49-08df3f947153
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|10070799003|23010399003|11063799006|56012099006|261021123027099003|261021121427099003|10067099003|261102123227099003|261009223027099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	rwTeJ8DF3QZt1jDabs9g/c6oNnVoNxaCWymb9TYROtrjHlYALiuamwFMRpH/YnsQVxWH1kXSDk3U8tP6WjN+qDtDqsXsil9+nkHDgg14siv9UeiBnF4mdZzqragUXeoUVaml2nhgg/SIpT0YBv0zCJcO+hohvbF/tpJd9NnZtdpTQ/FSZUwMFhgGv1Yaj//gPJZvPwppT4uJ7M/wEi33echCRmFbfl8wEryxE1GLFVNqN6EYXDdYgaxDCZHadoLFsGoioIDMNWeiSP01gCOW/cw8zOPiBW38CuwMpzB9r7ELbRZrULMbfvgkEtxAR6ojFiQYCyjplsJam0PbDl2Pm+cPmlE/83S1W/tnCARw691pnsQV+5lhAaXmcHHHghv5zJR9pJqFV4sN+1p8dREvslBBaaxS7fODq1OELavA0OMEle4/PylgGkMsm7xDBvl1n5MPi6BrCQ4ckZPftw/EPd+ROMa5ZZIdth1MpBxNck6HgqBxa0Uby8fmLIUdnllh8CR8tqhPtDc+71BG8m8lgz2XUiJXWoUz2JniI8CKTpJaqDO2WSKCBIwzTs2f3ezIj8m3oKQDNcnWJeabdB51pAb1H5jR+Af2aCzf6xH84OuZKy1XQWC/rtOmiD8+URxxRLcuIA5Lgzs+bwG4Eb8jjIQ7jnllFxMGnQUzEuxoqDM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB6413.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(10070799003)(23010399003)(11063799006)(56012099006)(261021123027099003)(261021121427099003)(10067099003)(261102123227099003)(261009223027099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aFFjS3ptTDBSM1NyS05uaDdZdUFSTFBNaTFtV1h0SUxTWm5ra2ZMaWhkdDVF?=
 =?utf-8?B?VkpmTHZQSW05c2N5c0Y5Z2p6b0U2aHZPMC8zWDkrTjhWYmhnaUVxMDhDUDVB?=
 =?utf-8?B?Qm9lT1RJTHVzdHVwOEhSRjkvdkVCZG96b0l2bENjTzdYK1I5NTBsbGRtNHVm?=
 =?utf-8?B?OFJiL05FRCtTVXpFWWFQTTJ1VzJpUnBVQUdUd1V1R25OVXhERWZ1dy9hWFlL?=
 =?utf-8?B?N1JuRkp5ZnJUZW5Bd05xZUJxZmZ5YU96a3BIblhPbk9vakpQd3Q5bWl2Vk90?=
 =?utf-8?B?US9acU5KNTdoNHRLOVg3NjVkUWtiUnFnR1dmWVF4OUNibU53WklDVzk2L0pZ?=
 =?utf-8?B?UG1lejBwUkt0RlFka2VlYzlrTDZ3UEJPRHljQ1laZVpBUEFlTUVqZWw1dmYy?=
 =?utf-8?B?aitHblBQekxpQUNGTGROK2djVXBnSFlNUXVzbmdLY1Fhc1ZmbU1vSHU1amZ3?=
 =?utf-8?B?a2RCQ29qWDFIU08xZkg4b2E2ZGpmSG54bkdDUlQ3eVdvOUY5bGo0eUlhMGNS?=
 =?utf-8?B?RFpIQ0tlOUZhSm1Va2tKRkFMNVRqaEhZZC9xMTkzR0M2SUo2MUdqcFdrMUJ5?=
 =?utf-8?B?bUt3MTJPUytxaE91bVpxZVB3M202b0tPbjVjSDA4Zm5mbzdDZDBrM3JEODly?=
 =?utf-8?B?MTVIZGthcjR3dWFxSWs2SzZ6SGtDNEJOTHRyS1pRQTVWZ2ZPUFZ6dnUxRGtV?=
 =?utf-8?B?WFVHdDhrNUVyRzc5Q0VwRVFnM1FIUEozOW9xWnVoZ3pxN3RsWU5SWTg4N0kx?=
 =?utf-8?B?TTY5U0ZaRnVacllBUnkxcGZoUDZYYTFnZjl5MUZ6ZXlGK0M4M2hKV2E4QTZz?=
 =?utf-8?B?VjRjRGQwVVducGFMTUdHbGlrRWEybnh0UlpJOUplWHY1aERsSHZxRHZvQWpM?=
 =?utf-8?B?bEhJWE9xdGkrUjkydjZtT2ppMnJrMzBnUkg4QlpnQ0E1NlQrZVNSRlljdVVj?=
 =?utf-8?B?ekJCemxBWUFtNVlXUXV2N0RlVXNVZnRGeThKbk80YUpsMGdYK3pKY3dIMk1u?=
 =?utf-8?B?azdrTG1TUVU3b2k0QWZycGx6QzMwVnFwQ2FFZ2hBeER3TXlHYkJnVnZxZG1v?=
 =?utf-8?B?Vi9vUThKMjM2bUNISzFPMk11VjNiZWtiMEg5bUJyaHV3UElGUjlaL1FnMnIx?=
 =?utf-8?B?SUszY1ZEcGNmV2g1UkliK3hzeXhkUnpVWmE4SnhXRmovcXk1WDA3RFM4eGx4?=
 =?utf-8?B?ZDFxNWJhS0c1Z2RyS1lCL2x0NTU2VCt4VVJzZTJyUGdVQUU3QkZNVUNzeS9y?=
 =?utf-8?B?ODNhdWw5ZmZnZEo4Q2t6dHVicGd0L3dhTGl5Y1dmVUs2S1BISEVXYWF1MFUr?=
 =?utf-8?B?bVFkT0V2Ujk2SFV5YUZkankxc24vWGVOUFRqZ253MnUySUdUVHZTWWttc2Nz?=
 =?utf-8?B?eHVjVWJFNGoza3NjTGc1SHN0N0lwZjNkRFcwMFdFdE1HbUtNNjNiOHNIbDM1?=
 =?utf-8?B?czFzSTd3bDdtaDBJQTNycUdudHJZY2VUbnhTd3lKUkgwdTRZUlpFTUZuM0Jw?=
 =?utf-8?B?amVJY1oxNDRFek5KNGFvRysra2M1bkthcHhEZjhrTU4rU1lNMXlWZm1PdVVG?=
 =?utf-8?B?T1pCd1BtZXRwQ2hQNzFqVFg1Zzk0SGEvN0FndVJCaFVOOEpuYkhyZ0h6UEVz?=
 =?utf-8?B?dXZZbE9mNkJncURKZVJEOXBRaGZ5c1VoSk9GYk4zNW9ReThjMzd6eTNzTjhO?=
 =?utf-8?B?SDA2UDBZTDdWQVFVUXNlM2w0L1VscDhvZWZ2aVBQeUN2VXBZWWx6STZ0K1R3?=
 =?utf-8?B?dEFHTmJ0cE5TQy9mVklyT0p5Qk5nY3dxSk56dkpkcy85UklMLzBCK3pzTnNm?=
 =?utf-8?B?NDhsaVZYdldZUzlNdFdxMVl2bkVuYll2amZCYjFRYmlmUXlPVGtjKy9ENmxM?=
 =?utf-8?B?SGN1dXlHWHZzK2Q3RlVzZHFxMDcycUF0alJxRUpWbFVTdXgxaGhibUpIanhh?=
 =?utf-8?B?MlRBZjFmTkRXbndZeHhhTWMxWlRBaFhKOVRKTFZPa3BNTFdEN28yRGR2Vzl5?=
 =?utf-8?B?RTNKRm82QWZwRG9PYU9NU2pnaTNBYmZDL1NwMGErSXBxSTlTSVZPQlY5SGUy?=
 =?utf-8?B?a3JPL21lTHVCK0RMaXBCekw4TVBGMXZPOFhvMzNGdkx4UU95QUlRNUJ2eEtU?=
 =?utf-8?B?Vzcza2hHN2sxaVZYUjVrMFlUenhpZTdtSXE5OVNUUVNYNlVmUFg1OG9aQzlO?=
 =?utf-8?B?YkJRaVZwQjhNMm1oTG95MHhPVk5aT0RQQ0RDc1pvSDN2L2MwUFJmLzlieXJV?=
 =?utf-8?B?RnVwN3B6K2dRZ3Fsa0FPNnlmZm9mU21DeUhqWW5wckN1OExRSTh3b25XUm1u?=
 =?utf-8?B?cHgyS1k3L0k1N1Zqc3J3WW1aTVJCT1JTTmtiMmUrTnNUeFFRMHlDQkdzZXk0?=
 =?utf-8?Q?CePZICoihoCyCFlXKIvm3EeU8qbbf23+JDvvCsOPSQlnW?=
X-MS-Exchange-AntiSpam-MessageData-1: GHQk9HYDxRZ5hQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb75a534-9c58-40c3-7c49-08df3f947153
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6413.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 01:38:10.3165
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hAlWK1NhgHAqskzBPe2UQM+1GOrRvUIN6q7jNNuU2eQun9MKv/XfrxOSsRRSragU9wwu/aILPv6C5n2kdZRj8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: EAYPR12MB796180

Fix two cmdq issues.

This is based on drm-rust-next.

Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
---
Eliot Courtney (2):
      gpu: nova-core: gsp: cmdq: wrap the sequence number on overflow
      gpu: nova-core: gsp: cmdq: increase MSGQ_NUM_PAGES to 64

 drivers/gpu/nova-core/gsp/cmdq.rs | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)
---
base-commit: 7ecd9ee29f7bfbe9a293952fbc83c3f8bd7205dd
change-id: 20261109-msgq-64-pages-bab32c03d627

Best regards,
--  
Eliot Courtney <ecourtney@nvidia.com>

