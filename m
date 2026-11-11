Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.46.32
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794408247;
	b=NeWHIN08BoXBUnmbbzfik0Amnw0WD6a2XmwHrB3yS0y8jkHPrmvbFcp+66yDT0oGuBBc
	 2TpbOmb0i5Wpf9uyN0mRRbh2vYK4ydCLkaaMSH2LdDgior1ffdoxi9Rbcqtpii3E0Edge
	 Qd7BnbIcUMcZiKUCqV4C/2VXcArmFu9VR+1um4uecQ72UjN3nMCL0z7Kf8jjKBYu4Zqfd
	 K3y0Cfac3ONUChSr2hUPhmfLyiNJ7uXHw7K6Y1EigQtPkG9IID5c+phLZBMEVe8ZGRaFW
	 8fZPCbz1UmbKVuYouvHfQioGwmqozy7f/M1iTkPNIKxgoLQQ6C6yFtRWJDMcKupIjxA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794408247;
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
	bh=b5WgpDLR+syWnxL2NGPguulS12tSuYnGQp3CY6he0lo=;
	b=reFK+oF+EVhMf6m2heQQDMx1OTCVIQPxUU2EEy1rHvp7c8oUsKkKGjDKnObwlVdzqMw1
	 xLiMKH11bQqe9LA97mFTTUSE6BPEeE7wkIVtwwsICy2goULXPPsKS3RZPjZwiXeG5oTW/
	 nV0bwwNh6ZdBkiDLb5xYjKGlk6385AtC65VGaOqEk0v//4J6KEBRBeUiSJwqC4PM8TcFL
	 Vs6R7NgFk0TN1febMhaC+1R28YRs1gVAdJL+971Z5IWK2Y3rO2oqP/HKBTrZp3rH53Avp
	 9WCRAMbvBZ2JXE7CkVPIqTLTbtAxcfQAnx50QPRObooZy0DoHoy323LsQB8Q5fTqKRw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=rjybC9b1;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.46.32
Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010032.outbound.protection.outlook.com [52.101.46.32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAB26606A321
	for <nova-gpu@lists.linux.dev>; Wed, 11 Nov 2026 14:44:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DAB26606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=rjybC9b1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SRJSW57xUlmFUWGSFlpcLWBG/n05weUVI+LKB9n6sA6yShqEY9wHEgtrBtuFoQCpBz2OxxUbp9fdOY0BAXLNQyNWhNDb0aC1ekAXoxscGoKjKKCICDncAS0mLTQgeggLUa5IlTm9+c4WZJIArrWOvOFaKrkYxZpgMtuWtOjhXIxSxep4xTKVjKqX5ByMYawyDcPelitNzysOi3rzXaKKg8D52v6jTc0lGRbYLrcvaM4Ay/nrRCIRZWmanLhQVsArRD1TBEpHBw5y27QTQVGDGhzrYyomlwVCXaEhOsQKw+eX8xGmzt8nBzhwocYN7msQQqbzokEKcqVMY8ipiCyDyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b5WgpDLR+syWnxL2NGPguulS12tSuYnGQp3CY6he0lo=;
 b=jGnw8sbfmO5fdHqnaV3Joya7SzKyv99f1Ifh6OUYpoBvxq/5MGo+apnGVeU+9Nx40TTNv8eX+P7XPTUjELOemo1HNJZ4WZcyCCoJlMJ164pnBJXIYQmd04uJ3d4lPhfMV7PcrP2XC+GFw/XYBCNMst3GB80sLxQFieK+f9BfrAcMOao5mxVbeReP6nuaqy3vhF5IvwKyurR2K0vwzqxmvVdDswXctbBfOsu/ODSxyYVlH1KXNi74zZUAVUth/vAtL9B5iHgOEO77D/W+viphAI8uO71uM1wY1f3Sxpda2luxhP+ITiIIt5vuUDoa0GKmPTRqL9X+mtpb7hwBnM+AeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b5WgpDLR+syWnxL2NGPguulS12tSuYnGQp3CY6he0lo=;
 b=rjybC9b1uhdV53O+RUUu1oIvR8B/G2jiu64EK3tXYT9IiYrq+1UecWLEI9RYg6sQLLkh99Tt2H8XSc3Nzf307svfo3aXrsqdnYeVCk+1AgHtSWDT2+0d7owvEonnMH0mDNBRGdXmTAUPCIA08bnxwVDCkY6wjQ+n+rrBJ40Y6EW1SkLWOVPp8FovLpNi/NeVYJr+PuPhEOTiKgX09zSehtc4EalFaGrPF+GaU80s8auENnxYkroazJOL83kviYSCi2Hulr2yt8dJVWN0zHPVaxRmCmQFYj6pz8ICeAjCJgFCL9/3U2lPjBzDuDLeiBhqGnx8iErKvr2mi0Q4Mg0t1A==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MW4PR12MB6873.namprd12.prod.outlook.com (2603:10b6:303:20c::17)
 by MW5PR12MB5651.namprd12.prod.outlook.com (2603:10b6:303:19f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Wed, 11 Nov
 2026 14:44:03 +0000
Received: from MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1]) by MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1%5]) with mapi id 15.21.0592.010; Wed, 11 Nov 2026
 14:44:03 +0000
Content-Type: text/plain; charset=UTF-8
Date: Wed, 11 Nov 2026 23:43:58 +0900
Message-Id: <DMSGMSTFI1SV.136MRMDX1YXLN@nvidia.com>
Cc: "Danilo Krummrich" <dakr@kernel.org>, "Alice Ryhl"
 <aliceryhl@google.com>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, "John Hubbard" <jhubbard@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 <nova-gpu@lists.linux.dev>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/2] gpu: nova-core: gsp: cmdq: wrap the sequence number
 on overflow
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Eliot Courtney" <ecourtney@nvidia.com>
Content-Transfer-Encoding: quoted-printable
References: <20261111-msgq-64-pages-v1-0-d8c56b6fdd6c@nvidia.com>
 <20261111-msgq-64-pages-v1-1-d8c56b6fdd6c@nvidia.com>
In-Reply-To: <20261111-msgq-64-pages-v1-1-d8c56b6fdd6c@nvidia.com>
X-ClientProxiedBy: TY4P301CA0112.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:37b::7) To MW4PR12MB6873.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MW4PR12MB6873:EE_|MW5PR12MB5651:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e602954-f2fd-4c4f-4f53-08df40023a71
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|10070799003|10067099003|11063799006|4143699003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	eJM8DFRI+suki+R2xH5hHb9t5mCB41h8E5JeTID4LiNR+pF9n0lRY+9BojLMo7HfGvfOEaYO1rPSSmmVDBnpC8YlbBxXp/fowAe/IcsqcWCpCot2UPzNAM69pBbWivACKYmPmkHpiuYYrvsKh6NcnRJMulGzozpbv7RIeacYr2aH4n+odoyInspfKk/RlSJJu79YWPraAzGh3pUWS0QQo+7dadJEbkMznFT42OAYFh339oCxGbvTyJh3Ufn+f2E1PCFqa7dELbFlDvIpkzE+dIXgFnLLnyshSfE5am6pMW9lF5oAp+N7VKRqGv/2VI56ReVa/CqoSIZdip5ehubJ2tH4PwazmnSZpjCuAFWQ7UgCjvq6g3EBErosuyuRteiboTmy7g8AgWA7K79J1tzi4ZtvLQyZZLxxTlvNfiroMzXCTZH34P2BzFmxTWp+1iIoAHr56hre1MiHevRt/NQ7eal8x0rnU+IqdVL1q3GdVFTOeIgh/tGTUyL73yZfqHq/6jrprQjj1xyY1xmhjRqNUzm2iAH+TX/4ehTqt1o9HVcaiWTy/AyweOk4O5jF5DctlpN/dXa3rmAyVU0KnNPPZA8VdBRYFtrHyn6FlT0oC3A8Pr3S5PrByrIH+Ru19k3dcfXJeuDGPMynzTJN5zJhoPm1o+ZyXgcNatozd6osx/s=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR12MB6873.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(10070799003)(10067099003)(11063799006)(4143699003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U1NxWm5FZEJEUUFPdlgreFNHZUkyZjlFRWYyR1pPZ2ZjWHFlYmlZd1N2ZEdS?=
 =?utf-8?B?RWh3THZBREdlRTB3ZXgwaEtvWXhQVWhndWhPU1BUNVA4Rkl5a0ovTXZLQmhl?=
 =?utf-8?B?TnJHbnZqVDIwSjd3cEtSQUNaWTJCQS9PdU5ndmpFZWtiRWVZVVhhMml6K3Jr?=
 =?utf-8?B?NmUzNTRBbmZVbDZLNHdhcjlGMEp0QUI5a01Idk9zR1p0SkNkRWVhK3l4aEdU?=
 =?utf-8?B?RmFNS09WbzRWWnhLWU5KRVkreWVYNWE2dzZ2bFp2V05rNDdrUFRWSEpUUi9q?=
 =?utf-8?B?VGlEZlVTbVFzUjI0MFBmMVJBT2FnQ2wrUGJOTlhpZ28ycEl4U0FYQVJlOWMw?=
 =?utf-8?B?TXI1Um0yOHNBOTZ5ZnpFb2pzSTkzWEcrMVp5VGgzU09MVWJ1S0plWnE3dU8x?=
 =?utf-8?B?WVdVNVZnZCt0RXRueUM1VUFIcjFYVFJsR3U3MDNMZ05hYVp6KzNDZjFYcHpL?=
 =?utf-8?B?TmlVMlBHa2tXa3JzZ1kybFRZaTY3WWRMZHFKVWhTRTB5RWk0cjFQbXUwOXNl?=
 =?utf-8?B?aUpCcW00TTJPY0h0Nm0xQlJqZkFiSDZJQjlITkozUUs4ZGdNMXQyei9aM3VO?=
 =?utf-8?B?WTJXdGlub09mV3l2ZjZwaXZ6ckRYUWVxbzQ2b1M3YUNWRXZqajVjL2lrdVIy?=
 =?utf-8?B?OVRNdXNXQTQ0ZWFGY0hnY0Z6bjhza2p2L2pwU0dWSlBsdk9mUDQyMmJkZTJJ?=
 =?utf-8?B?bzBGNnVjblU1QnhEVXVEdDhmRkN6eXZTSk5wYVJiQnp1bXl5Vk1sTjREemg3?=
 =?utf-8?B?cWNmTGxHa0s5YXpHM1d2YjZoa29KMklvaFZSQXlPUjRQbkc0bFJPMFdmbjhi?=
 =?utf-8?B?ZGg3V0lPeE9YTEFUZmFtQko3NlpBTCs0QS9abGpwTWs0V3JwcTlPWmY5NTZH?=
 =?utf-8?B?aWJ0aDk5Vktnd0R2ZEdXOHlKYktOZmxPeG1pcnVPQjU1emlZZkd1a0ZiWklT?=
 =?utf-8?B?OHRlK1RhcElDYmM3SkpCYmxtbGpCc25oSDcrSTlITmV3czJDZjZFb2s0cDQ1?=
 =?utf-8?B?Um5qWFU5UjQvUHhxVUFGcFl3RlpKdXJFQUxvV0o4RXB0Vm0rOUIwc1VOdHhZ?=
 =?utf-8?B?Z1FNZ1gvUDZFWFpWb2xjRnJtdFhRcGo5NGpXd05hT1E2ZFB0ZU5oV3lYYW5G?=
 =?utf-8?B?VTJuemdGd1ArVXdSMmYzUFdDYmcwVHM0S0hFazdmTGlPVG5GK05ON3l5VHht?=
 =?utf-8?B?Uk91dURpZVVTOUIyRVQ5Qm8rNVpEOEFGNHpTNzBHcVhjZ3JHMGNuTlpFYUdC?=
 =?utf-8?B?U2U5c2tWbkZOVzNKRHRVeWVEVTZkS1cxam1PWGNpSGc5Tzh3Q0R3TWtYRFNO?=
 =?utf-8?B?dTVlbW80VFNra3M4UkZVWVhsOVFYeE12SllQdnJ6MWZ5NWhiVVYrTGx5MmxF?=
 =?utf-8?B?dkRNZVdaMXVSOWdUT2N1U0tHdjdvc0ZmcVRFTWl1L3lZRUwrYlE5ZEhBWlN6?=
 =?utf-8?B?YlVuNFlrTmxtQ082TzVLQlg0TjBvQmxPRFBWc3EzdjRsR0NYaW83QkZPUCtq?=
 =?utf-8?B?YTVHei9uMTVpYmN6bytkeTBTRThMbWpUeHV5WFdyTnJVMEM1dG15cUtCTnRC?=
 =?utf-8?B?Y0Z0TDdhVWtPMm9icHVTQWJ1ZUZwSXVGQmR0ODdWL2ZWUGxPYU5OaW9ZZ09u?=
 =?utf-8?B?bHZrWkFlbVk5UzBEeHJtakEwbm9XbW5zVGg5WnZoS3VlRVk3UlAvbWZNYzBH?=
 =?utf-8?B?Y3JFMVp4M0xyV0JwanZYWitjbFR2WlQ4T3EzcHZYQjE4cnY2eTdUSTFHbGE0?=
 =?utf-8?B?TWlLMy82dlR4SHdHaHoweEpYaVcrQ2lZSDZtcGtBN2R1TjkrNVdnUkdqVlBQ?=
 =?utf-8?B?YkRVMDhJVHdjTlpvNWh6S0NiMkVtYnpWSEdidmZCeHpSc0pmWFhuUEQxQ3NE?=
 =?utf-8?B?TkxUTmoyNTQxRTNWcFlORGtDWmN0WGx3SVNjRjcyenQyRXk0ajFlZEg5b1NZ?=
 =?utf-8?B?SFliNHdmYUlydGJ2U2tNc1hnZEZUeGdHNzNXVWJERjBHdFNGTDEzSDZPbCth?=
 =?utf-8?B?S0l4K0pQVTh3Y3VZdjZTYnFSWTY1eUY2aFN1aWxndzFDYm1jTlR0U0wveFEr?=
 =?utf-8?B?SkVWUlc2RXRuSDVPUkRBbUtpSStkNURZWWE5UE9mUWpOS29jaExXWnA0UkxP?=
 =?utf-8?B?eXhKMkNoMCtadVBvelhCbDlab2FkelBFVnBjQkRuWEszdm53K2cyRlFjL0pM?=
 =?utf-8?B?U0dLSlRJOXlEeFdybm5ad0JhNmJWM2ZRVUpKT3k0aStmaHUxS3lWbkRuZGR4?=
 =?utf-8?B?THJ4Y1hwKy9HcFB4bm0yMG44eDduRmVmNlkvdVNTZ1BwV1B2SFZvdHNTN2RV?=
 =?utf-8?B?SzBEYmtHT1V2VnpncVN6N1FuQUZtSFdLWnh1U2FMbVYzNFo0b09oTjY0VUo3?=
 =?utf-8?Q?keq9V3UjlYKeCIQfcGCpJRLQ02y89rlVF2cZ+/0+4eA/U?=
X-MS-Exchange-AntiSpam-MessageData-1: oB7Q1oUQcZrppA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e602954-f2fd-4c4f-4f53-08df40023a71
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB6873.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 14:44:02.9306
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C5QP/xirSnZG7p1qrsilhXJWyWYjw/YKJuElOzXGp1jfoSGHmfcF/IdjSyd0tGVrtox0tUjWgUnpU8Af4pcHAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR12MB5651

On Wed Nov 11, 2026 at 10:37 AM JST, Eliot Courtney wrote:
> The sequence number can (eventually) overflow, in which case we should
> just wrap it around.
>
> Fixes: 75f6b1de8133 ("gpu: nova-core: gsp: Add GSP command queue bindings=
 and handling")
> Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>

Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
