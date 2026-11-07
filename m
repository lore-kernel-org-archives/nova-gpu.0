Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.56.36
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794044933;
	b=EdqPOB20JBJeLpXz4DMaDqtHnxzL68TsoV2QiFVSXB6OLUGeB/3qgToCfnHec64T6/s1
	 ud+uIJUe02RIbYz+SdhWeIhop3lHk3QUn52E7FfpxvN61E7kAhiP7poqQnj1ppLJ49ijF
	 /wSqWgqJOXozUtADsk3JdnhsUHU6RpcuoLk4Xgf4nUuexQ5KrCgbBQVWtvStBttYkJB48
	 uVq3KqLzlPRI1hAcFIT9+rOrz0K8xFfpPYMPEhbheUKhXyEY8Bq7zF1+TM8Nu2u65IvYj
	 zQZkia3hezavl5h5VIFH+HqrBa5VHMeDrCPq/Vp+/3WkQESQSRkrpZ+kZuhADg8paAQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794044933;
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
	bh=bcfbvQ8gB9SF4XC3Hej+2/giBomibcyqnyLps+IyRxE=;
	b=IdyWcxkttT9i/hKu0IRqtq8N/vGwa8CwjZaIe0GEPZKsrJ6OvOVAXXRfAEGHFTwIJ54+
	 2S93fZWoIWsSQA053Ls6LwmhPaxcixDeswNAbRxYSkBFoNr6quywaSC1wQ47soC3mt+KX
	 p/s3X7XOQcJwGfz6CGPG3tKpK8zRVUFlkVsVjKv+lWQsnQeGLoocWTlxH5Cm0NIq9j6Ff
	 IlxOe7HOyw0E98ePN1PyeetKStBG28fWUQPvmC4yqvkkm+Mt78901YybTVqHXnTe/eSYP
	 ENGF5Z9T4thLOGkImVkfO6sCDYJsYOT3VtBc4J446oFuWn4NRTEM+x5dzIe9NWDHpCA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=BCa8+cd3;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.56.36
Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010036.outbound.protection.outlook.com [52.101.56.36])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F124606EE8A
	for <nova-gpu@lists.linux.dev>; Sat,  7 Nov 2026 09:48:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3F124606EE8A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=BCa8+cd3
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oZEsb1NqIz1ykOquYhGghiGiEXzf+3UhrJNrNb1VDvTaJYA9Co/Rs1J1DejXqmKRAnJC8laxjEzXLL2wEPCHh8wD9QfbiuUOEAbtP3Y7X05yCeSTsHmcwgdJYYQPIUlSic1kgrFGxeYE9koTWPlmCkjqOXreHlYhgXyz2nNlwfR5qf+1t4wNSfgcM4HOf2r52yX0ht0rqNA1RDiEzN9oOjuVptkWt+QjQf3U5xyoOr1HzUWK9uCiQndDFbqUOc40/wLjw1LIYMTZQkt5qwUx4RLGE2yu4LhZOUO5jvX8n1FuC+yI2ORt2pQeX+UPL95nNIbA9os4X8Bd97Zr2g31tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bcfbvQ8gB9SF4XC3Hej+2/giBomibcyqnyLps+IyRxE=;
 b=NXd0Sh8lHUDKPHrNNad7V4qdbPqdVcLYGCF5lVd+86VsfbuRJptiZRFfSds7Q339B8LaCIDuJ5LPRqzVG/BiyLHCNWaiAcFTB7yWgs6CQTsUjGsYN0cKgjM29wamS6ymSw7wP5f+upmEJ//zyAQWzEIDj8rS2bVfKumod06xwMnl/GL19Z4KRgygt6pEZ1vYfUNUjStSDXoQEOkY/3ab+jF+0sqyterQfTnAuUbupxb+om4ZB6b+PJsCZT7lmGgybUCZM2s2Bo2j4BtxFGoDfR1NtxaK/7AvitYwPUeOyE1lZLOEy+WQyvR3U21A/KFUn7TB5K5i+YNJdW4S75BXDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bcfbvQ8gB9SF4XC3Hej+2/giBomibcyqnyLps+IyRxE=;
 b=BCa8+cd3bUZuoEheLAAf1+UXtdMBzfD5qQmt/xEj0PQSBBZgYWMuiCBf4JKl97VOS6QXVksSbSrRyQmiv/Vb4QbtqVkEKTgUwJQV8DkcbDuuuP1ZQCTbcpB2gj2S5ihI5rzT+NZDByQ8Q+7jxauh95AlEzr9eqEZVZkcfbNVeoLTMFtSf8finifXBWJlU2uNsYYXDWaJLUuDw6HZ/OY9q9Vq1Q8T3FDbA26Wb+lDsgb81xTLDTrW4mEYP477QcG4oJTs3M13WlMbgYw1yMfDt9pUSKnmQBeSLROcU95C2DAy5mNyg7CuaxnebE0sEPBaoJbacSwa6r8Uwa6Mzycz6w==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MW4PR12MB6873.namprd12.prod.outlook.com (2603:10b6:303:20c::17)
 by DS0PR12MB8269.namprd12.prod.outlook.com (2603:10b6:8:fd::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.11; Sat, 7 Nov
 2026 09:48:20 +0000
Received: from MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1]) by MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1%5]) with mapi id 15.21.0592.007; Sat, 7 Nov 2026
 09:48:18 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Subject: [PATCH v2 00/12] gpu: nova-core: generic bootloader and falcon DMA
 changes for r000
Date: Sat, 07 Nov 2026 18:47:56 +0900
Message-Id: <20261107-r000-fw-v2-0-fb37cc5b20cd@nvidia.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/2WNQQ6CMBBFr0Jmbc2UMYiuvIdhUdpBxkQgLVYN4
 e62uHT5kvffXyCwFw5wLhbwHCXIOCQodwXY3gw3VuISQ4llpTWS8oioupfCunZ0MtWB2iMke/L
 cyXsrXZsfh2d7ZzvneTZ6CfPoP9tV1Nn7r0atUDE5qjurCZkuQxQnZm/HBzTrun4B8wW67LEAA
 AA=
X-Change-ID: 20261103-r000-fw-088d39a643b7
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: John Hubbard <jhubbard@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Eliot Courtney <ecourtney@nvidia.com>, Zhi Wang <zhiw@nvidia.com>, 
 nova-gpu@lists.linux.dev, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>, 
 Daniel Almeida <daniel.almeida@collabora.com>, Gary Guo <gary@garyguo.net>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: OS3P286CA0043.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:1f5::11) To MW4PR12MB6873.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MW4PR12MB6873:EE_|DS0PR12MB8269:EE_
X-MS-Office365-Filtering-Correlation-Id: 9dd34320-2731-42d2-0603-08df3cb440c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|10070799003|376014|23010399003|18002099003|10067099003|6133799003|3023799007|261022105027099003|11063799006|261026140227099003|261026121527099003|261028144727099003|261102130727099003|261102123227099003|261021123027099003|56012099006|261021121427099003|261022075727099003|261022115727099003|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	i8kXJZtzUO56iD+2/Mi0LyeMq0bMa9nJ1AABsBgPX7anwa7tw0m0UV6LiihVLIZCO/2zUtniwgJwfrrMsD1rgTHCsOBc9/LffhBretNYmqaAqYr8ZQ4b4BTCE/vtJnjj/aNUEJ4Mzan5u47kY4c15Mt63ap7OKT0/KuxzCLFE/OzfkKtVu3E4Q1apmWPciYnT1oruv6g+FdZauftaMrZOf+fHNXWQC2JJ2eRkfzDoGX6mK9XaRuR6BHdnpLOS27dIeApQ305zAeueNsZg1ALUMJe7z3SemwREqUwtRMJvYK9Vrs+0M0KKbtj5RXgM+BiQG0lcPfWQZ9Tryvbg8XuqJz+G6/zk1KOaRXB7+9SziEeDnDXDGnmPDM8msdxYXVn9j+TmQyI+ko9GmkjL8idHCmR1NlY4Ew1c9tmUL0EmnZ58W9/aoZsDsO+IqshGgyULqYGgaaEJ4OMmoXuZx8Rp8IX0tnBq7l7ICKwZvwRo6b7v3D/nhiI2rfHo1aptxFVHX4Bre2thkTl1jpsFWUiGYY16hI8hx7Wrh/PSXb0q/vPNwlLxUtlXbQy5bvomzvZC0m4FsIJ5tZrHxhIj85LczGolz5Qzq/0gY11Rr3RQYJW984T40erLy5VDsBZYWhiwqPI/Wjv1iiR8XRqppRuOOGEDJiox2WZXbEkIK0A5PQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR12MB6873.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(10070799003)(376014)(23010399003)(18002099003)(10067099003)(6133799003)(3023799007)(261022105027099003)(11063799006)(261026140227099003)(261026121527099003)(261028144727099003)(261102130727099003)(261102123227099003)(261021123027099003)(56012099006)(261021121427099003)(261022075727099003)(261022115727099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Qi84M2xDdWZ0aGR0d2s0L0RlMUIrbnMwbVhsclQ2OEFVZXpDVVVnakMwa2hl?=
 =?utf-8?B?VVY5UHlKbGk3T3lWY3NWWU1SNWc2bzBDMDRRTmlvSmtWbS93NHJ5bXRqdlhs?=
 =?utf-8?B?cjhwN1RwNmpVeDFlYWRXR1IwazNPQld2c3kzVCttWnpXN2F5V3R0aWQycWNk?=
 =?utf-8?B?eXNIVkp1WTk4UHZTeWlZOEx1VFlMajdHaHhwZXdteDlGb0t2SVJNcUxrcUpS?=
 =?utf-8?B?SHdnVnd5aHVSMVZDdzg5ZUloM2MzRXhkVVRsNGFHaUI4UElFM09senpYTDQ3?=
 =?utf-8?B?ZDAvOERFRGIzbWM1VndpdFNrbUtOenNqY2FWNk8wdmxBdS85Ty8zUzFja0J1?=
 =?utf-8?B?RllFSmp5bXRDbWJiTUM5TzBTb21aNTNXMXpGV2JOQ1VZRFRxVDRtcWhIUnk2?=
 =?utf-8?B?Zy9hQXNMYkFGV25TZFZYaURjdmFVQXhPZG9DOWRicGNkajZwREZUTlRmSThQ?=
 =?utf-8?B?dlV0cDRsWFByRjNCTWh0ZUpSR0pnb1F5ZlI1VTdyZWJtTXFmQjFjWVZJd0RL?=
 =?utf-8?B?QU9JREdVWldhVDVIV1h6SlgrZDhUWS96ZUNVcGxZRVBiVDI4cDhGcnZDek1C?=
 =?utf-8?B?bkNzMDlhT2JrdU1hV085MEJPaEMxS1ZvZHJBQ1FlQ1kwZUh4RWtjY2Uva3Y3?=
 =?utf-8?B?MDlCTUozMmR6V3BYYlNZNnJwcXpsR2JKcDJhM3pTN3VDNk1YZXNqQm1Ga2th?=
 =?utf-8?B?a09UTHRMTGdiYnF5UzNiak8vTzhsK3NJNGxweXlRN3ZuQmtVbG9UM3dwZENx?=
 =?utf-8?B?Z0crdTljaDhYZG1zNVhjM2RTRFkrZEtsYUxPeWUyOFdYek5vT3JtMGxmVVVK?=
 =?utf-8?B?VlhaN2Z3Y1Npa1NsVE83SlZwYm5GMlRoSnhrTmZybmtmRzhlUlU3THROZmN1?=
 =?utf-8?B?elpKYTNrcm5WN1QxZGtNK1M1Y1RpSzJtR2ZKLzN5Sk9pc3FrYjdxdnFPWTMz?=
 =?utf-8?B?MVRMQmc2elY3alhaR295am9ZbDBjUDVGbWRsalNITU15TFRDZVNnYzdtckt2?=
 =?utf-8?B?T25hNW5jd0g4ZEc1TWgrb3lBMU5BL3JKOG1ob2tGbFdZRjZqcTZucFNFYldE?=
 =?utf-8?B?VWVFR0J3bFoxQVUxNGdkK2R6dWJST0toeURQeklxTE5Ra3lSWFpZNzZxeGhn?=
 =?utf-8?B?NnpGUmhUUFh3c1paT2RxRDNKeEY0cGs1SW9CTUxTQkNBZ2ZoTk1zUHVtUEtC?=
 =?utf-8?B?ZXM0ODlEbnltNEhPZDJ1ZDRsMXc0a1d6aUJiWDJTaHdCWkVvMjVnRG53QklH?=
 =?utf-8?B?QlJXbnVaS1JrdWYzQVNyaENOU2ZLeWpiZmNMb0NramZLUDFyNTN2aDBKOU51?=
 =?utf-8?B?MDRTRHQ5RWZENDBrYUwxYWxWbjdkRk95eXUvbHVTcVZ4b1l1VVhiNXVFUlZJ?=
 =?utf-8?B?UVBkcjdpS0hnazdOVnNPSnVxbkUyRGl3azB2STJuejNFbXdPVWowRjNxZ0RC?=
 =?utf-8?B?bmFQcWhaRWRIU2hRcXVBaElXd3E1R0wxQlBvMWZnZExkaGV3b3pWSVNleDYx?=
 =?utf-8?B?cTErRGovbjFaOWNNcDhCdnVBVEE4Ym16R1g2RGlmNFJFR2xnK0MxQ1dKZVdt?=
 =?utf-8?B?WHF6T0ovY3MrQ0NRdEh4ZlNxdXU5eHRTcjBvbG40RVVNZ3NyMVN4ekdmQ0x6?=
 =?utf-8?B?RVJ6MThnbzFRWmhCT01IZWVKOVg2d2s0THNDWE5lYmdrVnVwODE1b2YrTyt2?=
 =?utf-8?B?MDhtazh6bUg3Ymo4dGdvTEhDUlhSb3BZWjZTb2l3U0p1blJWV0pSdHJESHJT?=
 =?utf-8?B?YWpSVWZ1S1NVeHRZVmVtN3gxbGhCRXNqcUpCczcxUSt5N0wwNW03aVBHRHhk?=
 =?utf-8?B?cnNKaXEwc0hMbm5PeE8zTjcveXB4TkJGTkVsZ0hjdEMrS292THpqZG42b1V2?=
 =?utf-8?B?eWk3ZVByRFNLQjBWK1VJaU1GWThxMklwZERjbHQ4a3l4WU9sU21YNXA2T3Y1?=
 =?utf-8?B?WDAraVhvbzk5S3o4bzA4ZER4STlRbFZ1WTdKZE9NWXdRMGc2K25MYUhvSkhy?=
 =?utf-8?B?VmhwUDFmZHdYS241MW16aUpnYUdCdHdTMXROL1JXZEQ4N2hRbnhYTGlxWVpZ?=
 =?utf-8?B?VGFhSG9pZU5odE9kWmxVelRUeG9JNklkNDhOU1NEdmFUaDkwK3hrdEVVNzZE?=
 =?utf-8?B?V3VzNjhVT3pLUklyNXdoa0wzNGdBb1BnNy9LNHZiS0ZCcWthSHg4ZURrck02?=
 =?utf-8?B?SHpjQ29FcXJsRHJ2ZVdBdFhtdEVVVnBRcEI5QzZqakZ5bHJGMmEyWVRsNitT?=
 =?utf-8?B?dC9KaWRUbUd4YXh5S0IzdElIRE5rVTZaSmlzdXMrZm0xNzdSeVBWZitIRWJU?=
 =?utf-8?B?Z3R2WFJtT3B4Wis1MUh0dE1sUzJUdnRHRmMrV2FQVEpaajR6RDcxRlZaVkZq?=
 =?utf-8?Q?KsQuTzBzCeWnbWAZvPkl707g6wut5UT6i+3ZFHLfXW6yo?=
X-MS-Exchange-AntiSpam-MessageData-1: u+vmTAI0oGug6g==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9dd34320-2731-42d2-0603-08df3cb440c4
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB6873.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2026 09:48:18.9466
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: waMMQZ6ncunyzYZyWGU5U9EAg12kbZLqmSdzYP7dHP2hV1ZDUq3W3gaozqb94J5Exs/W24Uow8sdIXOIzPYd2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8269

This series contains patches 13, 14, 16 and 17 from John's r000 series
v3 [1], that prepare the generic falcon bootloader and the falcon DMA
code for the r000 boot protocol. They are submitted separately as they
do not depend on the command queue work, and are valuable on their own.
A few preparatory patches are also introduced to smoothen the
transition.

Patches 1 to 7 make the generic bootloader its own type, usable with any
DMEM descriptor and not just FWSEC's, and place it at the top of IMEM as
reported by the HWCFG register instead of assuming a 64 KiB IMEM. Patch
6 is a bit of an outlier as it allows register array locations to be
copied, in order to simplify patch 7 which makes sure the generic
bootloader can be used with the r000 boot protocol.

Patches 9 to 11 let falcon DMA transfers read from a framebuffer address
and tag DMEM blocks, and check the per-block offsets for overflow. These
three are extracted from a single commit into their own patches.

Apart from the bootloader placement, no functional change is introduced
by this series. The new DMA capabilities remain unused until the r000
load-and-execute handlers land.

Based on `drm-rust-next`, tested with TU106 and GA107 using both the
570.144 and 615.71.09 firmware images.

[1] https://lore.kernel.org/20260918010719.1176945-1-jhubbard@nvidia.com

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
Changes in v2:
- Remove `Assisted-by: LLM` tags.
- Widen the `IMEMC::offs` field to 24 bits to be able to load the
  bootloader even if IMEM is larger than 64KB. (Eliot)
- Accept unbound `Device` to create the generic bootloader. (Eliot)
- Fix documentation for GenericBootloader::new and FwsecFirmwareWithBl::new. (Eliot)
- Program `FBIF_TRANSCFG` from `GenericBootloader::run`. (Eliot)
- Bring `with_fbif_transcfg()` from the later r000 patches.
- Use the source offset as tag for tagged DMEM transfers. (Eliot,
  Sashiko)
- Set the `DMTAG` attribute from `with_falcon_mem`. (Eliot)
- Program the FBIF_TRANSCFG register in dma_wr. (Eliot)
- Link to v1: https://patch.msgid.link/20261103-r000-fw-v1-0-e3d38fc130e3@nvidia.com

Changes since John's v3:
- Split the IMEM placement change out of the bootloader extraction.
- Keep the DMEM descriptor fields private behind a constructor.
- Replace the exported bootloader pairing type with a `run()` method.
- Make `dma_wr()` able to work with different sources instead of adding
  a second DMA method.
- Split the DMEM tagging and overflow checks into their own patches.

---
Alexandre Courbot (6):
      gpu: nova-core: falcon: widen the IMEM PIO offset to 24 bits
      rust: io: register: implement Copy and Clone for RegisterArrayLoc
      gpu: nova-core: falcon: rename the local variables of dma_wr()
      gpu: nova-core: falcon: allow DMEM DMA transfers to request tagging
      gpu: nova-core: falcon: allow DMA transfers to read from a framebuffer address
      gpu: nova-core: falcon: program the FBIF_TRANSCFG register in dma_wr

John Hubbard (6):
      gpu: nova-core: separate the generic falcon bootloader from FWSEC
      gpu: nova-core: place the generic bootloader at the top of IMEM
      gpu: nova-core: move the bootloader DMEM descriptor out of FWSEC
      gpu: nova-core: run the generic bootloader from its own type
      gpu: nova-core: falcon: introduce and use with_fbif_transcfg
      gpu: nova-core: falcon: check the per-block DMA offsets for overflow

 drivers/gpu/nova-core/falcon.rs                    | 148 ++++++++---
 drivers/gpu/nova-core/firmware.rs                  |   1 +
 drivers/gpu/nova-core/firmware/fwsec/bootloader.rs | 220 +++-------------
 drivers/gpu/nova-core/firmware/gen_bootloader.rs   | 286 +++++++++++++++++++++
 drivers/gpu/nova-core/gsp/hal/tu102.rs             |   6 +-
 drivers/gpu/nova-core/regs.rs                      |  13 +-
 rust/kernel/io/register.rs                         |   8 +
 7 files changed, 449 insertions(+), 233 deletions(-)
---
base-commit: 7a6bc132f1b51437063c9203e7221067b40a791e
change-id: 20261103-r000-fw-088d39a643b7

Best regards,
--  
Alexandre Courbot <acourbot@nvidia.com>

