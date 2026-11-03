Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.48.8
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793664194;
	b=jCvLLX5ZBgDXdOJGbSkskESnDFD9QtvrqfUEFWkynfTNnf5MgBUZippRNt7dG+9u0dpr
	 Pb1TZ6nd1GY1EJpfC4y+d8xr1H8uH079HRb37ACUXeogsKsBrMKd2JjI3nGK5aXOi6DNN
	 k44GQmpLjNSYqXMSFJ2YsL3Nfk1aESkankmtfZ/3EvANKLREubENaiS07NSVCg1N2NV2e
	 f7LWw6/f4/GEfbar/+hrfZtgiPNdNUoJS8KbNbHHP3YKSGlPXHLW8TyfypzTdl+6y/JRw
	 EiT9X61zAA0WB/amZC/YZTc8rx0ifWrQhIeRfyc5SHGhDdWpLcM38Wj1NyGOMQO72qw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793664194;
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
	bh=BzqME7gm9Bs07DmaNG7+cfgcqsg33JcmGd9FHepRU2s=;
	b=3+R4yJioiRVvcLS09UPJ13wLxy0QgFSf3130Ox61zfa+a8OEo5Yx8BI1I/tDPWUi8Ou9
	 kpl3xnXErpWObQFzIsAC7+RMCKNA1xYWeEPgltCryZ5wlrDTo6Uo8XUXRnQjwI8Z/n5TB
	 UyIfreRk4AZf5zyGTxuCIF/9A72livPHvABg0BV9qR1ftXB3BPsL/Xcmxdu0Ud0ECV2Xv
	 iu6hFUxX3GDpsLWMGwserhLSW+WKB82cL0S7Xx9alTPfkx1HeIGAgibrKVOxuZKZyE15S
	 Wh6SKVfM7rXjzSxCdkwePuqQgPyKCbJL+/z6zEBQEpi0arICtEkvE3SBeU75ihamRag==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b="TW/Qlw6r";
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.48.8
Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012008.outbound.protection.outlook.com [52.101.48.8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37508606A335
	for <nova-gpu@lists.linux.dev>; Tue,  3 Nov 2026 00:03:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 37508606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=TW/Qlw6r
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HVlWDSekvofmP/XPmnies+dRnamRSEYHcvaYab6540ApWNbHYIiDiYqGX2w8AP2Mq4HRJEt84NLGGttXZbo5obatlTsaXZL3qJdXuJvRH4oKLQd9cpQECsR4jBJWjjHKLFjxzMLzdLedlh57tcCJiaK/y2nfmbOa/aH5WXKSQ/dt6VH7hYFBZnXEOFDiSdzThgo8pmRCpHtLLm/u1YD93kCVac+nDIV0YwvWb2Tj4TzIhjpX9ZHdQvOV3uKehee3CFEl/CPKPGsHk2DV8p9gBvx8leSzj7DxFylkBVBAx9N1xH3XLvvGVMzVCm1AiuwxaYRl8DAanIOJdI7n8XbXGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BzqME7gm9Bs07DmaNG7+cfgcqsg33JcmGd9FHepRU2s=;
 b=NKr1kPT34EdYyrtm3LxWc7rN+ASOBAT1VJIAAhOWMmUlhILIoHATm0J1So9FO0mIZ/IgMimXNk1BiSx3inZ4kY13SmbC82OeuKM5ONapp00653DkGFwp4uVHCljM3LAUTGUBtcL0o1vYwZ8pTZ13aCr4Pcujd0C55mZYsSX4GqfeyKwB9Jy2Imzi+ABYWQN72ynEzdvBr9BxnXijBow+bk2ik3ukG2Kzbdb62J9mzLoRFyLrPMLeCwS7qAyKJySvstvTKCcRyZVis9MuwO8rn4YwBs8T/dKDjgyk49sxarV2kwXd4LQOxZPaU2pGfu5cqauiAw+/yU2H5rL5Bmwe1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BzqME7gm9Bs07DmaNG7+cfgcqsg33JcmGd9FHepRU2s=;
 b=TW/Qlw6rOz9rBg25ubhJ5AF0C4QpeR4zY0nv6IPctsfPwxsRjncxvZ3CyVKbRitPvDCo1Yb5SIVH+cWVZ1gWiLlJBbbwaNUC2dN7p3aBYbgE51PiQ6dLkjYXw+GljUJTRWe5Sr2Wj2Th62jAKkYBdcZB0Zu3v0eHr+L0p1KkPzxsq3vHNBzbOsF42jUn7CUJJdiCBJFarI6qhgXiHDjLeXvhELdw/Yb+koKRUhAeTrctTejOBWKO07Xd51RoowPIP6Zw/9VJyelM4tUYQj6B7VhusiHoTkiRdL86+jAzCHGRQ4wSUCrIx7xG1CVVa5mml5lISUIFMNWaM1bU7dZlaA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH7PR12MB6858.namprd12.prod.outlook.com (2603:10b6:510:1b4::20)
 by DM3PR12MB9415.namprd12.prod.outlook.com (2603:10b6:8:1ac::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Tue, 3 Nov
 2026 00:03:07 +0000
Received: from PH7PR12MB6858.namprd12.prod.outlook.com
 ([fe80::a550:dbcf:2fcf:463d]) by PH7PR12MB6858.namprd12.prod.outlook.com
 ([fe80::a550:dbcf:2fcf:463d%6]) with mapi id 15.21.0569.011; Tue, 3 Nov 2026
 00:03:07 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Tue, 03 Nov 2026 09:02:52 +0900
Subject: [PATCH 2/4] gpu: nova-core: gsp: add the GMC API header
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261103-r000_rebase_on_cmdq-rpc-v1-2-189f9ff3bfd2@nvidia.com>
References: <20261103-r000_rebase_on_cmdq-rpc-v1-0-189f9ff3bfd2@nvidia.com>
In-Reply-To: <20261103-r000_rebase_on_cmdq-rpc-v1-0-189f9ff3bfd2@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Benno Lossin <lossin@kernel.org>, Gary Guo <gary@garyguo.net>
Cc: John Hubbard <jhubbard@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Eliot Courtney <ecourtney@nvidia.com>, Zhi Wang <zhiw@nvidia.com>, 
 linux-kernel@vger.kernel.org, nova-gpu@lists.linux.dev, 
 rust-for-linux@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: OSTP286CA0082.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:227::19) To PH7PR12MB6858.namprd12.prod.outlook.com
 (2603:10b6:510:1b4::20)
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
X-MS-TrafficTypeDiagnostic: PH7PR12MB6858:EE_|DM3PR12MB9415:EE_
X-MS-Office365-Filtering-Correlation-Id: 51fc8ed2-eefd-4dfe-b9bf-08df393dd713
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|10070799003|6133799003|10067099003|22082099003|261102123227099003|18002099003|3023799007|56012099006|11063799006|261022105027099003|261021121427099003|261026121527099003|261026140227099003|261009223027099003|261028144727099003;
X-Microsoft-Antispam-Message-Info:
	oDwCex1JCiLMRV3j+tMKuwq0bFllu2h594Nr9Mk1VKjTSuPOzw3hknQh80prcc7t7GWUYrtpmWcJxOMy2mSREDXNgoAiFzvPa5wvx5sPG2gCZVC1nwWwWZsA8Dvff6PXrKY6UN4Mml4EeC5ND5cFOTlVhU16eKivJukhicWlxH4mETyGmprNZ2f8j+I3CCpFjRIW3LSQgqfFN/HzgMS3jNCfe2dAkux6mJncnTQdKWt2j6pxweV/7Zo64EC06a1l7jHRFl2EjlrWO24Lh+Slqi6KpESm9yVS+yR2nYecVCljWQPq1bmP+xzbHEu+1kWFtBPsNy7asoj7rguwtHH5q8yzdxZ5SKgEKrx5e0pRergfwMsz5VSJGI/EdSqZZ188Ghxf7t7i8ytx4a1joiIEcR1u9IiTS8m3KoPb5L8X32qRinTclpijDyqrJUjgtY9zrTELtZXqS7rWAo5Xy6+UeooDqOMRsPxAKXJCpry1XIwEX4jYCg/XOBUCE6JGV6E/9ySnVKcNVD1BH5+/XrWke7Oo5Wxux8HtyecX4DiF5HxHKPmKwGjfkR1W6q3IVGXrrxc+co3Udd5BF8mnpHrtJqXYnGVVQu3DQ6rMJ099Qvp/SEamw2OCaWAksO/BZcQZMIJ2T4VbWm41kovTjArdQlkJdU0o0H6HyfdQx7U2Q5E=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB6858.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(10070799003)(6133799003)(10067099003)(22082099003)(261102123227099003)(18002099003)(3023799007)(56012099006)(11063799006)(261022105027099003)(261021121427099003)(261026121527099003)(261026140227099003)(261009223027099003)(261028144727099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WThvbU9hcUhuQVlFL0h3NjZiTXJpdDVZN2RPVWRHUlVNSi8ySFdMRk5FWGJZ?=
 =?utf-8?B?eE9td2ljWkxjTmpaNmMvYWpMM2N1MlhwdVBaMWdMRmdZU2FQMkdBVG0zS1lX?=
 =?utf-8?B?QXJhcXVXaVc4dFJOeEFudEpWR3VHZEJRTzYycGhaMmZPeTNBRjUxRXVEd0NB?=
 =?utf-8?B?cVFaNkVNNlVmZFdyWTN0RDMxN2R2VjZEbGcrY3dIK09qWnZIalBXa3ZucEFq?=
 =?utf-8?B?ZDRYU0luZlhNM291emxwaCt6R09yQlFiSGpRSXdtbzJkZWpId3ZiRWloTk5E?=
 =?utf-8?B?aFpud0phUk4reExPS3BCMW5NYXYwUHJvMENWKzBOSVlncW4rQzBYcTl1V3FB?=
 =?utf-8?B?MHFJRXRKNC9YM2JsOHoyQnFlTlloSHpmcjM2ZGpZRk9QUzE3dmZPQXZzS3Bm?=
 =?utf-8?B?ajlQOTF3ZzF4N1J3S01BdnZiY25Tam9KczBaOThGd2Z3blRlVGFRc21OK2s2?=
 =?utf-8?B?U3RtYXRmanJrNllleWRjQ0YvWUdORkRWczdVSThYSDA1ZGtmQmp1U0EzbUxy?=
 =?utf-8?B?d1J1T01zKzVWdGhWeGI5ZGZFNkpnRFRDOHhLaitTNk1LSjljRzMxMG83b2Zu?=
 =?utf-8?B?alJrL3ZGS2hya1pEc0N4cGIxbG9vdnUyeUtLMGE4SkZLRHFGbk1zREYwVjdQ?=
 =?utf-8?B?cFI2cm5JSnZjTTZmVmU4bElCSGNUcHNQdU1NZm85MUZDamwydVJyRmZycGNM?=
 =?utf-8?B?ZjMvWjJIZnhnM0dJWWkrWWRzYjNaeGZCMWFKSE4wM1NrQW9Mc0RxWUZxeGFh?=
 =?utf-8?B?NFVlbFI3bUp6SnBvb0JJb2tPbHJuc1hleSt6aEhCcjNYQjVubjVrTVZDaVIv?=
 =?utf-8?B?U2FENEFmU3pjT2dzVXcvOW1pSnNCaHJlc1lrdC9SNTMwdTVuTkhmcGxOTUhB?=
 =?utf-8?B?Tjc3QldjRTFGNC9YRnQzLzA3a0xaMTVDNmJYLzNuT3NIdGJmTlJWY01tV1pn?=
 =?utf-8?B?TmhUK2J6K3k5RHM3VDU1SXNoSFJ0WVJxZm9vUDlYNUJGSFcrS25xSU9laFBG?=
 =?utf-8?B?aFNHalFUNHNoZFN3bW03NXJMVnREbmlFUURnN0N3UzVPcmFJWGx3RE1RVVJN?=
 =?utf-8?B?Vm5kek15ZnJwRmsvT25uV1VaQUN4VlVVT3lhYURNbVV2SzVDMGJkTGx4RWlw?=
 =?utf-8?B?bFc4SGk3b0xPTDd5cWdPZitrNUdBVTlKdlhCOW5kUGtSTjU1YlFBRzAvVlZS?=
 =?utf-8?B?VHV0a1VZNmUxaG5KYnFtL3UwTENqQ2c3UktWNWNlbzllV2RXNm5MV3ptUEJr?=
 =?utf-8?B?TnNGRVRXK29nclA4U3ZSa1pDWUYrdjhEUVgxYWZHTUh5OWFwQWU1SFNrR0U3?=
 =?utf-8?B?Unh5bVRibkdRMFJ1dVhnZ1RwTTVISXFyOCt3MG9lcjNOYUs1R1pLSU5MN2Va?=
 =?utf-8?B?ZTU1elpwTzh2TEFveFRNRnA3dGpKMHZhaTcvbUlWenRsR1BMVnhCTThOTzRa?=
 =?utf-8?B?eC9QSGl3Q0MxaVRwYWVmTjhUcTVGK3FSQllvT3lsaW8zVEhaZ3BmRHZjOTJU?=
 =?utf-8?B?QkViNTBMRzdlVkNaV0ZESTlyRXZwRWtxazBwM29vaVhaem9HQytIQnFucStD?=
 =?utf-8?B?dkZJcW4yNmRnMEEzWUpDMy9iWW1FZUVGVWY2ZUdPMG1rSDc2V3hHNTZ2YWlE?=
 =?utf-8?B?aXUvT1BkWUI4SVhiTUc3Ykcvei8yNG42VGtid1Nkb3hiTzlpd3BHUnNhNVdl?=
 =?utf-8?B?Q0UxNG04Uko0dFZwWmJyM1NqNW9NdmtSWExsVWJRaXI4ZjdPa0hZdGRvWm81?=
 =?utf-8?B?ZDJvN0hlaHB0UFRmTEs0V0EvN2NXYzhxc2NXLzB2MkhMcjRpdEREN1owVzhs?=
 =?utf-8?B?MGJOZUdPYVg2dVN6eDVoaEFLcFRsamZ3WE1LN2trcnFIQ3hYWDhUS211cFF2?=
 =?utf-8?B?ZG1RYnA4TFRyMmZuWTdFL2VETjFmRmpGQVhaa2JUcHY0TzdsZkRkVEpKelFJ?=
 =?utf-8?B?cFBTeWlLZWpaMllWYlpET0RKZXZOTCs4ZC9LWmY4blFqbWRFV1ZsZ2h3QnYr?=
 =?utf-8?B?a0lyUkpGNXNoS1VPM2dmTTJZOEhsK01tWHN5WWpqQzlFS2sraFR3QmJPb0FX?=
 =?utf-8?B?Nmd1eGlsdVJuaHNXRE02K0lQNW1nMWo4Ni9Pcy9hUjNFV0Z4aWFoMkI1Ulo4?=
 =?utf-8?B?c1JTN09iZGR1dEtIZEs1NUtqaE5LUlhGOVpFRmhSeFlVSDNzdWRVVzFMYWxp?=
 =?utf-8?B?dkVlbWlHaTlybzVQZ295elp2WnVNeXYrZC9DaWt3ajlGQWRITVBucmhUaGdm?=
 =?utf-8?B?QUQ2NXpIeVErdUQveGE2bjBtc2xWc0ZvWmkrcitITkFVTlg0OUU2SzdSRnNm?=
 =?utf-8?B?VlYzY1U0WEpGcXkvVHVVclpBSjVaSnNINHVuMXp2dFpjZ292QXB0TlNjTEsw?=
 =?utf-8?Q?a8LT53WSHrfHJmIrx1F538vU4IIX5UxkszrTAWoyQmCjj?=
X-MS-Exchange-AntiSpam-MessageData-1: q46pMSKjAC+jLw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 51fc8ed2-eefd-4dfe-b9bf-08df393dd713
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB6858.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2026 00:03:07.5470
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GvchZrFRvvxvlzpTJpYhpRB38Rx0wfWhCIuXrzoEDktf//h/8f93R17N6+R0QlrA4Qt4jXbmuFnAQ5K5o7wLIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR12MB9415

From: John Hubbard <jhubbard@nvidia.com>

The r000 firmware carries GSP-RM's boot protocol, and its newer
interfaces in general, over the GMC (GPU Management Controller) API:
messages that follow the queue element header with a GMC API header
instead of an RPC header.

Add the GmcApiHeader type as a newtype over the GMCAPI_HEADER binding,
so we can define the GMC send and receive paths in the following
patches.

[ acourbot: wrap the bindings type instead of redefining it; make
  `status` return an `Option` to avoid returning a value whose semantics
  are ambiguous.]

Assisted-by: LLM
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
Co-developed-by: Alexandre Courbot <acourbot@nvidia.com>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/gsp/fw.rs | 106 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 106 insertions(+)

diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/fw.rs
index 213ef5bfb258..367c8b5e3443 100644
--- a/drivers/gpu/nova-core/gsp/fw.rs
+++ b/drivers/gpu/nova-core/gsp/fw.rs
@@ -37,6 +37,7 @@
 };
 
 use crate::{
+    bounded_enum,
     fb::{
         FbRanges,
         FbSizes, //
@@ -906,6 +907,111 @@ pub(crate) fn function(&self) -> Result<MsgFunction, u32> {
     }
 }
 
+bounded_enum! {
+    /// Commands of the GMC API.
+    #[derive(Debug, Clone, Copy, PartialEq, Eq)]
+    #[repr(u32)]
+    pub(crate) enum GmcCommandId with TryFrom<Bounded<u32, 24>> {
+        GspInit = r000_00::GMCAPI_COMMANDS_GMCAPI_CMD_GSP_INIT,
+        ExecGenericBootloader = r000_00::GMCAPI_COMMANDS_GMCAPI_CMD_EXEC_GENERIC_BOOTLOADER,
+        ExecHsBinary = r000_00::GMCAPI_COMMANDS_GMCAPI_CMD_EXEC_HS_BINARY,
+        GspSuspend = r000_00::GMCAPI_COMMANDS_GMCAPI_CMD_GSP_SUSPEND,
+        MmuFaultQueued = r000_00::GMCAPI_COMMANDS_GMCAPI_CMD_MMU_FAULT_QUEUED,
+    }
+}
+
+bitfield! {
+    /// The `command` word of a [`GmcApiHeader`].
+    pub(crate) struct GmcCommandWord(u32) {
+        /// Command ID.
+        23:0 id ?=> GmcCommandId;
+        /// Set by GSP-RM on the response to a request. Not set for requests and events.
+        24:24 is_response => bool;
+    }
+}
+
+/// Header of a GMC (GPU Management Controller) API message.
+///
+/// In a queue element, it follows the queue element header and precedes the payload of the
+/// command.
+#[repr(transparent)]
+#[expect(dead_code)]
+pub(crate) struct GmcApiHeader {
+    inner: r000_00::GMCAPI_HEADER,
+}
+
+#[expect(dead_code)]
+impl GmcApiHeader {
+    /// Creates the header of a request for `command`, sent with sequence number `sequence` and
+    /// followed by `payload_size` bytes of payload.
+    ///
+    /// `max_reply_size` is the largest reply the sender accepts, and zero for a request that
+    /// GSP-RM does not answer.
+    ///
+    /// # Errors
+    ///
+    /// - `EOVERFLOW` if `payload_size` does not fit its 32-bit field.
+    pub(crate) fn init(
+        command: GmcCommandId,
+        sequence: u64,
+        payload_size: usize,
+        max_reply_size: u32,
+    ) -> impl Init<Self, Error> {
+        let init_inner = try_init!(r000_00::GMCAPI_HEADER {
+            command: GmcCommandWord::zeroed().with_id(command).into(),
+            size: payload_size.try_into().map_err(|_| EOVERFLOW)?,
+            sequence,
+            __bindgen_anon_1: r000_00::GMCAPI_HEADER__bindgen_ty_1 {
+                request: r000_00::GMCAPI_HEADER__bindgen_ty_1__bindgen_ty_1 {
+                    max_response_size: max_reply_size,
+                },
+            },
+            ..Zeroable::init_zeroed()
+        });
+
+        try_init!(GmcApiHeader {
+            inner <- init_inner,
+        })
+    }
+
+    /// Returns the `command` word of the header.
+    pub(crate) fn command(&self) -> GmcCommandWord {
+        GmcCommandWord::from(self.inner.command)
+    }
+
+    /// Returns the sequence number of the message.
+    pub(crate) fn sequence(&self) -> u64 {
+        self.inner.sequence
+    }
+
+    /// Returns the size in bytes of the payload following the header.
+    pub(crate) fn payload_size(&self) -> usize {
+        num::u32_as_usize(self.inner.size)
+    }
+
+    /// Returns the `NV_STATUS` carried by a response to a command.
+    ///
+    /// Returns `Some` with the `NV_STATUS` code if the `response` flag of [`Self::command`] is set;
+    /// otherwise returns `None`.
+    pub(crate) fn status(&self) -> Option<u32> {
+        if self.command().is_response() {
+            // SAFETY: we just checked that the message is a response.
+            let status = unsafe { self.inner.__bindgen_anon_1.response.status };
+
+            Some(status)
+        } else {
+            None
+        }
+    }
+}
+
+// SAFETY: This struct only contains integer types, including inside its union, and a zero-sized
+// array. It has no padding.
+unsafe impl AsBytes for GmcApiHeader {}
+
+// SAFETY: This struct only contains integer types for which all bit patterns are valid.
+unsafe impl FromBytes for GmcApiHeader {}
+
 /// Arguments for GSP startup.
 #[repr(transparent)]
 #[derive(Zeroable)]

-- 
2.56.0

