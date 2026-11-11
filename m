Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.52.67
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794378631;
	b=zaAjMqUSzLtdsU42DDhzpyBfR8I92Q/ofSugFC2eubKj3KFZ1Afy62honcORJN+ZwW1x
	 dS09M++BzY2R0MAK//YxlhezxWsWV4A7uOvSQxNcKYGG8+mryuXDRpzoPCQF2ViPWqhnG
	 bn6D8Sp+W5FoKfbOtHuYppTDX7qwOzuxP4WDDijJd9HF9DIr54lG8c9u4Ens4uxnXxJxc
	 7hPE+iZYpdTgPN6aDLS/95v/zX8d7LEBMRCrZ8AfbjpCAEr4TW+ipnsX9yBHOf/EfpfSr
	 4MFofxkQRvcUnAsasXy2sQHlIwXQAplb8/0eFGhlunL9X4zAn7+kgCXHFN3bFNPMhrQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794378631;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:Subject:From:
	 To:X-Mailer:References:In-Reply-To:X-ClientProxiedBy:MIME-Version:
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
	bh=WBnDsKzxNm7GVTTD0eQ8Cfna6toO8AEW0C5rxCpybkI=;
	b=RqtE3OUy8ZK1/qlbNH6efKVW2nsHT2TUl6tAN9CW/Pql88y9fNePSkIcspyO0HD4Mut/
	 ugiaajTml7NssmWb9afo0JhcNKajTzlHhLVGINeUGKfhyV+uvnS/JbEDhDKq/eEgvOBzf
	 T9yYbPGD/+7ftCJpErdJpLLcMp8rfhdQI1tz/wPPgf+6WZ8hhCSWiU2CXNljp2tnqIMRI
	 TVzrOf6082AhfLAaqCVTKG7Y/p3GYMQYvpahlOsi5TNt/QU3w+UMiN0/HEW+8Mlgz/pKN
	 j1DSbw268j31N9GLH3I813i7FuByM8KE0rrCbGnY32cekci2HXBSoLAungHaUQqNKcg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=efI+fMvU;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.52.67
Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011067.outbound.protection.outlook.com [52.101.52.67])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4D53606A327
	for <nova-gpu@lists.linux.dev>; Wed, 11 Nov 2026 06:30:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A4D53606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=efI+fMvU
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nM0Fql1hxhRNj+t1bZpbtHAAacS2QI+hKXmu3e8uq1Up6yHBIuLAg3vVS8dvSIyWTScbQzEUad6trVaMU3A1wL29+stKqSsBtAivhj03G+avw/2JmioTgpZe+c0m3yCFGR8tKeWmsll7RqqKOYaNvEMfjT7ztEavYgKmyqpV15AKNZEIMXYx4lESOxadgR+WhCgEW5WAb56mCvaqDKrOkTN8NudeEdJipop9gXsYNnoFgOVPLEZP+JsUaXFe30AzR4stNPBw9KvRlgHvPSp2Wn8DycRL1GdBoZiVhOUOW7lf1NzEPpwa5MLAWrbaCSgoH1J0uH8NshOb/Vy02AaGKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WBnDsKzxNm7GVTTD0eQ8Cfna6toO8AEW0C5rxCpybkI=;
 b=tz5I/+g9xWy+9rrGxcw9duxGfMCwM2zG+sHfFnujZfBy+K1uNHkgATfX0Ypb6NjZ8avXwcswBgWoAQfWAVcfdkXfJTwR8vzUK5dYQEgJo4IeVxQHF+GnhUCevahPP2Ura5cIOPXpI69AmgJzNIRjJDE6q3lZMl9+3s5xgeKe23O+gm4SB4OiXuZ51zQroULg2RFTeysN5KrjHVfBm/2IO/nUQN+SA9C41Bq7ri40AzV3MpvMY0ZVYWiHYo0bFiMQWaq5Nrm9TxMzna4Gny3yqwhbED75WkVKJcRdCYSnMIgajnIB732SfXOI/wOfQNwCRPxN2vUHoojWPMQ1QgcNeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WBnDsKzxNm7GVTTD0eQ8Cfna6toO8AEW0C5rxCpybkI=;
 b=efI+fMvU7GwrQonGODE4h/qUGnTy9rcxxLdrWrTN1i7aIFArPMD/BNo9MWU3KIm1pfWnh9pxcMw+9lNvpMnek/g7dtAY97zyNWwsVDbOfH++FzPsA43NTd8wd5d0/Ve/W1hJdcMR/e2wQV5TwhBKOiOauoS67dRB22NcIbE6kqoFP2m/uiuFZhNN7FO+DZ6DoJ0GAzw8FBrdL74HZRCuhBnfLQECa68nF7YIJ6azavQxfzW887ck4qREW/rj3yYca0iwS+nrb5LiXpMLccTd+iSkdIevfEinQ0VCbYq9ovG5Fn1wg8jRZIQWZiWJewaFmkmhMFlQE2UXNbulrNNFLw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6413.namprd12.prod.outlook.com (2603:10b6:8:ce::10) by
 AT6PR12MB026081.namprd12.prod.outlook.com (2603:10b6:170:113::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Wed, 11 Nov
 2026 06:30:27 +0000
Received: from DS0PR12MB6413.namprd12.prod.outlook.com
 ([fe80::e82a:6673:4142:37fa]) by DS0PR12MB6413.namprd12.prod.outlook.com
 ([fe80::e82a:6673:4142:37fa%5]) with mapi id 15.21.0592.010; Wed, 11 Nov 2026
 06:30:27 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 11 Nov 2026 15:30:24 +0900
Message-Id: <DMS64VZKSLOP.2RCSK9BCHD47C@nvidia.com>
Subject: Re: [PATCH 2/5] gpu: nova-core: merge LibosParams into
 GspFwHeapParams
From: "Eliot Courtney" <ecourtney@nvidia.com>
To: "Timur Tabi" <ttabi@nvidia.com>, "Danilo Krummrich" <dakr@kernel.org>,
 "Alexandre Courbot" <acourbot@nvidia.com>, "John Hubbard"
 <jhubbard@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>,
 <nova-gpu@lists.linux.dev>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261110231053.1352163-1-ttabi@nvidia.com>
 <20261110231053.1352163-3-ttabi@nvidia.com>
In-Reply-To: <20261110231053.1352163-3-ttabi@nvidia.com>
X-ClientProxiedBy: TY4P301CA0101.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:37b::8) To DS0PR12MB6413.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: DS0PR12MB6413:EE_|AT6PR12MB026081:EE_
X-MS-Office365-Filtering-Correlation-Id: e4246fd8-b109-4e54-8a7d-08df3fbd4665
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|23010399003|10070799003|10067099003|261102123227099003|261021135927099003|261021121427099003|261022075727099003|261026121527099003|56012099006|11063799006|4143699003|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	xlAT/auVwVoMtn33e84W5xEV1zl0tWYHLMQXNWWAr9tCXmTh3sO5dnEIhWOB1JllpjbKgkIrSZU8alkEhxHuL/A2POjrYvfQ5YUD/Aq+CjAPpxOrdiA5TP4LPT8ykaBk0OT1oKeZ1ILvUzUr7PqBlkuG6j4NDUuXQgq4exiZMIBCubODMUOzt64z77wGfndI9l8UMDuD8XG73i7O2rOV5aalIvHPpZS8EDPol0tIaZazh6dkNudu82Hza8Xo41Rh1RmHR5yTvcMlt6IWd9guyz/NAUyHrt2AaDO0fmE4GHaxoCs16sZEyZRbwRDWz5gft2af3Z81c8w0xGgso3puR+DgrKBKQuGs0FbaDNDfJpoQlThmP0JcSQyy9lkaQhaAy/OQYEdI0MvW1VbFVfNlqivVF3quh5QRhOv3CSoV3p4vRi66uF2kjMhaAIK7Gg4rHCd3BhVZuZt1xKsTUrECVEX7Fd7XDexjv5+RI4rCVdFN/tCmR3lUrlHxQPRG1NO5lI6L8Cd6VEz2rxU+gS6uNZa+O/sk1Ic6U8IBypC7R68Sgyt1n09Ra9plefKNu3hPvjwOuR9vegxLRHaLDJf6Cuz49dsUEPVj/wp+F15Ir5bHRaw85Ki8qOMNb9H9iSDJCjCwLv5neVAGOST0+Go8m2vkcAAcN+pJCN7q0z2i8Xs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB6413.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(10070799003)(10067099003)(261102123227099003)(261021135927099003)(261021121427099003)(261022075727099003)(261026121527099003)(56012099006)(11063799006)(4143699003)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R3lHMjlwNmFuRW14WVpzWVZvWXdyT0FhWUo2MitDak04c3hKM3JlazUxTkZv?=
 =?utf-8?B?WWl3YWM3dUxHRnI3UmZuVS9PQ0svRmdqaTZkQXFpOVJURGoybCtkOWNxKzlW?=
 =?utf-8?B?VnZFYytGek9hc1hCZFFxSzIyb1JkeFdSZjE4R2I4Q0ZPVjhiS3dVeENkaGND?=
 =?utf-8?B?eUlUckhGOEc0UUxFakgvZlBKd2Q3ckE4MXhXelU5RHJOYUpaaVYyTFAxcjln?=
 =?utf-8?B?NzN4ZFUwTTIyTzUwbEpMYU1jcGlJTm0vczlXL2N3QThSN0FiamNvRkQ2RXdH?=
 =?utf-8?B?QjRLWVRvcXd4L1NHSHVGM3BuaFhXZHA4MTBHdEI2STN3SHFJeEhIemhoN0RN?=
 =?utf-8?B?VzZKVFRGZ25sN05BRnlWWHVLOEljRTBDek1SblpqZlNQeUlLU01RVURFeHlo?=
 =?utf-8?B?TU9uY3NCMEQvZW1kRUJ5RDdTOS85a3UvMXdpU2plSDRTcndkMCtpNXN6UHht?=
 =?utf-8?B?WUIrV0xzNXBwMjdOL1dlNkJIbE10U0RLOEhCUXZhNFBmR2ZSbXRWMXAwZG9S?=
 =?utf-8?B?Nm95ZHE5RldKS0w1Q3dJeEZrUHVRWWR4SEN2aExxdnVZSm5PMUxBanREWm9s?=
 =?utf-8?B?YkU0OXU2d3JMMDhHVkZkclBLdTk4M09OWG45T2g4a293d3k4bmYzS1VDeWhp?=
 =?utf-8?B?bS84QUhyVmJaS0lIdW5ETzdVcitwTHg2NmY0MHFweHJyMS9QRVdOL0UxVDdq?=
 =?utf-8?B?Z21ibmtzSDFKQkJ5TGtDRjJqWDYrRjkva20xU3Q1Um11U3lwWTJpZ2F5M2Rk?=
 =?utf-8?B?Nk1nQlhvK0VGeXB6K1dYOFNLS3pXcXByM2d2SXJ1U2ZJMXZlZWZjeDUzMmZu?=
 =?utf-8?B?eVJHYXdPZFpaRkpuNm5JekpsZFZINWt6blQ3WHZtS3ZKTFN2REMyUjhCLzk4?=
 =?utf-8?B?U2xhRjhjMEhjWFd2cFRhR0ZuY1NhZWhtTGN1UTFOdkVpNWYwSGJ1eHVDaXI5?=
 =?utf-8?B?bFdPWjkyWUFzcEgvdnIyMFdENTBMd0RlVlNXVSszOWhJQk9XdHZxa3pZSC9p?=
 =?utf-8?B?ZzAvc1k0dXA5RWVRS1IzZi9RYW1wa25hRDdONGxtb2NZOXRXdWdtTUVwaVJP?=
 =?utf-8?B?OW9PNUNzaC8zaWN2bVExaGJaeDFYRlpTMW1taWIzQi9NUS85WkpQMC9oYlJ6?=
 =?utf-8?B?b3RlVHJsdVgrbWZsZkdMaTBvWUhKY1NNMmVKYjFKR2wxUW5NYzNaSVZYUGE2?=
 =?utf-8?B?WTMxN2RlRFNsb1NRTXg5K1JNZS9PREE1SG1YVHhoVHozeGZRWXp4blpzelYy?=
 =?utf-8?B?bWFMZzUvUjYzWUdPWlVjTG1oL2cwN1VFb3o5V09KeXdNUW5Rb1FyemgzZkdY?=
 =?utf-8?B?VkJIQXFnaExhUDlOVzd4RlMxRzg0VEdNWjJTVkhzUisvRzZuYktxaEc2RlRj?=
 =?utf-8?B?aXg0TXB1eEIvTXA5dGlZTzZBYlZ6VTgrWUIwOXl3MFJKWE5qeTZsbTEza2Y1?=
 =?utf-8?B?QzJDSXhXNnpILzN3akJiQmxtbk05SDJJNTRxdW9wL0ZkWTE1cUEzMzRFSXhG?=
 =?utf-8?B?WlBsSndzZitsZEpVQklGOVRWSFNzZ2hkS1Z3MWZmemhFWlRRR3dsWXBQSlV6?=
 =?utf-8?B?ZDRPMkVEWXJCNmVjVDBid1RZUXhkMTR5RjVhZXFJQVpnMXpMUTF2dkxCZlJm?=
 =?utf-8?B?KzQ0dmM3UzhVTVNsS2N5aU5tU1ZGbUhMQkszS0tyQ2N1ZFlyREpvTnRkZUdR?=
 =?utf-8?B?eVZJNkdUWXBBMkE5V1EvbUVjTEtFVWZVRzZiYUd0TWxha0d2Y0NvWERMWjJD?=
 =?utf-8?B?R1FXclBYMEdFYmRnb2ZOc0twUk9NQmxReVI5NGZscFdaTmF1OTRieHZBQlpx?=
 =?utf-8?B?OGFBcUV2aU96SGRSd2IzNmJHWktOUW1rRFpjRFNwS0pmeG5UNnB4dU5UTGwr?=
 =?utf-8?B?NUJkTHVQMC9oMjdObUVTQ0ZKbjBwWUtBU3hFSENnSUJDbnE4azVNUldFNU1s?=
 =?utf-8?B?VHFlUEh5TWhRTWpXaDd0aEt1a3llQzg4OUUrMk1VN2ZBN1U2aEdvY0RIOThs?=
 =?utf-8?B?Z2g0dmhGRFVQZ2pzbStOY1JEVHgybHlzQXYySVgyd1RDOEdOLy9lMDNFVG56?=
 =?utf-8?B?ZzNPRjlYbjJFc2NidEoyd2w0R1hoL25tU3JIeDBJcXRPZG10UU8yT1EzZm93?=
 =?utf-8?B?b1JsVG9tdVBHbFVESGRoczBwQStDTDk5LzJiUDdvaFZyWTlTMURDaDc2dCtw?=
 =?utf-8?B?TllOVmJydjVaUnEzN1FYMTczUVVSakx6Z0x2ZEI5bVd2SUlSUnVSZmFrZDJQ?=
 =?utf-8?B?U3JFSlRsQnNKVklBTWhseVB4WSs4dHErSWxvcDVsSXFYbWtWVHIwSUE1NXdJ?=
 =?utf-8?B?dDhLSzRpYmdLNS90cThPNC85MisyZ0p4ZHhaOHprUkpyU1U2UWVybXJnNC9Q?=
 =?utf-8?Q?em6a314wtv767zHErCPvDpDBhIgUvQPOlDKs3/au2CTw4?=
X-MS-Exchange-AntiSpam-MessageData-1: LGzfC2k4azVYTw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e4246fd8-b109-4e54-8a7d-08df3fbd4665
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6413.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 06:30:27.4376
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JiryWbnMqBJigD7/jJ8T7sDXUZRoUPszWPjg4qPwq5dZ6zuEeL9eWnCALwppHulalJN4U+6Z9xerQSDQL/OBgg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AT6PR12MB026081

On Wed Nov 11, 2026 at 8:10 AM JST, Timur Tabi wrote:
> LibosParams and GspFwHeapParams are two types used to hold data and/or
> methods for calculating the heap sides that GSP-RM needs for booting.
> Although they technically represent distinct parts of the equations,
> they are always used together.
>
> A future change to this code will introduce runtime calculations based
> on values extracted from the GSP-RM, replacing the compile-time
> constants currently used.  Merging the two types in this commit keeps
> the current functionality while providing a foundation that simplifies
> future changes.
>
> For the same reason, the LIBOSx constants are replaced with variables.
>
> Signed-off-by: Timur Tabi <ttabi@nvidia.com>
> ---

The direction of this series looks good to me, but I think there's some
unnecessary churn from moving the functions from LibosParams now, rather
than switching over after adding the TLV values to GspFwHeapParams. What
about doing essentially patch #1 then patch #3 (which doesn't need the
zero dummy vals if #2 is removed) of this series, then a patch each for
switching over
- non-wpr heap + pmu reserved size (+drop hal functions)
- vGPU stuff
- WPR2 heap size

I tried this locally and it seems to remove a bunch of the churn.

WDYT?
