Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.201.21
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793784857;
	b=O8uoy36krB9uMJTTJPvIMSn6fJbNuXlEAcQ0/lEt9nl1jjzXFScWWVXBIjg2ghPeTwpc
	 /vVH0R0CrnEoo4JmJ2f/iWsmvq9DSBhwdI1ni8yckg6JjU05oDO+T7SJ+q6F/MRUuo+ms
	 S4KzfG3xIaKRsqGm8v68Xvid5MnwmJNxrzmr2dsSRNQiF06wMAHwf+iuEwSkSmYnPW799
	 dG1yzW3pKf24QJMuRP3gYCypOIVqvNuggmVFfutl12Wbbe5rHOtefZSRcGmLJ1ZMVO8Ye
	 +VaGvh8jfMN/dgH0kHzF6lOVb3RGTqs9MPvDXcyn5yDzL3+LbPzKyIeJTT8u821iIpQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793784857;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:To:Cc:Subject:
	 From:X-Mailer:References:In-Reply-To:X-ClientProxiedBy:MIME-Version:
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
	bh=4ouqrirnO6wNvH7uUDOMKXdd2PKlnxFN0KIseE7tUZ0=;
	b=cMOXcszEgN8HFzmJ4MC7uEu/oVy3YjYoqNCkx9Ka4ZeKPP21AeWdrSJzI8GTt1fu/nJT
	 60WIP8VIkFsHsBDsMiu4HH9NxkL0BaGrrbJoB5vK25JIBkL3BQcTXMUBvyulL+/REUp7/
	 jFmtMcP3ko/t0tF8iRRJd1gMvRumV0GJh+mPI5h7eZqrD2T8EV9DLSHZAghx5AZMMYgj0
	 fJkmNjsGlDI9e9frYc8SsJKDqUmX3qtw7mPLr0cCARtjTAD9BID8bW4itScSBQxaYYubL
	 xzR2xLwQeNLgTT2v8LPRtqRbkiOFwmb8cU3kEaycVFwlqOgc7B1QiyLHGvMj+ME6Orw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=Td0a+DCu;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.201.21
Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013021.outbound.protection.outlook.com [40.93.201.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AFBE606A328
	for <nova-gpu@lists.linux.dev>; Wed,  4 Nov 2026 09:34:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3AFBE606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=Td0a+DCu
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g/vUVlqzf2Gz8Z6ppkMsCFOrEaiafDyBAOzPEQ/W+5L/bRvXj4kXpKCy4Hd23kotnGFl7qjngDvTGD6VKdkSesnDZd+avkovJMEdcIONa84m+7wlrMAFUITxBNh0gRhF8KLOoxhVznNPcruIInmiMV1djNRZI3/KB+AVxuTTv5Zm8bqSaNjy09AnGxjDyJi9ayUd+k3jA9gOzwNRUfsBaOvnmmACpLXv9HaW+Kad5v26v6ARGnboRqKXKit2tSaGwbH/fNv64oNAzsobGy06VQ6E5NQSX5CxCkLzGeMzHn7niiiHQtMk23nbhzvpCPm9gKmelSpE4ovcOndRHEtFHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4ouqrirnO6wNvH7uUDOMKXdd2PKlnxFN0KIseE7tUZ0=;
 b=Ogzhg41W4dsJba/fW+RlM1fjLdrIxX5gSL28E58Hlc9kIOaZZZiIyUyas7+2nJvRjrbPcQW0xCaXgNoamA6hM9o9/dYWyKn+9xSovOh8RlEoqx419V+2A1YEwuZvBBEcu27M9vCfW96p8w9fwVOv4hQ9dU/dgVkCxtSVmOJJVSD7+Ne4k2YYmkfvNGILWd35YOdSZ1lQO3bAxp9dkthEErQaUi43zjYmHQlZf423XCZDnT2Yb5tBwDrdiQBXllEX4CDGooT2WsHrb7ent2WChwOoBDOaUh+K522a+yhDI0gMa8699ZMWa1RopETRChvMv/fWdTUj51be7f8KQxYC/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4ouqrirnO6wNvH7uUDOMKXdd2PKlnxFN0KIseE7tUZ0=;
 b=Td0a+DCu+yAFc7bOH9VfGKO3hzrRcwGPZgRKtFtJdXMoMSZfCsA+X85GXowuuYUz+c8ai1bBkHre1sKcC4xbQVIq4epDL434Wdg/RCRaB/16qnTMzLWYX2x49JfB6QfKxZfauEkAIEM4YUdK/jDezyCdP2Stw14KIXNlF87W2JZsC8qNuqu+dRvtZLBD+15EZkETjogWFR5Z35FEUgUHKsm2PGtBcYbmxczHhB04/MlSGDe2OzeG9AoRzq3X3RmywRK3w1B/BapAF/75AjtW8F8U2BUfsNDHjolrjoyRwPO8u1ppVorS3Kv/L+H+6dcrpgihMOrwxQrBsQUpQg2Z8Q==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6413.namprd12.prod.outlook.com (2603:10b6:8:ce::10) by
 CY0PR12MB154213.namprd12.prod.outlook.com (2603:10b6:930:130::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Wed, 4 Nov 2026
 09:34:14 +0000
Received: from DS0PR12MB6413.namprd12.prod.outlook.com
 ([fe80::e82a:6673:4142:37fa]) by DS0PR12MB6413.namprd12.prod.outlook.com
 ([fe80::e82a:6673:4142:37fa%5]) with mapi id 15.21.0592.009; Wed, 4 Nov 2026
 09:34:14 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 04 Nov 2026 18:34:11 +0900
Message-Id: <DMMBNSIC9LDP.1PU47ZXLI3LQ7@nvidia.com>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Benno Lossin"
 <lossin@kernel.org>, "Gary Guo" <gary@garyguo.net>
Cc: "John Hubbard" <jhubbard@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Eliot Courtney"
 <ecourtney@nvidia.com>, "Zhi Wang" <zhiw@nvidia.com>,
 <linux-kernel@vger.kernel.org>, <nova-gpu@lists.linux.dev>,
 <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH 2/4] gpu: nova-core: gsp: add the GMC API header
From: "Eliot Courtney" <ecourtney@nvidia.com>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261103-r000_rebase_on_cmdq-rpc-v1-0-189f9ff3bfd2@nvidia.com>
 <20261103-r000_rebase_on_cmdq-rpc-v1-2-189f9ff3bfd2@nvidia.com>
In-Reply-To: <20261103-r000_rebase_on_cmdq-rpc-v1-2-189f9ff3bfd2@nvidia.com>
X-ClientProxiedBy: TY4P286CA0136.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:37f::13) To DS0PR12MB6413.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: DS0PR12MB6413:EE_|CY0PR12MB154213:EE_
X-MS-Office365-Filtering-Correlation-Id: b2ea3e33-acff-49a0-c1fb-08df3a56c9f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|10070799003|23010399003|366016|1800799024|3023799007|10067099003|18002099003|22082099003|11063799006|4143699003|261102123227099003|56012099006|261021121427099003|261026121527099003|261022105027099003|261026140227099003|261028144727099003;
X-Microsoft-Antispam-Message-Info:
	SCJDHzQJMKjMr5vWBD/woVnlukHmtxMoy/yqGJNFL4tiztDTEQEm3soU372X5u8B4gI2+h5Dehfp1qH8cCqYTYdPzZfr3B63VV98wxtREWL7FKtydKkcKwxxLfUq+eVJ1L9BGmKorHAf4Fi0G7vnxH2cndAucifC+bTFauV+PQiJaySL/mqD8N97ZwVneo6Vq0tUzikg84YQTYIFm/BsD0dXddpA+DailZ0zvmep0neumr8851/bpc35E34FmOQPLqNEG2ZhoSwj6sxfRGyS6lx7MWZJtbzR+YT4D4p4h4ymQAOqSVZILdZc9MSFzEt9vPyQZcCwgxtRahUDNv2EijND/J8yDQxwuCZwTI0YDJs0xat2PbOwHjKxp4Uu32QYd5xWn+NkoGZTKEuEHpKldvbTJOo9Gfi57appav9/cABtslKRi1fFGiimvS9isibKRuQmuaAKtuFeh5tnbOMUy8om835Tj93LpfomQwfmEIQWifc2w2+XsnUMgjKrXZpjg+0fuVi66loFSz8z9RfYYwipC6IyLpfmnePUldm7N+4HVjJx+qGEdyCiLtLdcTUC/hGSPjogf/6INsAu0QK49Af8ruxLrZlp3jBfK0PB2SdaePB46/8bsUIk3ql76mNmysiClCNB0Q9qhtZe5EjTCKPPWC3qDk0pklfMXAilVII=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB6413.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(10070799003)(23010399003)(366016)(1800799024)(3023799007)(10067099003)(18002099003)(22082099003)(11063799006)(4143699003)(261102123227099003)(56012099006)(261021121427099003)(261026121527099003)(261022105027099003)(261026140227099003)(261028144727099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RXB1QVNXdTgyTHZVeWgzNFJ2U0ZrUEtvaElmTk1oeDh0WkFSMWtYOTQzWnYy?=
 =?utf-8?B?YzNQQW5zM01FRW9FdWtvZzl3U25JdnlQaVB0VWV6eU1FVWhJTDVGMFA0UGJE?=
 =?utf-8?B?aHV6aUpna0g4cUx2Y2ltK0ZhRXRpRDlobjlMelNZWE9kdTFhd3RtQzh2NmJT?=
 =?utf-8?B?TGJPNElsRUVKMWl6NE54a3lDc3BwckdKT1dYZUFReWVtQy9Ob0NXSGozQmZN?=
 =?utf-8?B?dlUyM0xvZEF1aE42UkRhM2t3anNXa2VIOGQzTE4xdHJ1RGZKN0RpbDF6TlRs?=
 =?utf-8?B?dDhodjEyN0VYaVNjYUFHQlFJb2h6RjJBV2xJZWQzRXQvUWxLcG00KzlUb29W?=
 =?utf-8?B?cW1aLzlUbGh3MmR4aTJwdkhVWHRiY3Z2cE03cFZPeGJQT09qZ0cxN2Ivc1la?=
 =?utf-8?B?YXZ1ajd1R0VqUUNjV0NhMWZ2ektiMGZjb2wxRXRpZ1FlSlAzN09aV2xtcFAx?=
 =?utf-8?B?SFBzWlBUZW1RK0hmZ1FaeVJXODY4bk1qazFBSHFFeFZoUGpRckhKTTFJTHRv?=
 =?utf-8?B?UmM2c3NrNkQ3QXM4anZMM2lhNUhURDIya3poSDRBNkRCbmNPMHZnMVRMVm5j?=
 =?utf-8?B?d0QrSU1OZUhIbDRzemtTTWR6M1FOazA2alRQZ1Vmbk00dE5XTmw2T21sSjlx?=
 =?utf-8?B?MGxic1I0VkovOHdKWkUrMTRFK0psK0hkYUtkakJ6Zmc5eE5xYmdQMk1qbS9T?=
 =?utf-8?B?b1dkRkNwaUhVVjNxdkJ4WXpacWlvVkJWNktPcFgydmxmb1JuMEZxTVdrSExY?=
 =?utf-8?B?ejhGVllsS1VCdW91YVRZdWlkT2Evdzl6b0ZYcUZ4S1hvTUZxYUVteFNwWEZ5?=
 =?utf-8?B?V203Zkt5OUJmWTNWZGlLNUMwcEtQUGhSdHp3Ykw1bmJURWNTZ0xDSjRBTUJU?=
 =?utf-8?B?Y3JneVYrNVJ6Z2hGR1JqbGt1OVkzUEpMVi90Y2FpQjBjQXhjSEJXOFZIWWZs?=
 =?utf-8?B?YjFNNlFiOTViUmltR1Zjam9QWVI1cWNhQ3dnWmlsVUJzYUdkUzBoUm9PeEVC?=
 =?utf-8?B?NCt5M0VnK1dpOGNzeUxnempqY3lnbW5wZXpmNWRKaFN2djZhLytMWDFaeGFa?=
 =?utf-8?B?WnFmVzRmcnVoeGFqakxCeDN4L2tIWkZIN3JFeFR5Z2RaTG9UUVJWb3E5Y0VW?=
 =?utf-8?B?MWxRSGk3dzBvOEgyWjFSQmRXL0pJaDNFWGh3elFVRHZoNVM4SlZhazVUTzVO?=
 =?utf-8?B?Z1kxM1N4emN5RTBiaUpSQ3lLOUtNcmJlejZCM0E0UHhmNmxmb1ZSQUZyQVdv?=
 =?utf-8?B?YkMrbkR3anAvWm9UUGhTanRjTVR2MHFrdEJsZVJXcytuMWlYV1VheTFqR0cw?=
 =?utf-8?B?bXhjZVoxZXNGK0w2a0U2S0N2dUZSL0pZMEM0Z3hHdWdRU3Fldk4vVXY1L2lw?=
 =?utf-8?B?Z3d2SWFpbVJ5a09CUXBGSm0wNkgrUGR2ME5aT0xCdWl6VksxTW9jMjVaSEZ1?=
 =?utf-8?B?QUFhNW9JbjhmN3NudjFtUWlKQnh1RXZNRnlCb3h4UTYxbEdKdHplVkVlS3ZU?=
 =?utf-8?B?ODdkNXl6QWR5VGs0SEZoRDlEQ1hzdG9QaFVqcklzeGJYaWNIcGpXc0QzZDM5?=
 =?utf-8?B?SmY3OW5pUDVWcXY1Z095RTZCOTRHN0pKeWZOd2RRT0M0eDBwZ01BNCt5VnZm?=
 =?utf-8?B?TkxNNmpLYU1FWTBIY1hJdjBpT0Y5dnpUY2pHSTY2T0g1dUdSUTdGUE9DUUx6?=
 =?utf-8?B?SE9iQ3F3K2VtVERxNVNadk5nYkxlUVM1WVhjbnFmSzU3SVhlT0VQRmw4WkpL?=
 =?utf-8?B?VElzU1FsOENoMXRYTHY1VWYwOHZzVjFCcWs2TXUxc2RaOXd0TDRUTUdTNksx?=
 =?utf-8?B?d0doVldVcU5nRGVqV3F4RXhESXNLL2IraHpTSVZHMnpoSzRYVDlVdkFNa09O?=
 =?utf-8?B?NXpUbmRTQkx5UE1NcWl0R2Npc0xRbWNwUE9GakltckR0cU81cVE5SnhVL05o?=
 =?utf-8?B?UzJ2RlBGSmlmNjFZWEtQSUM3eWczNnlsSUNqRlY4Z3kxaTYvS0w3bit2NE9G?=
 =?utf-8?B?bGpWYjJjVEVRU1RuZFRGY2dyUG9HN3g0UHZ3V0RETmRjZ2dKZmV4V0tKOGgx?=
 =?utf-8?B?ZGhLTTlEMVNkV2lzb1RJTTJ2aXlpN2Q4VDJWa1pUNGI0YVlhSHFVaEZsMzRK?=
 =?utf-8?B?VXUycXNLemE5TmtjT3Y4djY4NUlYS2l5L2h0citsVk0zQ09GcnBQMEU0ZHlC?=
 =?utf-8?B?eXNNb3B3b0Q2M2M3UW43VzBtYjV2bVJUdW5WbkVBS2xUNyszVFB3ZDNCVC83?=
 =?utf-8?B?eDNONnNsQ0FOVTRpT0ZSQkZLSUJVZ2hqT3JGWEFEc2xYbDVKUTVKNGxVa2Jh?=
 =?utf-8?B?UHNWK0hvaTJRa00rSmNmbEZDSi9YV0tBVnFoYk9BQmNwVmEzTk0rNVFRc1BB?=
 =?utf-8?Q?v+qVjlyXuf7uYdbVq6BGSpstrQ5S67efJkxSzpZ/aGRAi?=
X-MS-Exchange-AntiSpam-MessageData-1: MNK5cO5Ewirbtw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b2ea3e33-acff-49a0-c1fb-08df3a56c9f9
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6413.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2026 09:34:14.2180
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OIPGfza3CBorHOTEaUBK5+ZTypCznqztMPxwPmHu6LOy36Eo8F3chbVgkP1FQsVkVXH1UWcpHeQw53PCPu6Gkg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY0PR12MB154213

On Tue Nov 3, 2026 at 9:02 AM JST, Alexandre Courbot wrote:
> From: John Hubbard <jhubbard@nvidia.com>
>
> The r000 firmware carries GSP-RM's boot protocol, and its newer
> interfaces in general, over the GMC (GPU Management Controller) API:
> messages that follow the queue element header with a GMC API header
> instead of an RPC header.
>
> Add the GmcApiHeader type as a newtype over the GMCAPI_HEADER binding,
> so we can define the GMC send and receive paths in the following
> patches.
>
> [ acourbot: wrap the bindings type instead of redefining it; make
>   `status` return an `Option` to avoid returning a value whose semantics
>   are ambiguous.]
>
> Assisted-by: LLM
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
> Co-developed-by: Alexandre Courbot <acourbot@nvidia.com>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> ---

[...]

> +/// Header of a GMC (GPU Management Controller) API message.
> +///
> +/// In a queue element, it follows the queue element header and precedes=
 the payload of the
> +/// command.
> +#[repr(transparent)]
> +#[expect(dead_code)]

The build breaks on rust 1.85 here, see rust-lang/rust#154377. I also
had to work around this in the NVKV series. It's broken in a few other
places so worth checking each patch on 1.85 imo

> +pub(crate) struct GmcApiHeader {
> +    inner: r000_00::GMCAPI_HEADER,
> +}
> +
> +#[expect(dead_code)]
> +impl GmcApiHeader {
> +    /// Creates the header of a request for `command`, sent with sequenc=
e number `sequence` and
> +    /// followed by `payload_size` bytes of payload.
> +    ///
> +    /// `max_reply_size` is the largest reply the sender accepts, and ze=
ro for a request that
> +    /// GSP-RM does not answer.

This is a bit confusing imo since we have zero reply length commands
that do get a response. I would just say that commands that do not
expect a reply or expect an reply with an empty payload (so just for the
status value) should pass zero here.

Otherwise,

Reviewed-by: Eliot Courtney <ecourtney@nvidia.com>
