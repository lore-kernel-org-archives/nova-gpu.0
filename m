Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.196.70
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794841458;
	b=pMAvm/6ZiqQO2gGY+C1HPiwQ8AxCAtqOMeFz4TWzAH24q1OCDj2AMW7Rn5TjAhknKAWg
	 XHid0Ns7UCIg3pxZ31nrdSR6///hTTaTA0sYDNaDxto/0+NLVHjQMrzF+wi4ysl+a4ORu
	 dXBBwXWRpeN7wyWizVKTdTSMXtCo5UJbcdCQHdr5c/Hhn246HWEHALwptA5o36CBByFXX
	 u3LinJGdnlX/IITNnDMAp+whKGjRJ7p5z14vnazclCizaqspj5qUQsAimum/fFF+rrl6P
	 x7DjXgJ9g/b7fBbmx+KdchC29XF+N+wByz1+YJ7UV1BIDRbgi850LHTs/rJgnGiA2Hw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794841458;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:Date:Subject:
	 Content-Type:Content-Transfer-Encoding:Message-Id:X-B4-Tracking:
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
	bh=lj830jae0NwH0nhkgM1zX4c3aa9v7AQoYuPkjbhZwOQ=;
	b=tEArt8tefjxI9eiAhyDF0tscOXuIgLxsTIeudDO3nKoRrOynaBu4TBAbkAH2AyLpBGdH
	 DOYR0sgE8xUNR7nY2t4gPa+vuOoHgjbIE7iDi1j9IlwUarhsocyZThdcfr6vBS+P60NIP
	 XfAHQtzWczVmQDRrHc2ZgbhuYcvGIx9nwd6MHm80xVB9WjdJmnQEQyopUz91viVwA5o86
	 tKzmI8u+RriCFdetgTcjHraVXhDEYT/2dGzvJpd8uPJh29jUyDudUITBeVg2K+qT7yHZF
	 2ghqcoMflmmqPiS8A4NVV+t0bPy32WwAqyvwroQ8arA2+qyOfk8luAOKrZc2WbZYp+w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=t9YzVMy+;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.196.70
Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013070.outbound.protection.outlook.com [40.93.196.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E51CF606A32C
	for <nova-gpu@lists.linux.dev>; Mon, 16 Nov 2026 15:04:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E51CF606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=t9YzVMy+
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aQ+QDzqV8ENRzFrc4n8sdoC1y+ioUk5v+brryNzEnrzT8V5W883dL5PCX0NqGB2XE9TyH+u6n44n5hVmDwWd2daTXffrXW/ufaEIxdAIK35+wuttSEbA/flqQHpbdvORzJJ1FEYrRBRkp26ZKXtn0NNxWxIQLMPbOVp1FH3s0GHP3FtVmNrMiyvnwFn6lS+4nQsBJTh42Xcvmhs/MZs+riIwQfJwfp1MsWdYeD+bTuf9DM0MxFlhInQuYGPHyguVTLnSIg0V8D1lHvpTvyjOnPW73WLPrTsKUwzrSJI/i7Y4hmITCFd7cUGEir4+BqvCkJYLHsYk0ZZgZ0wbeSCbxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lj830jae0NwH0nhkgM1zX4c3aa9v7AQoYuPkjbhZwOQ=;
 b=rmI+Fi4MkpbpOzTEO/Cmt0BzoYSoToz20e0c2r4Bg2OdR1S8bXoVGOUV/RL2G1rUOMlSJgpBg3+57cgiHlVlBB8Pvjw5VE3KEkX6mPQhgHqHTaFRcrU3lOOkgMoNGeYL2Bo5S6a6uVfyPuXGveVDHHCCrQe9i3BEvx7Yt33conz/KE5RcJw1Gx2KGxP+Ijw1+7RF/YbgDSNn0GMAJs/hq9wxmFLxY2ZpczBC3mfVubBUOGMxMNR+VHTdUj8l9Y0JmAogXxXguqG7xnZ+gkC815mbgBvU3N5I8QTJ+8gZNsCjhy/xsFPTUuRsWPrqr6zI00RZzqeuLE4/bbcpwgz3Rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lj830jae0NwH0nhkgM1zX4c3aa9v7AQoYuPkjbhZwOQ=;
 b=t9YzVMy+xZKQBtstodJcAmD2xewHPjyvvezWX95ZE8ToiEIKSwyJjSd9JptNtqESbhJT8cV41wTZcwxqthQzoaVfp9vz1ka8s66d6TCrZ+cERBnscJfBo/eu8WkUEYOHG8BrIYPs2sxr/uIwh6cSEFfG3pYbSDjFHrumFSKR99yvgpq8nx8gec7pXmiuN3mnjLRX6u3Q3AQKow0Ve7U7YX6mkgis91Cg1n0msS642Rp3vud2OIzRdWVsuXvKXQvYVrFFg24hLrtHK2wcre2Mpa1YhjBnd3b12ya0ZjXiVRexa8Jv4abrn6xb4y5JqC5xNouKUy1EJ0awOBg0heNECA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MW4PR12MB6873.namprd12.prod.outlook.com (2603:10b6:303:20c::17)
 by BY5PR12MB4228.namprd12.prod.outlook.com (2603:10b6:a03:20b::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 15:04:09 +0000
Received: from MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1]) by MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1%5]) with mapi id 15.21.0615.012; Mon, 16 Nov 2026
 15:04:09 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Tue, 17 Nov 2026 00:03:54 +0900
Subject: [PATCH] gpu: nova-core: gsp: add the r000 queue element header
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261117-msgelement-v1-1-b918ffae5e7b@nvidia.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDQ0Mz3dzi9NSc1NzUvBJdA8tkS3MzSyOLFDMTJaCGgqLUtMwKsGHRsRB
 +cWlSVmpyCcgEpdpaAEops2JuAAAA
X-Change-ID: 20261116-msgelement-09c976928d64
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: John Hubbard <jhubbard@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Eliot Courtney <ecourtney@nvidia.com>, Zhi Wang <zhiw@nvidia.com>, 
 nova-gpu@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: TY4PR01CA0078.jpnprd01.prod.outlook.com
 (2603:1096:405:36c::16) To MW4PR12MB6873.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MW4PR12MB6873:EE_|BY5PR12MB4228:EE_
X-MS-Office365-Filtering-Correlation-Id: 57e6a22d-c5d1-49d3-d0c1-08df43f2dd45
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|10070799003|23010399003|6133799003|261009223027099003|261009221727099003|261009221227099003|261009220027099003|261009223327099003|18002099003|3023799007|261026140227099003|261026121527099003|261021121427099003|261021123027099003|261022115727099003|261022075727099003|261102123227099003|261022105027099003|261028144727099003|56012099006|10067099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	tHMPFCXoKEhyMLP7gAYwRaWu318FSg9sn6aCrrvxechg6QLYdfDdgqL3n0R3h3tfwnWD2k15HXcR3R/uf+ZbIYp/w1wqL4fjb7DBSiwqLJxOhVKls97O4QhWR4NFF6k/GziCBkIuphl6DAq0RI9ntyDLzRMmGz8m+i24kRIv6ebTbjCq0tmPdE3aMIv1olswes3xraRfXqZteWUwo/aNlEXtJEh0rFky5Ig/5LgKWIaCiWgS5M0T9rF5rP2sjOm7rrOQdw7u6vO0H2t0tiwEFHYse2aUrVa1odB7MzZDdMjKNNe03BKeGgQFpjrFiQx8UOZFT8XW4FHOA/RI2J7tiMGcuI5vMrcQ3DD6ZDn1VWFM9vj+VaOW87F31XGU9365NlwxRIhBs0Eyk64uqOIGh5Oe5OI1egK34INZKF3VYtveiVW/BX+FMYP5wlDea+kjDiXF52VyG2H4hCBh8B45gEr4UGoItJ+LQzAMNNfB9Mb1sQc4nNM2yB9WgvJDE4cxQb4yxKA5LzOvAgoWTzaCz9dey1I++VcApgLEfvpAEhRz7LH2gXVese0CuWBpAdQP4AO8oAjET/21zZupGqeJ483eWvrtm2WDx3KvmV8VvkfaM3uW1MgQkFMFcxViFMZmFF4QIElCyIa9SdNWBYsKBgWxNHufIMrxsC/LA/9Ajm8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR12MB6873.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(10070799003)(23010399003)(6133799003)(261009223027099003)(261009221727099003)(261009221227099003)(261009220027099003)(261009223327099003)(18002099003)(3023799007)(261026140227099003)(261026121527099003)(261021121427099003)(261021123027099003)(261022115727099003)(261022075727099003)(261102123227099003)(261022105027099003)(261028144727099003)(56012099006)(10067099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YkFpOTE4THUyS3JPUjFYREZlM1FaVzNNdXNNa0UwdkdRTDROaUtMTHVOQUZR?=
 =?utf-8?B?NVA4ZGlwMnA4WHhhYWtTcGZVM1lyQVY3cDhLbzVDazRPRUcwV1ZCS0R2OHVw?=
 =?utf-8?B?MTNnUkFYRXc1Zjg4dEttSklpSFFtTUxReS9OMDRvQkpxeDJzNWFlaU1ZenU0?=
 =?utf-8?B?NDVBZ0wraVZ1NEsvWEtsVmErV3NFNXloWmhZSUNUZ1N5WGVHRHNZVDYxbW8w?=
 =?utf-8?B?TmcrckkvZzdqVlNkZ3NRWVBZVDIzekp3alBMSnFpQ2dwb1Y4clFUczQrYmxu?=
 =?utf-8?B?b1lpajJUMTlVQThXa2IzR1RpcCtjK3VCaXdKekxsMmM1Zk5KdmNjNXpmaGhp?=
 =?utf-8?B?ZUxiTUdFZVNMZE50QUNQVjd4Rm1ZTjJXU0V3cTVDQXZoN1QxdkZ4UlUzQUhI?=
 =?utf-8?B?cTNoMlB2SnAwUXNxT0RnUTRYaHlLM3pKckdtS3FNTkxLellEWFBzdmdrSEp1?=
 =?utf-8?B?aXpITGo5cFh3NTVWYmFjOVcveHdJKzYyalByZGMxM0RJNE9XR1pQTThSa3FT?=
 =?utf-8?B?U1FUZ1VVK05KUTF3SVd5RUoxcG5Cai9kdWJkQVdpRHFneFlxYnhOU2t0RFoy?=
 =?utf-8?B?aTVvU3ZNb3VydVNNVWE4L2lJU21qUWtDdjk4eEdBS01pd0thbzJ2cC9RYmNI?=
 =?utf-8?B?UEdSRVRnbVl5S2hBcUdoaHlKSEJ6c0xVTVBpNWRsVEdXcjNodlVyRzNDT0g5?=
 =?utf-8?B?R09wWEFwUENEa2M0LzlTNDUyZ2dZMUhyWlhJK0RPUEZ0ZmdxMFRyblllQXJE?=
 =?utf-8?B?TVpUWDZibk5qWEpnOStUb3gyazJGei9YdlkrQzFPOTN3VW10U0wyZENpRzNj?=
 =?utf-8?B?UHNSOE4yNCs2cndHMzdIcU5aSXp3dnROR1NHeEgzNzBEQndVR0VkQUpuTTlU?=
 =?utf-8?B?TFA0Rnh2Z1lMTisrMS9FYWdzWlN1a1g3RnRVUGJvZEJnNHJCZGdtK0tvK2Vu?=
 =?utf-8?B?S3FmZDdrTW4vRFYwWW9jUlpHcDJiVk9WQXN5cTlXODlIUWN5d3hCWCsxNzE0?=
 =?utf-8?B?KzFiR3BZTkdQeURyQmJtSFhKU1ZLalZtcGFnS1pnakdZMlZEVmcvV3o3TVhN?=
 =?utf-8?B?My9XVjRjOUhMTEZhN3lETFRCWUZBbVp1OEpDMSsydXNNcXBIMS90QTE3WVJj?=
 =?utf-8?B?NnpQSWNUdkxRS00vQXkyU1NNd2lyaU42Vmx3WjYyL0pkYS9kL3IrSEd6OElw?=
 =?utf-8?B?MlV6ZlVFWXpnS0MrK2l1MWluQ3dta1NTKzJoOU1EaDZNUFlEVlY5UGRER1RW?=
 =?utf-8?B?MWZCcVBGTEZDYm5jSzVWVFBEVmlIYmlzSUJGUUdGM1BQSTBtdkZBVysyckto?=
 =?utf-8?B?RG9BQU9xQi80WUZ5MzUzeVdXV3Vzd3dubjBQT0NBQ05BQldqOWtWOHZnQWE5?=
 =?utf-8?B?TXN6VmVwZ1RKbEwyUGRndWlwK2wra0tnNWVKdS92NE9JUUQrdE5JY3lIVlJD?=
 =?utf-8?B?YnBjakRTM3pRenFjUVNiN0Q4a2pkVENhT2pET3Y1bmg0VEhPbHlTSWk4bm4v?=
 =?utf-8?B?a2F3ZCs1bDNKZ1dOMU9ZaTlscmgzY3RkSS9leXlMNTVaMUpueFRXdlNJSVMy?=
 =?utf-8?B?VFN3eGdzT21JUUNhaXFoTkN2dVJ1NE1aYUZ3aXZ2SWF2Z3JkZVZhVm1MS0Ix?=
 =?utf-8?B?VkVBVGQzWC9mZE1qdUhPMVo4Nm51cVplTG1RdnAxbjVDMElweXdJVGVzcmtw?=
 =?utf-8?B?UXQ0cFJLYnpZMUZzZFRLaXdoekZVcEMvSVlhN0hqR3dnMlJmRWp4ZE5UbWhR?=
 =?utf-8?B?V0pNNlFXUStkRFNzVm9HTzN3S25kYTVrbVY5Ny9vWnFhUVpTeWpTL1BGWWNo?=
 =?utf-8?B?TVJESkJaK25ySW04cHRKWW5ITVZHWmx2ZHFOT1R4dmhsZ1RBN2FnRExrU1FE?=
 =?utf-8?B?dTZtcm9EenJRNkR6MmxGRVpFbWtQRmR1bGVGVzBsSUZyTkFKWXhZNHBoQ3RB?=
 =?utf-8?B?R3kwQU9xSVRkVEtjWXNNTWNVQzJaUURsQ3Mrdm12RGhkdnRtRld4UnZBR2Mr?=
 =?utf-8?B?WWpFdi82VTFqOWduT3k1SXJ4dEVhajFRRTZYdVB0TG1NWWF0aGwwclNsNzNW?=
 =?utf-8?B?Z1ZzM0NlbkZ6UCtmWGNIZUVsc1czKzJ2UlpyUXd5L3RZaE9QMlJVb2pOOHpw?=
 =?utf-8?B?aFdxWXVWZC9QK21pTWxTTFgrQ2ZpaHVGYkRneFQ3TGsxcWNPT1V5WGVISGdq?=
 =?utf-8?B?TUpPaGJ2aG5DRGlMSTR1L0oyYXZJK0J6d0doclpnejEvUEtwZUMvbTM3V2pM?=
 =?utf-8?B?RDFtYXh3YWROOHBvWHRWaVQ4b3J3akR1OGhGOVdDVDRadjRnamFkUjRzeEJi?=
 =?utf-8?B?N2RYVTlWNThqbUFVUEl5Qm03WWVnTmZqNzlJSHVldStvZWltbFFNSTVNb2x3?=
 =?utf-8?Q?76RmJiiIkCLaD/eiaYX/c95VimcbCUYTB41W1avsCSlFA?=
X-MS-Exchange-AntiSpam-MessageData-1: +g6hKPcRn/6U+Q==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 57e6a22d-c5d1-49d3-d0c1-08df43f2dd45
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB6873.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 15:04:09.0689
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WZGccYSc7kQNiiaW5dROwkMPZGiZMeCEA7MaptVCM5XyOvSH8Dwv+JD/unODlgC1gi8qmMfs9JclO6FlQvqdVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4228

From: John Hubbard <jhubbard@nvidia.com>

The upcoming r000 firmware uses a new queue element header that includes
MCTP and NVDM headers describing the type of message (RPC or GMC) that
follows.

Add that header as the `QueueElementHeader` type, along with the two
NVDM types that the GSP queues use and the MCTP version and NVDM vendor
checks that validating it requires.

The type is written out field by field rather than wrapped around the
generated binding, as `GSP_MSG_QUEUE_ELEMENT` keeps a 16-byte encryption
tag, only used with confidential computing, in a union with its last two
fields, making the binding 16 bytes larger than what the GSP expects on
the queues. Static assertions check every field offset and the size of
the type against the binding.

The header has no user yet: it replaces `GspMsgElement` at the transport
level in a later patch that switches to the r000 firmware, and is built
as dead code until then.

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
Co-developed-by: Alexandre Courbot <acourbot@nvidia.com>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
This patch is extracted from John's r000 series [1], as a dependency for
the rest of the series and the following vGPU work.

Based on drm-rust-next.

[1] https://lore.kernel.org/20260918010719.1176945-1-jhubbard@nvidia.com
---
 drivers/gpu/nova-core/gsp/fw.rs                  | 187 ++++++++++++++++++++++-
 drivers/gpu/nova-core/gsp/fw/r000_00/bindings.rs |  97 ++++++++++++
 drivers/gpu/nova-core/mctp.rs                    |  20 ++-
 3 files changed, 301 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/fw.rs
index 5c216d777dff..0db998192ccc 100644
--- a/drivers/gpu/nova-core/gsp/fw.rs
+++ b/drivers/gpu/nova-core/gsp/fw.rs
@@ -48,6 +48,11 @@
         cmdq::Cmdq, //
         GSP_PAGE_SIZE,
     },
+    mctp::{
+        MctpHeader,
+        NvdmHeader,
+        NvdmType, //
+    },
     num::{
         self,
         FromSafeCast, //
@@ -901,6 +906,186 @@ pub(crate) fn function(&self) -> Result<MsgFunction, u32> {
     }
 }
 
+/// First word of every r000 queue element: `"MCTP"` in ASCII.
+const MCTP_MAGIC: u32 = 0x4D43_5450;
+
+/// Header opening every element of the r000 GSP queues.
+///
+/// A queue element is laid out as follows:
+///
+/// ```text
+///     +------------------------------------+
+///     | Queue element header               |  This type: MCTP magic, element length, MCTP
+///     |                                    |  header, NVDM header, message length.
+///     +------------------------------------+
+///     | Message header                     |  The RPC header or the GMC API header. The NVDM
+///     |                                    |  type selects between the two.
+///     +------------------------------------+
+///     | Payload                            |  Message-specific data.
+///     +------------------------------------+
+/// ```
+///
+/// This is the `noEncryption` layout of the `GSP_MSG_QUEUE_ELEMENT` binding. That binding keeps
+/// a 16-byte encryption tag, used only with confidential computing, in a union with the two
+/// trailing fields of this header, so wrapping it would make every element 16 bytes larger than
+/// what the GSP expects. The fields are thus declared again here, with their offsets checked
+/// against the binding. OpenRM has the same split and calls the size of this layout
+/// `GSP_MSG_QUEUE_ELEMENT_SIZE_NO_ENCRYPTION`.
+#[repr(C)]
+pub(crate) struct QueueElementHeader {
+    /// Always [`MCTP_MAGIC`].
+    mctp_magic: u32,
+    /// Length in bytes of the whole element, this header included.
+    ///
+    /// Under confidential computing the GSP pads elements out to whole queue slots, so this can
+    /// be larger than `nvdm_payload_size` plus the size of this header, but never smaller.
+    mctp_payload_size: u32,
+    /// MCTP header of the message.
+    mctp_header: MctpHeader,
+    /// NVDM header of the message.
+    nvdm_header: NvdmHeader,
+    /// Length in bytes of the message following this header: the message header and its
+    /// payload.
+    nvdm_payload_size: u32,
+    reserved: u32,
+}
+
+/// Static validation of [`QueueElementHeader`] against its bindings type. Kept in a sub-module to
+/// stay out of the way of the rest of the code.
+mod queue_element_header_validation {
+    use super::*;
+
+    // Offsets of `QueueElementHeader`'s fields
+
+    static_assert!(
+        core::mem::offset_of!(QueueElementHeader, mctp_magic)
+            == core::mem::offset_of!(r000_00::GSP_MSG_QUEUE_ELEMENT, mctpMagic)
+    );
+    static_assert!(
+        core::mem::offset_of!(QueueElementHeader, mctp_payload_size)
+            == core::mem::offset_of!(r000_00::GSP_MSG_QUEUE_ELEMENT, mctpPayloadSize)
+    );
+    static_assert!(
+        core::mem::offset_of!(QueueElementHeader, mctp_header)
+            == core::mem::offset_of!(r000_00::GSP_MSG_QUEUE_ELEMENT, mctpHeader)
+    );
+    static_assert!(
+        core::mem::offset_of!(QueueElementHeader, nvdm_header)
+            == core::mem::offset_of!(r000_00::GSP_MSG_QUEUE_ELEMENT, nvdmHeader)
+    );
+
+    /// The `noEncryption` member of the union of `GSP_MSG_QUEUE_ELEMENT`, which holds the two
+    /// trailing fields of [`QueueElementHeader`].
+    // Using `allow` instead of `expect` as rustc 1.85 ignores uses from `static_assert!` and
+    // reports this as dead code.
+    #[allow(dead_code)]
+    type QueueElementNoEncryption = r000_00::GSP_MSG_QUEUE_ELEMENT__bindgen_ty_1__bindgen_ty_2;
+
+    // Offsets of fields under [`QueueElementNoEncryption`] within `GSP_MSG_QUEUE_ELEMENT`.
+
+    // Using `allow` instead of `expect` as rustc 1.85 ignores uses from `static_assert!` and
+    // reports this as dead code.
+    #[allow(dead_code)]
+    const QUEUE_ELEMENT_NO_ENCRYPTION_OFFSET: usize =
+        core::mem::offset_of!(r000_00::GSP_MSG_QUEUE_ELEMENT, __bindgen_anon_1)
+            + core::mem::offset_of!(r000_00::GSP_MSG_QUEUE_ELEMENT__bindgen_ty_1, noEncryption);
+
+    static_assert!(
+        core::mem::offset_of!(QueueElementHeader, nvdm_payload_size)
+            == QUEUE_ELEMENT_NO_ENCRYPTION_OFFSET
+                + core::mem::offset_of!(QueueElementNoEncryption, nvdmPayloadSize)
+    );
+    static_assert!(
+        core::mem::offset_of!(QueueElementHeader, reserved)
+            == QUEUE_ELEMENT_NO_ENCRYPTION_OFFSET
+                + core::mem::offset_of!(QueueElementNoEncryption, reserved)
+    );
+
+    // Ensure the size of `QueueElementHeader` matches the `noEncryption` layout.
+
+    static_assert!(
+        size_of::<QueueElementHeader>()
+            == QUEUE_ELEMENT_NO_ENCRYPTION_OFFSET + size_of::<QueueElementNoEncryption>()
+    );
+}
+
+#[expect(dead_code)]
+impl QueueElementHeader {
+    /// Creates the header of an element carrying a message of NVDM type `nvdm_type` and
+    /// `message_len` bytes, message header included.
+    ///
+    /// # Errors
+    ///
+    /// - `EOVERFLOW` if the total length does not fit its 32-bit field.
+    pub(crate) fn init(nvdm_type: NvdmType, message_len: usize) -> impl Init<Self, Error> {
+        try_init!(QueueElementHeader {
+            mctp_magic: MCTP_MAGIC,
+            mctp_payload_size: size_of::<Self>()
+                .checked_add(message_len)
+                .ok_or(EOVERFLOW)?
+                .try_into()
+                .map_err(|_| EOVERFLOW)?,
+            mctp_header: MctpHeader::single_packet(),
+            nvdm_header: NvdmHeader::new(nvdm_type),
+            nvdm_payload_size: message_len.try_into().map_err(|_| EOVERFLOW)?,
+            reserved: 0,
+        })
+    }
+
+    /// Returns the length of the whole element, this header included.
+    pub(crate) fn element_len(&self) -> usize {
+        num::u32_as_usize(self.mctp_payload_size)
+    }
+
+    /// Returns the length of the message following this header, message header included.
+    pub(crate) fn message_len(&self) -> usize {
+        num::u32_as_usize(self.nvdm_payload_size)
+    }
+
+    /// Returns the number of slots (i.e. memory pages) used by this message.
+    pub(crate) fn element_count(&self) -> u32 {
+        self.mctp_payload_size.div_ceil(cv!(GSP_PAGE_SIZE))
+    }
+
+    /// Returns the NVDM type of the message following this header, or `EINVAL` if it is not a
+    /// known one.
+    pub(crate) fn nvdm_type(&self) -> Result<NvdmType> {
+        self.nvdm_header.nvdm_type()
+    }
+
+    /// Validates the framing of the element.
+    ///
+    /// # Errors
+    ///
+    /// - `EIO` if the magic, the MCTP version or the NVDM vendor is wrong, or if the element
+    ///   length is smaller than this header and the message together, or larger than the
+    ///   maximum element size.
+    pub(crate) fn validate(&self) -> Result {
+        if self.mctp_magic != MCTP_MAGIC
+            || !self.mctp_header.has_expected_version()
+            || !self.nvdm_header.has_nvidia_vendor()
+        {
+            return Err(EIO);
+        }
+
+        let element_len = self.element_len();
+        if element_len < size_of::<Self>().saturating_add(self.message_len())
+            || element_len > GSP_MSG_QUEUE_ELEMENT_SIZE_MAX
+        {
+            return Err(EIO);
+        }
+
+        Ok(())
+    }
+}
+
+// SAFETY: All fields are integer types or transparent wrappers over one, with no padding.
+unsafe impl AsBytes for QueueElementHeader {}
+
+// SAFETY: All fields are integer types or transparent wrappers over one, for which all bit
+// patterns are valid.
+unsafe impl FromBytes for QueueElementHeader {}
+
 bounded_enum! {
     /// Commands of the GMC API.
     #[derive(Debug, Clone, Copy, PartialEq, Eq)]
@@ -926,7 +1111,7 @@ pub(crate) struct GmcCommandWord(u32) {
 
 /// Header of a GMC (GPU Management Controller) API message.
 ///
-/// In a queue element, it follows the queue element header and precedes the payload of the
+/// In a queue element, it follows the [`QueueElementHeader`] and precedes the payload of the
 /// command.
 #[repr(transparent)]
 pub(crate) struct GmcApiHeader {
diff --git a/drivers/gpu/nova-core/gsp/fw/r000_00/bindings.rs b/drivers/gpu/nova-core/gsp/fw/r000_00/bindings.rs
index 552299c98169..959e397c26aa 100644
--- a/drivers/gpu/nova-core/gsp/fw/r000_00/bindings.rs
+++ b/drivers/gpu/nova-core/gsp/fw/r000_00/bindings.rs
@@ -30,6 +30,49 @@ fn fmt(&self, fmt: &mut ::core::fmt::Formatter<'_>) -> ::core::fmt::Result {
         fmt.write_str("__IncompleteArrayField")
     }
 }
+#[repr(C)]
+pub struct __BindgenUnionField<T>(::core::marker::PhantomData<T>);
+impl<T> __BindgenUnionField<T> {
+    #[inline]
+    pub const fn new() -> Self {
+        __BindgenUnionField(::core::marker::PhantomData)
+    }
+    #[inline]
+    pub unsafe fn as_ref(&self) -> &T {
+        ::core::mem::transmute(self)
+    }
+    #[inline]
+    pub unsafe fn as_mut(&mut self) -> &mut T {
+        ::core::mem::transmute(self)
+    }
+}
+impl<T> ::core::default::Default for __BindgenUnionField<T> {
+    #[inline]
+    fn default() -> Self {
+        Self::new()
+    }
+}
+impl<T> ::core::clone::Clone for __BindgenUnionField<T> {
+    #[inline]
+    fn clone(&self) -> Self {
+        *self
+    }
+}
+impl<T> ::core::marker::Copy for __BindgenUnionField<T> {}
+impl<T> ::core::fmt::Debug for __BindgenUnionField<T> {
+    fn fmt(&self, fmt: &mut ::core::fmt::Formatter<'_>) -> ::core::fmt::Result {
+        fmt.write_str("__BindgenUnionField")
+    }
+}
+impl<T> ::core::hash::Hash for __BindgenUnionField<T> {
+    fn hash<H: ::core::hash::Hasher>(&self, _state: &mut H) {}
+}
+impl<T> ::core::cmp::PartialEq for __BindgenUnionField<T> {
+    fn eq(&self, _other: &__BindgenUnionField<T>) -> bool {
+        true
+    }
+}
+impl<T> ::core::cmp::Eq for __BindgenUnionField<T> {}
 pub type __u8 = ffi::c_uchar;
 pub type __u16 = ffi::c_ushort;
 pub type __u32 = ffi::c_uint;
@@ -39,6 +82,60 @@ fn fmt(&self, fmt: &mut ::core::fmt::Formatter<'_>) -> ::core::fmt::Result {
 pub type u32_ = __u32;
 pub type u64_ = __u64;
 #[repr(C)]
+#[derive(Debug, Default, Copy, Clone, MaybeZeroable)]
+pub struct GSP_MSG_QUEUE_ENCRYPTION_TAG {
+    pub authTagBuffer: [u8_; 16usize],
+}
+#[repr(C)]
+#[derive(MaybeZeroable)]
+pub struct GSP_MSG_QUEUE_ELEMENT {
+    pub mctpMagic: u32_,
+    pub mctpPayloadSize: u32_,
+    pub mctpHeader: u32_,
+    pub nvdmHeader: u32_,
+    pub __bindgen_anon_1: GSP_MSG_QUEUE_ELEMENT__bindgen_ty_1,
+}
+#[repr(C)]
+#[derive(MaybeZeroable)]
+pub struct GSP_MSG_QUEUE_ELEMENT__bindgen_ty_1 {
+    pub withEncryption: __BindgenUnionField<GSP_MSG_QUEUE_ELEMENT__bindgen_ty_1__bindgen_ty_1>,
+    pub noEncryption: __BindgenUnionField<GSP_MSG_QUEUE_ELEMENT__bindgen_ty_1__bindgen_ty_2>,
+    pub bindgen_union_field: [u32; 6usize],
+}
+#[repr(C)]
+#[derive(Debug, Default, MaybeZeroable)]
+pub struct GSP_MSG_QUEUE_ELEMENT__bindgen_ty_1__bindgen_ty_1 {
+    pub encryptionTag: GSP_MSG_QUEUE_ENCRYPTION_TAG,
+    pub nvdmPayloadSize: u32_,
+    pub reserved: u32_,
+    pub payload: __IncompleteArrayField<u8_>,
+}
+#[repr(C)]
+#[derive(Debug, Default, MaybeZeroable)]
+pub struct GSP_MSG_QUEUE_ELEMENT__bindgen_ty_1__bindgen_ty_2 {
+    pub nvdmPayloadSize: u32_,
+    pub reserved: u32_,
+    pub payload: __IncompleteArrayField<u8_>,
+}
+impl Default for GSP_MSG_QUEUE_ELEMENT__bindgen_ty_1 {
+    fn default() -> Self {
+        let mut s = ::core::mem::MaybeUninit::<Self>::uninit();
+        unsafe {
+            ::core::ptr::write_bytes(s.as_mut_ptr(), 0, 1);
+            s.assume_init()
+        }
+    }
+}
+impl Default for GSP_MSG_QUEUE_ELEMENT {
+    fn default() -> Self {
+        let mut s = ::core::mem::MaybeUninit::<Self>::uninit();
+        unsafe {
+            ::core::ptr::write_bytes(s.as_mut_ptr(), 0, 1);
+            s.assume_init()
+        }
+    }
+}
+#[repr(C)]
 #[derive(MaybeZeroable)]
 pub struct GMCAPI_HEADER {
     pub command: u32_,
diff --git a/drivers/gpu/nova-core/mctp.rs b/drivers/gpu/nova-core/mctp.rs
index f62e79f56b05..392fa7c8baf6 100644
--- a/drivers/gpu/nova-core/mctp.rs
+++ b/drivers/gpu/nova-core/mctp.rs
@@ -28,6 +28,10 @@ pub(crate) enum NvdmType with TryFrom<Bounded<u32, 8>> {
         Cot = 0x14,
         /// FSP command response.
         FspResponse = 0x15,
+        /// RPC message to or from GSP-RM.
+        RmRpc = 0x25,
+        /// GMC (GPU Management Controller) API message to or from GSP-RM.
+        GmcApi = 0x26,
     }
 }
 
@@ -67,6 +71,11 @@ pub(crate) fn single_packet() -> Self {
     pub(crate) fn is_single_packet(self) -> bool {
         self.som().into_bool() && self.eom().into_bool()
     }
+
+    /// Returns whether this header carries the MCTP version this driver uses.
+    pub(crate) fn has_expected_version(self) -> bool {
+        u32::from(self.version()) == Self::VERSION
+    }
 }
 
 /// MCTP message type for PCI vendor-defined messages.
@@ -93,10 +102,17 @@ pub(crate) fn new(nvdm_type: NvdmType) -> Self {
             .with_nvdm_type(nvdm_type)
     }
 
-    /// Validates this header against the expected NVIDIA NVDM format and type.
-    pub(crate) fn validate(self, expected_type: NvdmType) -> bool {
+    /// Returns whether this is the header of a PCI vendor-defined message from NVIDIA.
+    ///
+    /// The GPU firmware only ever sends such messages, so a mismatch is a sign of corruption.
+    pub(crate) fn has_nvidia_vendor(self) -> bool {
         u8::from(self.msg_type()) == MSG_TYPE_VENDOR_PCI
             && u16::from(self.vendor_id()) == Vendor::NVIDIA.as_raw()
+    }
+
+    /// Validates this header against the expected NVIDIA NVDM format and type.
+    pub(crate) fn validate(self, expected_type: NvdmType) -> bool {
+        self.has_nvidia_vendor()
             && matches!(self.nvdm_type(), Ok(nvdm_type) if nvdm_type == expected_type)
     }
 }

---
base-commit: 8045d0e7d208ad389a387f1407ce0db9070805af
change-id: 20261116-msgelement-09c976928d64

Best regards,
--  
Alexandre Courbot <acourbot@nvidia.com>

