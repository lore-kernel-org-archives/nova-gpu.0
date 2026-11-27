Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.43.17
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795748769;
	b=dGCf51umj0SI8BFzr4suIzmUUIrGqVAd1mHaoIpGq4pWNJydHjq8ZGDje30A8fUroW7k
	 /nWLGEd99y/gv2ExIJ3cMbjNGC1/2BTP8oaR/3wKPnKRonM6cKEBO4Hee+ZK8PKEUXbV7
	 EOrcvVDfjNIOQHE0ENxZl59WnXLzFw+KbUvnsSeA38sekUyojkaoNfyqucL/LYMDd9RAx
	 W/64PtygwONp1p1hJaDEX9Bm0fQgtCE6fy2Pzqpn80+rcopEd056qKfRxUEs6VxbWnf2S
	 2jgdSo8SIDsE1eDH1JLJGNAVJsGj/nDhhoMFyZGwA07sc7EsToHVq1rx0DbkB6tvK6Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795748769;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:To:Cc:Subject:
	 From:References:In-Reply-To:X-ClientProxiedBy:MIME-Version:
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
	bh=FlH8Mo3anXP+st8jLTuu56uarXP4V1AoS8rrNibMLvs=;
	b=AIs5i8nkuiI6NmrN0pxOUpXbUNhbwG1rOZMuUwm3lV7OZIWnUNp2MWNwL1rDifS4/Opw
	 HKzMKMKNTRdDfDxWK4QP+mttC4yzFEAO5GqJyyzKcP5mBOCJtXLXIM2UfsRAqIkDOMPvA
	 69/Fm4ENiu60Jmj7cyOvTeuah4tNylaM23RuSDJi45wu7+eIYjwSfeDviUiVGKU6+5NoU
	 3P0ztg94m9AoPJJodUCZK0mK05POsRfgmp2my6B9yLbwQJwDqTh6ppawNN/lMEYq1WpZz
	 uDWPV8Gs0PuTtlvQOEOLASBLAkYrMS06N3XO2n6v09t9eZPxM3/eGfwsYCRebRz6fgw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=rCjY+UW0;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.43.17
Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012017.outbound.protection.outlook.com [52.101.43.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11A60606A31C
	for <nova-gpu@lists.linux.dev>; Fri, 27 Nov 2026 03:06:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 11A60606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=rCjY+UW0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dPzoccQk07mMW/ON7Um0BfGA3ooc7bkPju7TMfA9CGs+tXrDP1DtoDWMUgWMByw65BUgG/X/qKVDJL1NewcLDLhmFaw7tuNgnuCipryRy4uTDz+sT1y4ylvmNiFk9TwcE9Qy1VhGjmtfBzlg7xhqpc1OZ+HI9K+3iXYzYHFnGzh/7KljLqdtbcC5AGrNReKT5xEjVxZR0TrU+Bb9ZPzwHCT0w9GYPMSxdjPLu0Lo2DrrWieAVAxCfP8RZwWx1O2g/Lud00OmPVy4XMzbAKAysLBkLCCAg+dklVhl440RhnLpkIckfHhtQ0XvHJFTnOCDPKXGLi+h5Hb8tOZ8vm9Dug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FlH8Mo3anXP+st8jLTuu56uarXP4V1AoS8rrNibMLvs=;
 b=eQ22mzoLm/N1PWJtBizMfQkB2i3u+Lr9dJmFJSblYVPNGs15r4WlnjlPHmSzYWr2uajnhHVp604tPv/dTL1FvuOC9hIgKmHaCYd8f6vBnnKclxMJXm3w+pS2SuocxdtNIR4Y+N6WBn3HJQUVuPlRG1LHXLTpTO/vJ12rovZ6wPbcnh3e1BNs9iClwDVFgHCXYphh1wtJwMg53qebcTzbe5g1JT9ibG3CvHa/3jaWQAzndHaMAwfXEodgujMGiGNhqxmUDmsjJeKskf8cKyo6QvUlpeCRARSXyo1/pDcpHoOmvRQnS9JJaGJWwd8ApL4l0ZQlVJKQgHvtzQmHmFpJhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FlH8Mo3anXP+st8jLTuu56uarXP4V1AoS8rrNibMLvs=;
 b=rCjY+UW0EhHSvHX4OPkfeK7W9gNcQ5WxtZyOx0xfyB9ej5t7XncdN8pvf+zy6kqv+GQqFK0f9Zwpq0JY3hRrs+rc5vwHP76jsg9Ze6cPxBRB/E9SnFmwtXF4WrR9cum6zZhQ5tf0evdJoyyQ3/5nRK4pTc0JdHKIgiM8iER0uoGxx++BxGBI0lTMlNYveYJ7XAD3uHHKvQRrA/DO02fAP+xUhuZqYCKBtetY66VKQ5b8qszmDt2cotr+dzXbMka8c013ZhUhfEybt7y70qz7Fk8oRWE9ozkSSDeG9ATItUl8ngW8sErMi/SXRvUMzOYrMpk1ylkHs8GgMRSWgSCw0Q==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MW4PR12MB6873.namprd12.prod.outlook.com (2603:10b6:303:20c::17)
 by SJ2PR12MB9211.namprd12.prod.outlook.com (2603:10b6:a03:55e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.14; Fri, 27 Nov
 2026 03:06:05 +0000
Received: from MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1]) by MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1%5]) with mapi id 15.21.0662.001; Fri, 27 Nov 2026
 03:06:04 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 27 Nov 2026 12:06:01 +0900
Message-Id: <DN5NT47Q721F.30K66T52IM072@nvidia.com>
To: "Deepak Pandey" <deepak.os.system@gmail.com>
Cc: "Danilo Krummrich" <dakr@kernel.org>, <nova-gpu@lists.linux.dev>,
 <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH] gpu: nova-core: falcon: make pfalcon field private
From: "Alexandre Courbot" <acourbot@nvidia.com>
References: <20261118105557.140069-1-deepak.os.system@gmail.com>
In-Reply-To: <20261118105557.140069-1-deepak.os.system@gmail.com>
X-ClientProxiedBy: TYCP301CA0075.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:7d::13) To MW4PR12MB6873.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MW4PR12MB6873:EE_|SJ2PR12MB9211:EE_
X-MS-Office365-Filtering-Correlation-Id: a0d7cf4d-8392-4611-e6c0-08df4c335f9b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|23010399003|10070799003|6133799003|18002099003|22082099003|3023799007|261009223027099003|261021121427099003|261022105027099003|261022075727099003|261026140227099003|261026121527099003|261028144727099003|56012099006|10067099003|261102123227099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	bsSIjWXEbi7RxI+CectGYoGeEOaD+IdCXv93Era4ARvkR9XWBSq63wOZ6PZDzn4umo9rNHpoBVovR6syGkPpBiAyCdLPBmgSmSW7+pDFYNxY276eve1AsiaOX97xQYK/X3MXs1mYuJDYOdG9Kvooqlrz/jaNEUTGa0G3ttpXiQ0rkpMKDJjeIj76wD9c4y1QN350NIovXJuGEto/+COBK5KzeL2QNPrXvZC51yMeuJM665IbAczYd28YebYxsNaFot5oxzSE8oTVt0sSxZ/K/obbwq8GDdtltEnfXwTVF3z9zjlMUXPB8wbyZBcpPo8l9MYsD0TOeuaCaqgsgVlfq370Fk+9b5PIzcwTMg/5/amfxSV/Yv1WqrMkAbYSaLhAQj1BIibgszx1LnYAuHsH/ZWja5PGnmiHE3VPn+LxgaHrMoohU6yNpr+l4GWGODNFRlygHF3szzTgxrF47hBux2To0k5bl9ru/1wy6wHMRJbxwO/2OEcwJ29mW8hU0hcdlTvTgdBDzXCTXoUjaIq/SyKp7mrC6+BgQskNSiwELRlo6k67jCrbhuluHz4QdzRS3vqs5pMqpeOIOdIzIdTMC2zuubWuIlhFDk3u+Wdmy2ZPVQTnmIVgDLZhdA6BvDjCI299aNmQf5Le23vaFYd2mV4+ExKpR8H1GEaeEohlx9w=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR12MB6873.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(10070799003)(6133799003)(18002099003)(22082099003)(3023799007)(261009223027099003)(261021121427099003)(261022105027099003)(261022075727099003)(261026140227099003)(261026121527099003)(261028144727099003)(56012099006)(10067099003)(261102123227099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TmovaHp6eDJPTHpFRENoVXl1T1Q0eHlzbjFJeXFsM3g2V1hCKzVtbzJNT0JY?=
 =?utf-8?B?QkVjdTh6cWViVnJpRTVQWVlGNjhWMGhIMXM5VDV6SW1QcU5qV0kwbzhUbWZH?=
 =?utf-8?B?VXNEZm1iS1dEVFZ2emVvNGVPZVpzYjhNQVQ1eDZHU3ZoaDdTKy8vSG8rSTdP?=
 =?utf-8?B?UUVJTSs0THNXSE9hb2lBQmsyOVdTcjJQQjNDMWh4eVpIQ09SUy82OXkvbGJF?=
 =?utf-8?B?RjF6M29URkJlSUtnNFVsSFpSYXBybzZLRzIzY3F5RVpwcUxjbHFNM2ZQWW9O?=
 =?utf-8?B?NFNVRDZxNk9qRERTa1UvUk9BS1BGOWFmYmcvcHVKUHczdXZNS1Q1aUpoWTNF?=
 =?utf-8?B?WlV4UjFGTStiRi82VzJiUUFYb2UrN0s2RDZoaW9UV21PeUZ5Yy84NllYeHRU?=
 =?utf-8?B?UmloTWMxMGpoTm5tcG14cDE0QTVhQkptKzcrNWRRbFYxNkcyTkVFRDZlc2xU?=
 =?utf-8?B?bE05R0N1WVRvNGJSM0I4bi9UV3l0UkZ0MkpZaFJMdDBtRlJudkFKZkpMRSti?=
 =?utf-8?B?M2VPZFNxYnJ6cGpRWTRBcHZlUzVYaHJoQ21jTHFIcDkyaXdJRG16TXZtQTFP?=
 =?utf-8?B?RTh1eFpXTjdINHNKcUIxTUd1MVZxYlZ3VzdEZWJweVJMWnV3RTBMYmdMMTRq?=
 =?utf-8?B?YlVBQktmdlBOeitDb1pJeDh5Qm1KNTBsMDBHelBpV0o4MEpMVmZET1FzcFZW?=
 =?utf-8?B?ZjRqZVBGOGxLZDdoRkJxZHNTUFZRQWFQWVB1OEtwalRwS1FWZWpaNExIR2dR?=
 =?utf-8?B?Qm1sYVpOOVhpakVLaGFIdzdMTnVLa1l1SnNJVmh4OFlpcUdzVGtYTUhXVU1o?=
 =?utf-8?B?NTNqWmpITHFYOUQzci9ZUndIdXk2aENtdG1lV3NiOWxTN28vRnBoL2ZIZ1NK?=
 =?utf-8?B?K0JvMEdOdlFPVmJhMnNFZ0tMK0wxSC8wdXU2N25LNXFFWDR3RlFqZzUrK3RD?=
 =?utf-8?B?UVphRU1lM2M1K0tEMkhzd0gyVk9sMjduSU43eWhJU3pzMk9LcnhqL2NWazBu?=
 =?utf-8?B?RVo0dWNjdHhRNDh5YWlVVVF3OFJmUjl4dXNDZ0wvUW9lRmIvNm0vc25FdjZz?=
 =?utf-8?B?OUFUTFp1MkcrZ0h3bTVidmU2ZllQdTMyN3l1dGMyekMzdTVqRnIzMUZXUUEy?=
 =?utf-8?B?Z2tKdkpCMnFJR29iTTFHemtubHdoV3JYaEc2RkFLaXJrdVdsQTNHRkg1bUJy?=
 =?utf-8?B?c3pkQUJTR1RxejE4S0hNd3poR0oxaTgvbWVDc0FxVjdaM0dIZ3FkMVdaYkha?=
 =?utf-8?B?MlJxV080KzlxeDhJc0c5T1NnZDMxcWM4QU9Xakt5eUt1b25GVE9pNThlM3Yr?=
 =?utf-8?B?OEV5QVE5U3kzNnVSN3BnUUs4eTk3MXhmMHVYanVDeDVCc0E3a1hOZ0lUYnlY?=
 =?utf-8?B?ZmhRZS9MNjdJMTRBZFZWS3ViZXhwRCtWeXA4V0hXRzcxVDhuNGdFOHpIbWF5?=
 =?utf-8?B?SGtmSFVlbVJRWVEvV24vd3NuMlVxNStlUDl0Sjd6M0pEOG01c0RQREVSR3NT?=
 =?utf-8?B?YWFKcmNScEJpQTZEMXNnbERNRklGU2pMYlRUOGxsWXAwLzVia3hYeTJpNGh1?=
 =?utf-8?B?SDNDcW90R3dMVW9GNFFzSklOenZhVWtwMDRVU0RtbXR0RkprTWo3THBTR05m?=
 =?utf-8?B?dFBpWjFXZ2h4UU1WMFc5SnhZVG9RQlJpblFvNjVnUDdtQ0pISEVkYmdBeDV4?=
 =?utf-8?B?RlV0M2FSWWd1Nmpyakl4a25tRWVBOXloMW4zR3laRXZ4Rll2dUd5TmU2WUp6?=
 =?utf-8?B?aTRvUlorMlFSb2EvSE1IcjdSbDcydW85aGpZdmRGcDRaK1Jrb3BaUURXSVBZ?=
 =?utf-8?B?Z3pGYmR1ZTF5VExlVDhYZGVWcnNZSG5SUG1TTjZBWUNEUHJUcGZSL0xsUTdt?=
 =?utf-8?B?ZUF2Ym1xcGRqSGhvRmRMMUVjV1d3Vk1FZUtKOU5TZmszZ3pnNlE5WGZ2dVY0?=
 =?utf-8?B?R3pyQ2RWckd3TzZhNFRBRzBZR1hjZm5wNzd4VWNTL0p0UGlsdEd5Wi92Q2po?=
 =?utf-8?B?dGs1NEowNlVicmc3cEF0SU0zeVY3WTkydVBoR3BCMi85cWdFQmcrR0gzNG01?=
 =?utf-8?B?TU1STHRPYm93Z2lBbXc0TmVHcnd4ek1hRXpDcEZVbzQvWlVnYmwrTzNYakUz?=
 =?utf-8?B?N0ZadmUyRFZtRnNDU2ZHWk5yRkdPWDNuSWR4YTM1Y1l6bHhuL21FMy9VYmFX?=
 =?utf-8?B?akxhWXp2TzlXNkJxbWZBckZ6cERVeGlSTjluR3YvUVdROTA3M1h4NURZZHZL?=
 =?utf-8?B?NDBJSGYvUGt5NFdhOW5aNW1IeUJRTENjNndveHlCVDhDNm4wWDJaRmZpM0RH?=
 =?utf-8?B?Y01TTFFCNHNZNHYxSUtkN1RHdUdqaVlKMjMwbTJDOVpCV1RnU2FBS2lnUS9I?=
 =?utf-8?Q?vGxmeqOyUttUFs8/XN6pcjirfR8uzo6LDd/HjHVA8zFVs?=
X-MS-Exchange-AntiSpam-MessageData-1: L6LmDwBldeg3Pg==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a0d7cf4d-8392-4611-e6c0-08df4c335f9b
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB6873.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2026 03:06:04.3984
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RAZsAQTVP0sCphkiSdHOcP06V4EsoKmB8i4D4bSl9/l84APIfc8qFtbOJLYpWHtwOeUgy8M9TACu3nDLp76VRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9211

On Wed Nov 18, 2026 at 7:55 PM JST, Deepak Pandey wrote:
> Currently, `Falcon::pfalcon` is marked as `pub(crate)` with a `TODO: make
> private` comment. The only use of `pfalcon` outside of the `falcon`
> module hierarchy is in `fwsec::bootloader`, which updates the FBIF
> transaction configuration register (`NV_PFALCON_FBIF_TRANSCFG`) during
> firmware DMA setup.
>
> Introduce a dedicated helper method `Falcon::set_fbif_transcfg()` to
> encapsulate configuring FBIF transaction parameters for a DMA context,
> use it in `Falcon::dma_load()` and `fwsec::bootloader`, and make `pfalcon=
`
> private. In addition, clean up unused register and I/O imports in
> `bootloader.rs`.
>
> Signed-off-by: Deepak Pandey <deepak.os.system@gmail.com>

Thanks for the patch! It did not apply by the time I could look at it
(as [1] had updated the bootloader code), and since [2] has recently
been sent I will rather merge that one.

[1] https://patch.msgid.link/20261110-r000-fw-v3-7-20d79ebb646f@nvidia.com
[2] https://lore.kernel.org/all/20261126-boot-rework2-v1-1-99a1dc6c7cc4@nvi=
dia.com/
