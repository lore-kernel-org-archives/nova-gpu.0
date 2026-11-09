Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.201.5
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794203272;
	b=UPGBiDiJofWJUAh3vOMD7EY2G/zanqhk4E94rRhdCbuh8OWmz7/PH2gLqubMIX7IUyle
	 6YOdDunA+ON/U5j7VkFIhw7BE8fljkNjKrmWtScfLrsyVlo2KlBdDZN/WCAKTQEYNXFwc
	 v5d3+cThQVqPcWeKFSQzSi5ZDLwidSel/u59464e8pIkTlid24kS5Dyo/mnR7bxnF7ofw
	 MfMT+L/anj+YhFu28ZyVedSzivKoxqDUfzAs4WRB8h2vqQ+I4k1gUcu2gziaTDPq12sdk
	 Tk6VFtf6ILIyDABn45xsff8HY3lnh/4UWxn3Y0Jzd5fkNwT5NzzpSbwe2s4abUZN74A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794203272;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:Cc:Subject:
	 From:To:X-Mailer:References:In-Reply-To:X-ClientProxiedBy:
	 MIME-Version:X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
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
	bh=YlzB2xF4T4uQIrXbnIZMkivPD+3QgUeK+cbf8od7hAQ=;
	b=Z3Zr4Qii2hqt2p5ddvTbuwXjL7tyjTQeyzqpaP7pmdJUn9Utall5krdolG2cD8Q03pDl
	 ZbyodxamJ1mbmP4rWOfKhuo7/2ejvG1IgTMGIvex2+h+Xqk8/r+yBJPDfbMTjssE8dLnG
	 4yAk/1XnXEOyfxvcUwKSBIa+K/aHE3E2MNhI/MJZR14WKQq0CkAHiHa3/FTHaKfhVPgXw
	 4vuy4Qf0EwQRVU2CAeVs7zhVPS0A2m6JLT3ExShCJO7WDWA1e/HaDgRf3EyrP79ojBAbm
	 caO3VluUl8h+HpzxS7dnPgFf7HwT1nL7/zVWNoF5rfEGVtq1n+s9jDNbxo1PzE5bAzg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b="t/dIV7CB";
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.201.5
Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010005.outbound.protection.outlook.com [52.101.201.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A638C606A321
	for <nova-gpu@lists.linux.dev>; Mon,  9 Nov 2026 05:47:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A638C606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=t/dIV7CB
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SpR3z2ztBPUUpFDt3rwGhyLxaBHjHM06eAGVKhytYsXl5w/9ooEMRL/xCjXseDb5eekpCqd0B70OIVlCIvIZqM0Ang1VlDiHOxnwsq7BETr9O9JG1lNOexOEi8WD//l5UGURFvA5zQwg7DL+ZGsYk+k8dHuongCpq9AZa3psvVGjuVXl1Ewm8qPdVKmigSkF3hKJy6FjLn0V00vaJ4YsOWjf2Wb3tsEb/60EFbmC9BNy+csyAiOh/27ype7FEIrL8N5USo8jz9f/rzDGfR2C5wm5uOTXuO6I7SCItoRpx32N63Lre5RAWM1pzd77yN5jllokj6ZS8AHLHKcwg61clg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YlzB2xF4T4uQIrXbnIZMkivPD+3QgUeK+cbf8od7hAQ=;
 b=tFICPDyPqSwipalZHTUGavd5ArriMIm3rH9HaxBnafOvpB1xOKXURO91OQpy2PiFBaBN1G0o2SACGPLYQ0fC1y6dkpEgiWu1lnRvJkzhsJV8yCKOWFkTfz/40541PQyH35/mrTohBJVkBwVve7YpZk6JYo3TzGw8am5ETOqH+jIY75YcPfaHhZ8msqMUQO2Q/byVgnYEzSj2mmaRZFNBBqMq6Hae9wa9/bUQ+eeDUPRzOFEw9AMLXaZVE/cOsnUGn7rKeweTSe9Sr3Et65XggIa5zCd86KIELxQJfmYvnO2MLdBHpkxfvX/NW/04+f44IVvYEjppmQbmCZ2xd8W2Sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YlzB2xF4T4uQIrXbnIZMkivPD+3QgUeK+cbf8od7hAQ=;
 b=t/dIV7CBvcdC5CCEgNFWjypsfdmdgtRFj0IOdaR+cW3qz5acVEmGbGEyZ3j4Ef3hhtUNiOKNfJBAa30JnWHzP63bIl0bWwfU4+qmO0v2YABeeQIrSwOqjhIMM7RW4X0fM7lPXCyhCEvsotpE//2GpkDX7LivpGCtobglN8s/FslX54pu9z/5gF68Z+1uxwOIaFUDDCVUC8Xfj1+NtVnPV45GC+DAqb0jPDpqsyezZPk+EhP9b9bspFlw+jQkAowp79oVT1074gqBsdbPrMFM4zZuURPm8eTaggQrLTzIYzuT8yMThUA5WXH5BZJ2hq4CjB6lqB8U2Uw9Pw27IcS13g==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6413.namprd12.prod.outlook.com (2603:10b6:8:ce::10) by
 CH3PR12MB8756.namprd12.prod.outlook.com (2603:10b6:610:17f::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.10; Mon, 9 Nov 2026 05:47:44 +0000
Received: from DS0PR12MB6413.namprd12.prod.outlook.com
 ([fe80::e82a:6673:4142:37fa]) by DS0PR12MB6413.namprd12.prod.outlook.com
 ([fe80::e82a:6673:4142:37fa%5]) with mapi id 15.21.0592.010; Mon, 9 Nov 2026
 05:47:43 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 09 Nov 2026 14:47:39 +0900
Message-Id: <DMQFZ2PXBRDH.1BWX38MCYHUE7@nvidia.com>
Cc: "John Hubbard" <jhubbard@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Eliot Courtney"
 <ecourtney@nvidia.com>, "Zhi Wang" <zhiw@nvidia.com>,
 <nova-gpu@lists.linux.dev>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 09/12] gpu: nova-core: falcon: allow DMEM DMA
 transfers to request tagging
From: "Eliot Courtney" <ecourtney@nvidia.com>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261107-r000-fw-v2-0-fb37cc5b20cd@nvidia.com>
 <20261107-r000-fw-v2-9-fb37cc5b20cd@nvidia.com>
In-Reply-To: <20261107-r000-fw-v2-9-fb37cc5b20cd@nvidia.com>
X-ClientProxiedBy: TY6P286CA0022.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:3b9::8) To DS0PR12MB6413.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: DS0PR12MB6413:EE_|CH3PR12MB8756:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c56fc61-7899-4c00-257f-08df3e24f954
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|10070799003|4143699003|11063799006|261022075727099003|261022115727099003|56012099006|261021121427099003|261102123227099003|18002099003|22082099003|6133799003|10067099003;
X-Microsoft-Antispam-Message-Info:
	4xdwhtZbhEljPcNLHNVASK3qsIw4ST/cSGerlgShcnnCALRhkMjGpSInih86hddVPYJXfdRjlgHKg0cy4Sd4BYq1JzDLQ0X9H23oiURda3SK8ssQHiHNFVou6h0nReM12ipzDVvtS4sKfWKz2eYmluqGz0z7KFLhxAEA76n9ej2teDo4aJxBjw3oOspfZpL6AGmA39+cRKi1expOPBSuDpx453mkK7DV72ZHWbN5XPb6y1P3/xgufaIuTafkmXVpKtM5Z/2+h0/prSVWS9IJuMOwSc55pHcmkxRD4PmiVqQhmPZgmLrtuMw2BJrJuO/lNu5Q18n0e1S/sE0lhQBqjx4TokhAR8qU/0krMZ54fZCac7Nu+VS2C9mcN4+EPaKHsgD1llKT0r9wMVDOrhrt0TgfVdFOFHm+taGqbUT0hC9CZ1FQhSgaMLP+/zS0x38SMu4KbcwkoE4/TbZ198sLhgY2s9qfkwMOKrJcnkovNg8I1FAHU7BXA5Be/oQh3+fYU8x1TAoIIiPNvdNowG2t599jFpGEWOvL0uWMG7WqkeuA36xSNZpr1jQxGusxTgO+bIU/ptt7ef+eVRrQMFTZGNTBk9DeLH1p+WdEl6zl/XejscOXkJxtV9V5gOUeiaUjvRdQ9BQuwS4hgGEeAdwjIktm45D7vK7Tt0isYBae/lE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB6413.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(10070799003)(4143699003)(11063799006)(261022075727099003)(261022115727099003)(56012099006)(261021121427099003)(261102123227099003)(18002099003)(22082099003)(6133799003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bFNwK0hodTlFSGczYW1hcFVIWEZaTGs5SVpiL0NHUUwyZHZyaGVKeVVWQ1Rv?=
 =?utf-8?B?K3V2dnNRRVZCNEh2MlhMMmMxdU9RUEhZeTE5SzFjcmhPN0VlM3NpamVQanpK?=
 =?utf-8?B?cmlQeFR0OWVJU1grVkR5NjVlNTVxUWRWT25MaUY5bWpYa0w5NmZjc3JKdU9u?=
 =?utf-8?B?M3dYaFJlMmwvVUIzVUlIRlNBSHI1RndpVGhtbW1BSGdNMVk0bVo3cm9rd1RR?=
 =?utf-8?B?UWxyTjNKa1RQNkQ3ak9RamxIUUxsTVU4THNiQnNxS0FCVmtPYmx1RGhqSThw?=
 =?utf-8?B?ZFNTTzlwREtwVXdUOERrK1dhZjJJa1lma1hZNGhnY0JYOUpVTVljZ3RTczNH?=
 =?utf-8?B?VTh6VlBCQUFFSTJFK296MklNY0dVcm1ESHJZVm8vNFNWUEQySDlRTnV3SDZI?=
 =?utf-8?B?UHVlMTc0cmZFWWFhNWxBdnRIR3F1UlcwajlNaHE1cE1vVStOZE1mMjgxcDlZ?=
 =?utf-8?B?eVYzYjVjMGZqU2Z4UWU1U3RnaG45Y09ZSnQ2anVqSGFoRnZoMmIzbENWSmpO?=
 =?utf-8?B?TTQybzVKTjRXdHJXL1hneWNycnlMUDdjbnJDbDgvT25KV0I5eUNHSktHV3VH?=
 =?utf-8?B?Z014UE1wejlYUTNSRC9VRUMreW0rZmhGM00zV2tIV2tCdnUxdGEwalAybThB?=
 =?utf-8?B?TW9heTQvY1R1aVpKR1ZIYVpTRUUxRENtN2JJS1RlbmtMM3grZXI3bTliTVJo?=
 =?utf-8?B?czVEcE1WMlNETHRsbFhvVWFKeHBUOTJYNW9WejI1WUw3M3BXUFFseWxYaGV4?=
 =?utf-8?B?QWFSY1dKZnY0cGpIYW10Y0p4aWx5WmpjQkZiSlgxZk1wd2tBS040M0Zqa1pv?=
 =?utf-8?B?VEI3S2cwdi9DWWNteTYxVjFVa3pXNFUzTkpqYk1oWjNzSlpCTE8rQ0dUa3Fk?=
 =?utf-8?B?UndieFREcGo2ak9SanlJdDVKYStBS2R1MTVSNzVodkExRnU1TWlGUFhFa2RU?=
 =?utf-8?B?dTBEaGF2Z0M5UlFNSGxXUng0cUxwNWZzR1h1VHd3RnR0cUVZd21DZng1bkc2?=
 =?utf-8?B?bHJvSU5JcHo3SmRzb1hhdjJTNTlYcmdjZ3lvc1c4WHVLOVJ6bVVoYVd3VFJM?=
 =?utf-8?B?dFRIdUNOK1NtWE1Rdm5USm1uQU1hTDFCNVU3MGp3YWJXdTNsbWs4eDlWa1pk?=
 =?utf-8?B?b0FjeDJRSlRZVXJoMVdWL1pUeUZIa3JlZEt1WDFwdm1rY0R4MmxEUEt2S25a?=
 =?utf-8?B?ZHhwTURLQ3Y4U01GQ2xzYThaOTdER3U1MmMrc2VTV1A3czRZV0NkVllPVzVD?=
 =?utf-8?B?QnAzWUhrZVdkejVKVjRMcVRxYU9sVllqUk8wTmFDS29iYng5MU5zbHFRbkdL?=
 =?utf-8?B?NkFGaGVoN1hQQjRQT29ndjcxSFJkR0ZBNmUyR2VycCtZSVh6Q0ZDN2I2bGdQ?=
 =?utf-8?B?cm45M2diUGdPSVRwd0ZscXZYWmlsbm51Q0tDQzRqN3hBdzkvZktWL1l0Y2U2?=
 =?utf-8?B?RHRtVllKZFoxbExkOXVhYjhwUUZtdENaUFBvdGJwNlh1d045S3RBUWZMLzJa?=
 =?utf-8?B?b2QzZ1VsaHYvakhMTEliRFZUQVJ3N0VkYVB5bVQrZ2xObDRtNGVtTzBSRG51?=
 =?utf-8?B?R21vamYrMVB3Rzc4SW05czlYVFV1ODNkNWMxSFovTEJWcDBGS0ZUV0U2TjRD?=
 =?utf-8?B?VVZxUk9pUmxFaENoc25rVE9UU2FhV29XK0N1NmRVREJHN0RYWWYzd2FpU3Nt?=
 =?utf-8?B?UXFweGlCMnhiNklOWTI0MVFpTENuOVdGQkxMdzhJL0RnbEdUMFpRT3k3ZHBx?=
 =?utf-8?B?a3ZLMVBOMFc5dVQ5K1RXL1VvdFpSZkxjbnd2NXpEczZYTEVmeG1oZmZpcXNC?=
 =?utf-8?B?czc5NTFEbEE3TWJSN210UGpvU2NUTkpUNTg5Znpmc3dPdEkxcEdQd015bFpC?=
 =?utf-8?B?VmtuM0RVTGd5NEVCeFRLSkNCTzU3UXBRM2ZTUUlXR2RoQ01wS0pBbnRCcW1B?=
 =?utf-8?B?dTNCSHRETEszWFltTDFWTndRblBTZHBDQ2w4WTBWWnBHTTh6S1NzcEtrUVRm?=
 =?utf-8?B?bzc0VTMwbzF4RlQyaTh5K3Y1WUduRVR6UG9ZSHZqUHlYQ1ZzZU02TTFtR1Fr?=
 =?utf-8?B?VXNUM3dNZi9UMDh0RTVnVkwrUVU3TlRBRjY2SWVPWUsrNlBpRktwMHZLTVRa?=
 =?utf-8?B?Zk51N0c5MHJGQkJhR20wR3FNMU12cWRtRWNkcDJ2UGZxVlRTeENRQTVpQ0JQ?=
 =?utf-8?B?REJtUkxFdDJ4eWE5NUZuZ245T0J5UFBrOS9tOGNuSkZGYlY3RmVaV3dJWHl0?=
 =?utf-8?B?SDkvYVduODFYMHBzWjZxeEtINHBLS2tDU3FWQU1PMDEvZ29rMXVzNVZjcnEx?=
 =?utf-8?B?YnM2NnFQTFdyOU1Rdjk4RXExSjFnblkyNXQ5MFUvTUxNenA0MTczeG9iZUNT?=
 =?utf-8?Q?P1N60SKqR9yt78pko4vTtwKcIpyatAdhfDQqgVrHSqhw0?=
X-MS-Exchange-AntiSpam-MessageData-1: CqbuLQU4R76yKA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c56fc61-7899-4c00-257f-08df3e24f954
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6413.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2026 05:47:43.4742
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uuVsxOaXHw8zwJVTJn8mmNzQeTOflyg00j2ONIG7BWSs0KgVoaMgFVMgnM9UEC/1Cub7bE9vBjyGy5WhA3QMGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8756

On Sat Nov 7, 2026 at 6:48 PM JST, Alexandre Courbot wrote:
> Add a tag flag to `FalconMem::Dmem` and set DMATRFCMD's DMTAG bit from
> it.
>
> Similarly to IMEM, when tagging is requested the DMA engine tags each
> DMEM block it writes with the block's source offset, which the loaded
> image then uses as its DMEM virtual address. The r000 load-and-execute
> HS binary event will provide a DMEM virtual address for images that
> need one.
>
> No functional change intended.
>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> ---

Reviewed-by: Eliot Courtney <ecourtney@nvidia.com>

