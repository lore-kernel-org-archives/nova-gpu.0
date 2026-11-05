Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.46.17
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793883752;
	b=2rIWac07vNxqUJDZef52k2XbSzm3GYnwy/x9BmR7zIcRmyACUjJ+CilAZ7anic9mYdAS
	 fvZo+6bC2PMSc7PmU48P/yySIpqNwRLZDKgclNjb30rOUUtpSgHkpKnIoWf2jUoYhfCc0
	 jHP16mi3TMEAV+blRIJXFzTf7Zfk4/Bb3ZGOgUvH041NSneK7QAlPcQ3CDDMbCOY8u0H6
	 3B5we/QsmDJlh3Ef+c1dsNUIXI/mxWZYhZwnU7Wz9d1lU4C2/qUO/bus0bQ1zb7CcYlh8
	 NKzyuWp7zHcL7e++qnSKO2yxbNs568XmtypKVn5YQE93kUu2COKEOhJFH+/fygs+MEQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793883752;
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
	bh=TH0uSBQWdseFCnyVaBzZTq+OYGSEYlF7k8dVcukjt2U=;
	b=ajvBmBkOOa57g3Wlo9ybLBJ1EV7ZRl+FdlNMtcmXN4LYuBvaKR2NF+yhi1XVE/chO0Or
	 WqTPns5cRiIE1CU0ZBuk46lKz3SpMB3h/et5MgmAqJHYmEMvhG7thILqLiIYceDSeOP10
	 Tl36Hi7rjVR8phxggd1MfPojpyu1TvrhYWLaXcjtRrcW9VgyvIR/Cyg+vV9g10JRARE/j
	 RUOUa+T6bbIeOv1XJ23sPxjrmS3x4Jyte1e5mE3KIidO9rXAuBEjIul87MXAluHifkEq7
	 S0spssmDGm9kxVbxOP0p3WB0eZSF+a55ysPBCU2b4ORtIt5i3XtXR8vheuTKTNeWjSg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=IDJvXcSj;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.46.17
Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010017.outbound.protection.outlook.com [52.101.46.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3DA7606A333
	for <nova-gpu@lists.linux.dev>; Thu,  5 Nov 2026 13:02:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B3DA7606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=IDJvXcSj
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R1xic2mdM/Jp8S69C50V6JWhJ+REl8xnxfCz1oYL+4Pxu8Rid4UFBMtFd7rF0Ccf5b21JrYNg8Xl0yG6qjWZCPyLJIbK0YUUJ5vTJRhJX99wgTDAKhVIISQgcSS6sOJMfy7JtjGLM5ZoMFZA6IdAA5AcnP7Lq3qnPSU9AW50PSabE2lknvjB1O5mGCPd8d+ebdRo8UwgJHMdoMk3Zgd2j/X8QN/KEG1KMxn7c1VgSjyvRZXSIuSY5NqQZ+ldkMaO80Nd1DlyoDgIphDhJNcSB+69FKE4BPIlQkCAvwrRZmVnr+AhT+cC1erOa58NXzpwpaScGbnVtJYc4GlLsg/UJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TH0uSBQWdseFCnyVaBzZTq+OYGSEYlF7k8dVcukjt2U=;
 b=NHJ0BX1+A8UyHaL6Yo2FeMrXG2gQrTWrvLnZBLeV1n95lbQG1W6NjD5+BqNTuaThJsGMBfX66KJ5P8kn2esnQXb7vrJniEWXU3oJyySg1f0mS9azQr+3U2WLI8IDVgzfPv8fNA7YtbeL6XYNFJnbzKCipjrnm89FeK9P5OuKQ9RytzQce7RtTQtHEtg3SAPJ26mvr29w/1ZUAKHJs1pQwaU+XQU3QgoHKINeLFtZQ3RaaaAKeOExUvDKXaQBhV4aLBge58lw0h8vpM77sVSF1gpvaXPKJi02V+QwJJ2TAvRoAJGxgdrjsBNul9QWeP3gYG/otrgavX1wroRqrI1tqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TH0uSBQWdseFCnyVaBzZTq+OYGSEYlF7k8dVcukjt2U=;
 b=IDJvXcSjuP3DsbAFZWo1TrJsP/F4gQp94E4ScBNCRSAHTwlWflWPbiCWosFaXzthquJb2QPVlIHlrVja5V2q2j/C05U9HMzU/nG84VGRU+AaGL7sNT++TZ4/ceuoFa73QSjCTZ6E7rS4Zg7mvAPeDXmJrahJU2SlTaac11FVePQfSlWc4brCkFkCaDxsbtxytC0DWzKWq0bMt/9Cja9JD0wRn9hHYG5XWtywbj0iBeSkSN109VkPC+I/eSwyt+aC/ncEDo3J/yJQ/unT+ZfTI740QyV/gNGdENoYukwRTnJpbB+kFbIxBxHQOsT6vxoHrUNAA15fBrHAcHtd5DSHtw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6413.namprd12.prod.outlook.com (2603:10b6:8:ce::10) by
 CH3PR12MB8935.namprd12.prod.outlook.com (2603:10b6:610:169::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Thu, 5 Nov
 2026 13:02:26 +0000
Received: from DS0PR12MB6413.namprd12.prod.outlook.com
 ([fe80::e82a:6673:4142:37fa]) by DS0PR12MB6413.namprd12.prod.outlook.com
 ([fe80::e82a:6673:4142:37fa%5]) with mapi id 15.21.0592.009; Thu, 5 Nov 2026
 13:02:26 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 05 Nov 2026 22:02:22 +0900
Message-Id: <DMNAPQDYRCER.M9C71ZUDF2FD@nvidia.com>
Subject: Re: [PATCH 7/7] gpu: nova-core: falcon: check the per-block DMA
 offsets for overflow
From: "Eliot Courtney" <ecourtney@nvidia.com>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>
Cc: "John Hubbard" <jhubbard@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Eliot Courtney"
 <ecourtney@nvidia.com>, "Zhi Wang" <zhiw@nvidia.com>,
 <nova-gpu@lists.linux.dev>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261103-r000-fw-v1-0-e3d38fc130e3@nvidia.com>
 <20261103-r000-fw-v1-7-e3d38fc130e3@nvidia.com>
In-Reply-To: <20261103-r000-fw-v1-7-e3d38fc130e3@nvidia.com>
X-ClientProxiedBy: TYWP286CA0023.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:262::10) To DS0PR12MB6413.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: DS0PR12MB6413:EE_|CH3PR12MB8935:EE_
X-MS-Office365-Filtering-Correlation-Id: 5dd797b3-6192-46f9-c697-08df3b3d0a2f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|10070799003|1800799024|366016|10067099003|18002099003|22082099003|56012099006|4143699003|11063799006|261026140227099003|261028144727099003|261022105027099003|261021135927099003|261026121527099003;
X-Microsoft-Antispam-Message-Info:
	DvfcIYdRKgvJiIdizCd3fqRUGy+T9rOPhUOuDmIeBUlDKCu7i61pkTjWNLDH4aUBhalZoMEAE/jXNDErJPmMqxcICV7or0ikgT0sE3rTpgXMWbFBGGB6n830/lHO7lI5GZgF2xPHn2jFu7xik2f/2mMvAQfmIdioG4t09/BIwFyOKEG3LgJPQsRRw+oDvCKgR49YadRAYXs/S06gcX+wWKTjsHzbsISqyrUhBFSq88qCk84GeE4aIyAe4zq656+Mn7QcmXgbyCGbWfT1TQRUkgFvPKW91Xjb/FVoqqCVqgmHURWzymenv/4CXmukfbztXJhonQHCECtu672ZLRXCE2wPsKKO5yrR2WmcwndPDAaXiMKAibowtApn7lEp/f7iV505d9wWkkwtKnKKe6A5+Z2/fVPKshgrI6f0UfSoFpdmc/AeyF6DE0dC2LsyWl5GbWcQ54rNAOeB1TEo8Q/dLflOciMYkFRAPf4AxYhkePs7arAI8N6UKYjK8bssWngfWxNqfEsLsZx3bnrcCljdNSU/VdHYUrEA4EQP2mPi5w69981ualNPJHhCDDp7K/nLTvSxDNqbkCe1n6CRYfyV8TxVqrE8a+fbCWc9iMvIK6pifupttmJ1QIRXgmysJynvfFPcTRtx2AD+z3eR74DVSDjyzyCahKivYPD8+2sK8Ag=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB6413.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(10070799003)(1800799024)(366016)(10067099003)(18002099003)(22082099003)(56012099006)(4143699003)(11063799006)(261026140227099003)(261028144727099003)(261022105027099003)(261021135927099003)(261026121527099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cEhXcWcrMjJyTGJIeXF3dWdrbG16WEFzeG5taFluOSswbkIwVWp4TDZhMCtk?=
 =?utf-8?B?VTVTajhGNFdZV1Babkx5YkZKOWk2T1FXME1qUEZubFNIbHZZOC9MTTdwdllO?=
 =?utf-8?B?RitkTStMbi9OSEhFN0RyM2hKSVJCSWRHR2kwTitqdTVMeFpkNG0rcllPR1dv?=
 =?utf-8?B?aWxFdUZ2eUwvZjl6WFVDU0U0QlhlcHFOZDhjY0xTSkpmZGcvZ3Y0T1BuUjdF?=
 =?utf-8?B?WkM2QXlJSWRtR2g1SE5wbFNCU2VCWlBSVEdFbnh1bVRhQjY4WEhpaFI3dWRX?=
 =?utf-8?B?OUtaNkROMkVocDRkWHg0aE5aQzdmNnhCcFpvSXJ5clp3Znk0OGZ3YW5ZaHdU?=
 =?utf-8?B?T1RPQmZ3dUZEQlZiaE45aGhRNEtobytmUTdMQkNyV2xTNEc2MXZuY1NSWHpM?=
 =?utf-8?B?RE11RDJ2WFhjZDJyRHFWd0JuZ1RVRTZtd1FvNko2MWZCd1lWOE54cElMbDZ0?=
 =?utf-8?B?dGxPZVIxVUJEYzRiTzY3UEJlU0VEWURBUHByQVUyNlcvb3dWUXE4RmtTL2M4?=
 =?utf-8?B?Nkh0WVhBZitON0FqQlhDYTdPWmR4bTVMdTZSMWtLTVhyMXlyKzRGTG14aitq?=
 =?utf-8?B?TVBIMVd0Y1BZTWJMcThiUVVWMUlZUjlRWXg3NzY3YXlnZVFOMHY3dFNVbWNw?=
 =?utf-8?B?RHRReXh6anA1M2EvNkJTTDNlNzA1TkhzRWtKRUFNcmV4Qm1mSjNSZWZVd2Nu?=
 =?utf-8?B?NzB5eFZEMEhMQ0ZRMjlVSmJtRFFVY2JveWpDaVY1YjJZWVI3cmd6Y01lS0F3?=
 =?utf-8?B?d0Yzc2dtSVI2ZmJWNmtZK3NBWDM5UURERitab05xcnZPN0xhUUQ5dUNscTRO?=
 =?utf-8?B?OVcybnY4NmdOU3EwWFFKTjVja2JBdjhIZ05pZUhNYjJXNWgybjJod253RGE5?=
 =?utf-8?B?TnQrYzJtQ0tVVDkvMisvTC9TTElRbVNyelRLNlI5VWUzMStUZVpsbVBqbTYx?=
 =?utf-8?B?RTN1bUNuanpmd2JtRUJuWHBMN1N4VmdhbFlhSFpwbjNIenhyK2ZMTWRhcWN5?=
 =?utf-8?B?U1RQZHUyM0F2RUVqcXdlQXByMVBYWURnRmhVcmhaUTEzcDgyc2FQU0NzV3lJ?=
 =?utf-8?B?eHR1bXN3VUdUZmlCejJRTnJoRHNvam5TamVsL0d4TzI3V3lvS0pVNnIyN3Fv?=
 =?utf-8?B?LzVYbitpMGdXeDdtVjliRWpJTHRwR3VhSnEvbEhVeHhLQTgyUVFKcWZOWTlG?=
 =?utf-8?B?TmQrTC9WUWh0aWROQmdtVmFqa0hHUUk3V285Y2YyeFcyT2FpbmJJMWpPUWNU?=
 =?utf-8?B?R3p2dktlYXpTSWZKMmkyOVdHZHdnVlBjZGM4bW9Ia0d0cFU2N1Zlcldobjl3?=
 =?utf-8?B?SHM2NEY1NDJyUGo3d0poZ2V2MFAwMXhCNTltSml2KzRCRGc1MXM1ZEVqbk4y?=
 =?utf-8?B?c01UbnlmOWh2aEd3ZWhaL0tBTWJrVWRJcDdZVWVYenNtK3JPMTQ0UG9HeTFP?=
 =?utf-8?B?N3lxL2NlTGRyb040V3JuQkxhVFNnZW1XZHJFbnJubW5KZFRtdzBocTVHSjI4?=
 =?utf-8?B?T09EeGtxbHljaWR2Wk90NTlqMXJ1T2VpdFdqYjNoZzN0NlVRUTMrZ0pRZ2lu?=
 =?utf-8?B?by9LY1preTNVQkxEN3BXdHZ3bTlNQXZHMmRQQlFlanNldU9oVTRpVlJDNVJx?=
 =?utf-8?B?YSs0VktOZWVmWU40M0pYd1U0alVLdHQweXR2ZFdCazZiVDJ1RW1BZjVFcGJP?=
 =?utf-8?B?MncrbDBoRG50WlFrczZzRGN1Y213VmxQUXZlSXMvUGtvUDR4enQ3UVA2d2x4?=
 =?utf-8?B?dGt5WTlyYnVicElIQ2VrekhSUXB2YzZrZjNQdFpScUNaaG01M1U4ZWtMTHA1?=
 =?utf-8?B?a2t3Z0NJK0FickQxUHJmcy92a2ZMVzlFUjZqbWhzUlZud0xzR1I4OVJlZS8y?=
 =?utf-8?B?YmgyaUxpUHVVai9OUzdDQi9mUG1MdFcwWm9HTzBTbStGZUxaTDBPWmlYM0xI?=
 =?utf-8?B?ZVoydzBJU2Jxekl4bzdTNUVQaTVETklSL1hZSGQ1V0FaeitLTUIzZC9jUDNL?=
 =?utf-8?B?NGNBalQ5WU5ncmV4YTZZZXZZT3hRMmxETWRyd0pkQ3RjZTlnaVdWSkwvSk80?=
 =?utf-8?B?MUxvZkdUTmRxa253TndhUGhMbmFoSFB2eHVHOWR4dUJadGRVYkliSUhxT012?=
 =?utf-8?B?bW1YQUNJL09rMFZoWThpbW5Wa2JHL2xxM3lwU3VrRGRlWHdlUlRGMFFYS0w0?=
 =?utf-8?B?bkdTYjNSc0hkR1RuSVUxd0xBTXBleVRBMWZ5UFByQzVRdmZjL01kaFk4KzR3?=
 =?utf-8?B?VUVwdVNXTllQeStVTVZDV01aSGNLZFF6R1FMczdhY09yOXdrRDJoTklBNUc3?=
 =?utf-8?B?OWF5M0U5bFl6d1FIVU4zbm1uWkt1aHFHdENvY0FJUlMvVEprRm9kRUhsZnlD?=
 =?utf-8?Q?J5TKrXnB047B4sgomKkDh43DEzMWAqtuSWu8tgLj8L+Qq?=
X-MS-Exchange-AntiSpam-MessageData-1: TjPX8XY5NGcpSw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5dd797b3-6192-46f9-c697-08df3b3d0a2f
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6413.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 13:02:26.1063
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OYV25fQV6xIkJ+mjqTL2iyDDXGa9IPnqK4xuIDr/oU3DVpcbYnexHqVQcuZ+He5X8q06ij03bozA9Tge3KeAMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8935

On Tue Nov 3, 2026 at 7:22 PM JST, Alexandre Courbot wrote:
> From: John Hubbard <jhubbard@nvidia.com>
>
> Each block of a falcon DMA transfer is addressed by the start offset of
> the transfer plus the block's position. The two additions were plain, so
> a source or destination offset near the top of the 32-bit range would
> have wrapped or panicked rather than failing the transfer.
>
> Add the two with checked arithmetic and fail the transfer with EOVERFLOW
> when a sum does not fit.
>
> Assisted-by: LLM
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
> [acourbot: split out of the DMA helper patch of v3.]
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> ---

Reviewed-by: Eliot Courtney <ecourtney@nvidia.com>

