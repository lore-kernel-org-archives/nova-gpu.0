Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.200.16
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794202790;
	b=guhtG7JtXUZl4hu+4PtqonBw/yUTvRYRCYyAmVOo/P82YPprL2KBQcv22ezJhNWvU1qX
	 YMMeINH+9JJEF9TE/66ri8I9LJuTnHZGPUdJ6BLVniNOeXC19dZuj1040M8FEPVKHY2Zb
	 bt+P7LSx+9hnTetGb/Lgh8GknivZpGT+r5XlxxNGqCMaf99gq9NiTDgjSVhdWGIzdC0pf
	 b4CBZ/54VHiennKzCpwJbWkeSjFkn2v0yVyLMEyh0QkTkR27rXtZKyNPM5HgwkRSJkyp+
	 DrlIqpb8q5Min2OD434yhBF0fBIxQlZMJyeVRVlZzrR9/GXhdOp7sU5UfdDkdObTY2Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794202790;
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
	bh=y8ufMHRVsiT0lBOpuh3S9JCMtghCs3djUEDaBf8XdCQ=;
	b=Bkih5KFlnYUUeSbC08FwP8WOIw8fqFgGpRl66BtmhOZtFQ9zFWVG1mkVk+w0QKTe7Opj
	 Xdyj18zrtudfJfH4OrVWLkN8zr/SBdRdoUZ9E37rxhg0U2X92QfFnzRucjDJMmR36xGTH
	 YFtRYisBWnLqXnNELzr1NV2fZngEk9KvOiOymo9kxRH5cKLGjnZCLRagX422BeO8cT4IF
	 MbNUv+xt1HdmbdR1iGnY0GbglXWAVmy/d3GWBldOTC7+O/3nEMSVoUysmi34+Vm/YJPzQ
	 q2miWsUxzkbWPReO6T15vSjvGNmVZgu3x3wa2LjE+v+zQOOthK3Kds+k2UfjX6/UTIA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=ITwla0SI;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.200.16
Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012016.outbound.protection.outlook.com [40.107.200.16])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75C7F606A321
	for <nova-gpu@lists.linux.dev>; Mon,  9 Nov 2026 05:39:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 75C7F606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=ITwla0SI
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F3rbS6eVH6H2VS7ZXR9T/GY4mNzw1UzyqbRY1TFe5C0WM1sJ37Rn1hCz3C/m4IsG8WcpszlfuyFLZSaEiys9nc/JaiPDx1n+fqGGHppko7p0mXWf19CUbPi3L6nlz3TZu2s6xGxeSwwlcEryaM3jChP7HkRnV6gmmG7R6Ifn11D0hzC7xpvLsQNXsmQ/aSoYxf8woSXIni7qMlHra4q4JBXvDVGS585ifTo7d0lKGwA9112SZzxm0l4tvXqUjO2rd+zgUBaiokr1/6VNrlBDgESN/++nWK3nHNnt0i8NthYusf7C+3G2UUgCCRRu0lc/iF3RPWoCzG9sIV+IEq/eKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y8ufMHRVsiT0lBOpuh3S9JCMtghCs3djUEDaBf8XdCQ=;
 b=PRvoo7r90PZJbj0FtVr2YP0ia0kaH+FPDeI2QY92gkzYv9/Iwe2/uqPLYQKbr9kcEBaAKbiWc7yccP1buYLTa++71f0Dt5MaX0jWRXB6IwYRO2S1pAyc3L9Pt58LthMfP53AdXzwToQ9x76IfsULBrZTSY6VS0s2aC1VkSLscqVUvdw2IyG/CDTvgiKbHbYnfmIH8ETJd8grEFaCLtpRNzBsctkbN+5Zqt3hPIwQbTDhhACp7GF3LtHPR2xkOXu18EWYH+zfuwhxo+gpNT7yXJ5Cm4oi2iLpeP5MIkwqc9BAylMPmgCqrXUBBzmhDA8FyifPTgoXkawQLGFZHToqxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y8ufMHRVsiT0lBOpuh3S9JCMtghCs3djUEDaBf8XdCQ=;
 b=ITwla0SIPIQu06H9t5H7AnXcBEsPUtPZEQMI5EkTRaaXhZxeQygAwWoujrESv5/N9B7cSVcwrc7xFU+fUJBHer3fhyK/46zPj9/8pl9Aj5657cPArTIxkaBdkHo1c0FjeP5lsCuzXpcdknU1la5iqCCzrNx0Jbvi6u5AMXfONsVlJKAstmrr3+5BiVj6nYChsP7yKA1Jkdv83Px6h4+LJyXbwAiL3tqkNJXLrlKmCjyfHCHpYBGNgRr+mMaSkFj+enUQpCCpEU5GcwfYnh/uDr/njUJ1COsUf0aQCpGVd2tV0vJTFaHSUEuP8v827qmEPibpy83dms0w8hk12m9SSQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6413.namprd12.prod.outlook.com (2603:10b6:8:ce::10) by
 IA0PR12MB7505.namprd12.prod.outlook.com (2603:10b6:208:443::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.12; Mon, 9 Nov
 2026 05:39:43 +0000
Received: from DS0PR12MB6413.namprd12.prod.outlook.com
 ([fe80::e82a:6673:4142:37fa]) by DS0PR12MB6413.namprd12.prod.outlook.com
 ([fe80::e82a:6673:4142:37fa%5]) with mapi id 15.21.0592.010; Mon, 9 Nov 2026
 05:39:43 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 09 Nov 2026 14:39:39 +0900
Message-Id: <DMQFSYAJBSCJ.2XAKFM2Q5ITFW@nvidia.com>
Subject: Re: [PATCH v2 08/12] gpu: nova-core: falcon: rename the local
 variables of dma_wr()
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
References: <20261107-r000-fw-v2-0-fb37cc5b20cd@nvidia.com>
 <20261107-r000-fw-v2-8-fb37cc5b20cd@nvidia.com>
In-Reply-To: <20261107-r000-fw-v2-8-fb37cc5b20cd@nvidia.com>
X-ClientProxiedBy: TY4PR01CA0102.jpnprd01.prod.outlook.com
 (2603:1096:405:378::17) To DS0PR12MB6413.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: DS0PR12MB6413:EE_|IA0PR12MB7505:EE_
X-MS-Office365-Filtering-Correlation-Id: 287d8c33-abb5-44b8-0820-08df3e23db63
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|366016|376014|23010399003|1800799024|11063799006|4143699003|56012099006|261021123027099003|261021121427099003|261009223027099003|261102123227099003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	+z3xEF+tOuQvld3lcVvR1CV4+j/i55lffuRrm6/Nn29jZGjacBQgi93SI7fb8Ntn50nf7NeqL15CFXZMpNgBlnIp6TWhRYnC3bXIGcFWFBlLFRSe6o2sEQdLwuTsg2jVPxMaJWhfIQ+ybGPuwGYWAIQmiUQatZh9Pits03JTUjzWAFlT2kk07hG6jwHePahZM1Y1hUGPBjEYUsLJwabc+QTKRuLODN3a9Dp1bz9aj2Rxtv6/N2ppHC82LqgH67B2MQFP5L3MbC7x9n+LzSowge1JS32ZHBpIALx/lxpTXag3quo4KR05eBAEjfmYMpjktRdOt8ixN3kh8foR4lFyJ8n8aLYK5g/RqmDjV/MtN8Gr0sT6qg/bDZOiSk4KeJksc99WtLt7nuAgZ57ZNFkpCPrHesMbVewQ9WQ55O3N6h0bj+xeXUls9KoRT+SORLjanceXe6VI+pd2X9wkktRCSB97DWLhdg7vLAO3iao3kl7Pi6YJ30byPKrqBQB2pFjzdBRKQ2t02AuMciM0IupaODAd5ZDYchN/M0O8dC3w41WdM7Oteq7M+t90u5v3HAv0YwLOvwnSa9rjISw/Ecaff/NKjO4j4my7ocRuvSfalh6xQg870XiwfgTHLzO2iETcNhscggB8ONZ7rL3JfrX28Dz3Y/B2bN8UIxX2R0Kwh8c=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB6413.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(376014)(23010399003)(1800799024)(11063799006)(4143699003)(56012099006)(261021123027099003)(261021121427099003)(261009223027099003)(261102123227099003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bjFWeHphS0ZiSERZK21OR0JqQmVxbmV1WjlDZ3doNkYzV084eVJtUitHNUpR?=
 =?utf-8?B?d01tSFNPNGdaK0tOSXRYTFN6ZVNmQ1RtUjN4YTBJcW9IQkhILzkzRmtsVEts?=
 =?utf-8?B?T25UV1JIeXowZGEyOTMwQzU1TTh5alNVTDBlWW9ldDdQdzZ1YTdYeTlDTE9P?=
 =?utf-8?B?TkhXRkFzVnBuVkhPZTJkajBuMmVhaytZSloyQThvbjdVU09TZUJxYzRxajRX?=
 =?utf-8?B?a0NHbEQvTDdJRVpMaHZuSnFIalVSSDJ4aEM4ZThncjh1SU9rMkZyS29zSUxy?=
 =?utf-8?B?ejBzcmVFcUtLdUdVME4xVFQxZFRKbU5hWnZrUGFFbTl4VjlVZ1ZCay8zY2hR?=
 =?utf-8?B?OVl2bERCeldUakc1OTlQNWtuenZOUnkvZ2I1ODYzNllTajkrMEsyR3Zyc0NS?=
 =?utf-8?B?enFGUVJGYTZkbzZvRytkemVxTTEvTXIwTml3bGF3dFdoQ1FJUnEwZmhDU1p3?=
 =?utf-8?B?amIxeEc3dkFtTG9rQXdxRTRST3ZGcHgrMTF1dEU3dUVkVVdoRElsWXlEVklq?=
 =?utf-8?B?aVpDbWR0ZTFDYWt3WUZUZ1FnYzRMa1d0b1YxWmJzaTFXMFZ6ZkdHU1BjMVU5?=
 =?utf-8?B?MVJvWGxUY0kxWnhrRkJ3c3g4TjNYditTSzY4UlpGRVFmLzQ3WmRJR1VsZHZp?=
 =?utf-8?B?eGJaUzRsaEZBNFAzYlZubVZDR25nSjE2eFhBaW5sNFFkT3BqTGlWdG9PdjdV?=
 =?utf-8?B?UnJzYk5POUNBYU41S2NlblY3ODFRTHdxemp6MStSN3JHYkRLbkQzVFExQ1or?=
 =?utf-8?B?dGxoWUZOeTJIdXNrcC9IdVFWbENtNTV3MjlMQUFiVmkvcXlCNHoxSE9hRHVo?=
 =?utf-8?B?LzkzZVgxLzdlWnhjcEcvbFpKTzV0TDYxYUk2TjdGOTBlWjA5YSt1SmFoSTls?=
 =?utf-8?B?MFUzeTRBczRKOGFZWW56UVNYNUt3WENsT2w4bzJmbGZRU1dVTnRiRXI3MnhL?=
 =?utf-8?B?ODF0ZFZYNHBOcnQ3MzNpS2lVblJjd2thYXQwaVNWQjNiZ04vKy9Bc21UNzEy?=
 =?utf-8?B?b1owU2VhRUNpTDRuL1M3dXRUODl6RkgrNEZrMmo3ZC80MUJ5L3lIRHBxaVB2?=
 =?utf-8?B?WU41anBzY1o1YWRZbVhKemh2bmVZRzI0eU5YMDNmVUdaWW9CbitRKzU1eVph?=
 =?utf-8?B?WmxBTk5tN2I1dnhoNmRkMDN1cFd5NVFrOFR5dThkdHFWbmhVMWIrdXJmQ01Q?=
 =?utf-8?B?U05CbjRJZ2lSclgyZFh6eGlFMzU3WGgxRGwxN0NLOUc2Q2pNYXh6OTB5aU9B?=
 =?utf-8?B?WXc1eW43TVB0NDlQZWVQVHlDT0NKcmYrb1lFdEgva1JPY0Izc1F0ckZ6RDFy?=
 =?utf-8?B?U1IzL0FseFlDVFF3TDZBSEJQVk84bnVEOFdHMFJuUEJzRUlqQjd3U3ZOVWNU?=
 =?utf-8?B?RldnbHhTcUttWWxxZ0tTUFBlYWtnWk9NSVUxT2JzbE54eTYxVmgyTDVoOEto?=
 =?utf-8?B?aUgrZmsvZll4N2doU3Y2YjJFeW5uQWlVMUJrZHo1QUpFMWRwSUY0ZGh0YUJZ?=
 =?utf-8?B?blNYRXJFV2hvdS9jSjNRUnBNcVJyMlZvSEh6T3pLSWE4MVdBeFlEWmhrYXl4?=
 =?utf-8?B?dkEwM2RxOG5RMjdkM3lDVlI3UzBETFo2c2NoU05YeXdoT3lzVmFMQVVIS0Zh?=
 =?utf-8?B?b2FvRXhmUk5UcG52U2JQMTJXTU5vTVEzOXdjMDNRQ2ZDNU9COEhCcG14dXZj?=
 =?utf-8?B?OTl1c3lscHJvREpzWWhJRWhRZkRwSnc5OGtGdkJDWTMyZjA4d2l2emg1T3ZG?=
 =?utf-8?B?M200S2xtSWd6azJFN0FIWlk4Sjk4UEswS3lsaVZCNW1ybFpZaEJqYXplU3Vq?=
 =?utf-8?B?UzFoQ1FYWlpaWEMvK09ySVJkSThoMmtkcVVNWnp2anE0djB2cjBoUFNoK0U2?=
 =?utf-8?B?ek1SY3NNSTBlZGRnT1hmZWk0T1lKY3Y1SkdpZ1haMDBYeDhVMTFsQ0dSYjlW?=
 =?utf-8?B?anY0OGhsZGZ4RTIvVlJPaDQrYXBMb2c5ZU9zb1NhNEczY0hjYTk5b2w4emJo?=
 =?utf-8?B?L0Y4aTBUY2VncXd1a2lsN1VqOWZvRXluUmFyTmdHK3h2NUhxSlc5SXc4K3pT?=
 =?utf-8?B?SEFqdXhNenhnUWpkOHJLZHRkblhFNWZjZjFPR1VnR2ZMM2RJeWFsZFVWejNp?=
 =?utf-8?B?QU5wNU54ZTNTc3NVWkc0eTlwbis5RWQ5d0FxZmFBWFNlOHI1eEVzK0Z0TGtV?=
 =?utf-8?B?dEVDZGtEVkNlSzhSUndOZE9hUTNBcFpMUVpPSkNvKzNpVlpKT0NjUGJlSm1P?=
 =?utf-8?B?T05pQkhaZFFXQmgvYnBnanN5U3ZoWndYZjNXYU5jSmc0NmtWRGhOZ054TjV1?=
 =?utf-8?B?bm5iUkxjV1U5UmJISGREZWlmRmNUN3pwb04yZnNwWnl4Q3ZPWUVHczdHVk9R?=
 =?utf-8?Q?RrkcRI5+U+ZodrtSh86VL1uqUALGFSJQV0vBX+7t9QDyi?=
X-MS-Exchange-AntiSpam-MessageData-1: WBmckltMiVX2UQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 287d8c33-abb5-44b8-0820-08df3e23db63
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6413.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2026 05:39:43.8009
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JspNLzZI6cSlqExeEeP+HDoPrWDhDLksbpnNf/wZ5OeX/U1/icyOs7oENDMhkLd3rFj1gvz8ZCLu29jqiBrQrQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7505

On Sat Nov 7, 2026 at 6:48 PM JST, Alexandre Courbot wrote:
> The local variables of dma_wr() are named after a generic DMA address,
> while what they hold are the values programmed into specific registers.
> Worse, the `src_start` local has the same name as the `src_start` field
> of `FalconDmaLoadTarget`, but a different value for DMEM transfers.
>
> Rename them after the registers they end up in:
>
> - `dma_address` -> `dma_base`, programmed into DMATRFBASE,
> - `src_start` -> `fb_offset`, programmed into DMATRFFBOFFS,
> - `dma_start` -> `base_offset`, the part of the source offset that is
>   folded into the DMA base.
>
> No functional change.
>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> ---
>  drivers/gpu/nova-core/falcon.rs | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falc=
on.rs
> index ad497a5704ec..3b3e8e0f821a 100644
> --- a/drivers/gpu/nova-core/falcon.rs
> +++ b/drivers/gpu/nova-core/falcon.rs
> @@ -562,13 +562,13 @@ fn dma_wr(
>          // For IMEM, we want to use the start offset as a virtual addres=
s tag for each page, since
>          // code addresses in the firmware (and the boot vector) are virt=
ual.
>          //
> -        // For DMEM, the start offset is folded into the DMA address.
> -        let (src_start, dma_start) =3D match target_mem {
> +        // For DMEM, the start offset is folded into the DMA base.
> +        let (fb_offset, base_offset) =3D match target_mem {
>              FalconMem::ImemSecure | FalconMem::ImemNonSecure =3D> (load_=
offsets.src_start, 0),
>              FalconMem::Dmem =3D> (0, usize::from_safe_cast(load_offsets.=
src_start)),
>          };
> =20
> -        let dma_address =3D {
> +        let dma_base =3D {
>              // Upper limit of transfer is `(num_transfers * DMA_LEN) + l=
oad_offsets.src_start`.
>              let dma_end =3D num_transfers

nit: also rename `dma_end`? e.g. `end_offset`

Reviewed-by: Eliot Courtney <ecourtney@nvidia.com>
