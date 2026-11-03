Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.201.17
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793701380;
	b=aYJhjnamKVVm+b5ftaFtaHcvpbiGIH08musVKi/ZT+rpBMYrhE5p/h7e8DugfjvBzV1u
	 K1xRieXPLUwEYrvHu5fjLubK/n0pGpeGz6C6UUfY8dtTB1sNgxBuAkgSs6EBvMYTco+SO
	 OGu8OsptyMsGIS+WetqDwwPgOQYNbVFsLCuosac7peawyruRnlEQM6wbxrqJmd9aGSWRg
	 s24eZimTfP6LgdRVEpiOK1F5YdMvDL9gK7YNkcyFDH9Eu1HLBM8NgGGB+ugti41a7UTKe
	 9aZqUMuo/clGtqRXA5nRaHKOMzgCuf9e8XLkvGMwKzW/Z3iJIaS6CNwWYRLQJY/i+FQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793701380;
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
	bh=Kd7DQCRxEkoV/45jS1/gkpLPFu4aG7G43w6C4SSBpWg=;
	b=1VFhE6e1dtvfjHIiuyF8ghAj0bgMKog4EMMgJxo7QMfJT2315cRFT8SEDJbyW7IlT/Qq
	 CG+PIcAncFQSqKT5hqumVbknmrA9nwpz+liHopow+g3ktFCzRiXv3+mCMrTBeZlfor5GQ
	 6N+JJXzQbpzNzVtnSXn0mEImQwG6aNadKSq7jN3YoqgJvGnKLTmCS7MXZnqQlNl234nUK
	 aSq3CosL7ehpJG57YcQl35zLbm8sVWg4BN2KEqxqjwlAOnTN+PB6BDre5pb9q+mmw3Ssx
	 eH0e2dhuEnPGmBUMxlo7UNZ8I6QrFiOQlQQttqf/SSKeE3CwcuoVBZAmKmb/IBzwzQQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=ipDleIoz;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.201.17
Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010017.outbound.protection.outlook.com [52.101.201.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1412F606A333
	for <nova-gpu@lists.linux.dev>; Tue,  3 Nov 2026 10:22:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1412F606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=ipDleIoz
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vp6S8UlmZ+aekqJ67xamMRcBtVR65M7T0cudtK5j6UWdRQiJafQpAB5cMTDGkH41Gvh/yqe9dVMrzXhV3rrJKMfYQ3ra+bRkh9WhDbJGHut7WXwF6H+bjE0qp2Cuq8MPRUlfAEowLFnGFjHDhXWjR2kP8vrHv3lYxe5VV7DOefziTHW15lBx8X3Yq4rIM/fi2e0qpDe5XVAsXbvd40Bhs3MJRzMpeLxn9c4Qly5NAfdbaNebSxEAlRBu4uc1R6NqxlA9HjHgB+t/+QDxkhlDup/mgBVCGl76yuZdY/S7Xoth7ruxz7V99W4u5kr0U/2oEw26tirtmHO0Lqv9wVZi6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kd7DQCRxEkoV/45jS1/gkpLPFu4aG7G43w6C4SSBpWg=;
 b=XSpqT0pq8StTGOXuQWj1olq84WorjJCvu0agyRMQ0dZL+ALDY2o+IK5AhW/b+XQc09HCOyBzxoqoT/+CHIyiVhVQakSyiFiVsoES/upL9v9wNDGHNt7RaUcnAtWG+6dxIYZJLgnhilV1pfK8mJAm4WWattejjygwQLZMmx/IFeE3Jws2rXWgQpVPOiGq3XmA9qNbP0ILtCtw9Gp6kc2qo7ArYp0lKT6/x52ZoDI89XVlCwzzIeYR7fM9tF61/TPucSfi9YMYqTGolRmesHmKWYJ+cuvXCfd3zqP7wROHdFJUScukR3WZ9BkmJA+sY7kabAjkG9OI6rZ/dHshEUvuTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kd7DQCRxEkoV/45jS1/gkpLPFu4aG7G43w6C4SSBpWg=;
 b=ipDleIozHBRDSDUQbRjrpaBjnANYb30Ikc5ibswGnoqpkes+J90YNzc2LCqPCsS02pn3Ei2bQucI6S4qzMNaq835zt1EW2sY87YUvQlROimOxwtIyBjaZCw0aoYkeAwzZSdhD7686LaUW2ZSvVAH8RBrHnfTwCMSGn6vOulMqUQVig4rdAXDIsotMmKullA4au8+AD+csAP3iVhQDP1U7Eq00FPsyg5wVE6SrdSrxNcr1MNNlJYHLlfuexKt6ZOIhYHtLi4I8bvuasl80SqAOmIxCGNN00TTjHxqEqUlLGfzgtS+aBBXTzL+HnQywhC57bUrS3iVrRzO8gQ65TQcLQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MW4PR12MB6873.namprd12.prod.outlook.com (2603:10b6:303:20c::17)
 by MW3PR12MB4475.namprd12.prod.outlook.com (2603:10b6:303:55::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Tue, 3 Nov
 2026 10:22:57 +0000
Received: from MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1]) by MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1%5]) with mapi id 15.21.0592.007; Tue, 3 Nov 2026
 10:22:57 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Tue, 03 Nov 2026 19:22:41 +0900
Subject: [PATCH 3/7] gpu: nova-core: move the bootloader DMEM descriptor
 out of FWSEC
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261103-r000-fw-v1-3-e3d38fc130e3@nvidia.com>
References: <20261103-r000-fw-v1-0-e3d38fc130e3@nvidia.com>
In-Reply-To: <20261103-r000-fw-v1-0-e3d38fc130e3@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: John Hubbard <jhubbard@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Eliot Courtney <ecourtney@nvidia.com>, Zhi Wang <zhiw@nvidia.com>, 
 nova-gpu@lists.linux.dev, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: TYCP301CA0009.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:386::7) To MW4PR12MB6873.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MW4PR12MB6873:EE_|MW3PR12MB4475:EE_
X-MS-Office365-Filtering-Correlation-Id: cf9bda53-9329-4ef8-db1b-08df39946ddf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|23010399003|366016|1800799024|376014|261021123027099003|261022115727099003|261022105027099003|261021121427099003|261009223027099003|5023799004|261102123227099003|261022075727099003|261026140227099003|261026121527099003|261028144727099003|11063799006|56012099006|10067099003|22082099003|18002099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	HAGm/qLFpEIqDn8nVu2tQmCFDw2/cbXPfM2RoS6UurgyG7EDkOanvls8UyS3N8GvkLa7UamrH3qspw1tsT/Gz2DPHruwFAmFVAc6l7CAC4DGWA9dfPRAbzzcjdPwxJy9ipq1IwWtHak9pBwNU7/CEIg29EKz+1ISL2eQh1t37uQptUy4l9VZmNMUiqvlurAG3n+y3nUJhOoNjBkXw7jsb+rPlFT/cTTGdR0Y6I1mbIv0/5r18qrDM6aDlTswtfg8ZUwdTH4HPTbTNKPBUqEyczmoqiGAPQpR1SsN3YmI4Xx0TGDq5RUpZSifx28tXLj6QihbS9YLBK8HXN3GFnq7wx8zabri8/3g0mWlhG/Rfx5GyIWXjgZAPUTANwhFudYaKPBB7aYvWxoYZ2eJwSrJ9XCXqoLijRtGigNiyapa2hN1sPDH6edCJu0cdmxl2G5MvgYh8b9EGJpXjTNvdNJtLKq2jqOvIme7u9U+ZqKSfY+FhkzC0OHEKda0X9bDg3FCjQoP/1Z3OjEkv5wA6o1kNf/IwqF2SN/Ly5ezdw+fppAfm+oPpoLuEPNoidwlZrFvkAxbafigV+A61AVfNiYh4DGK3xtsLJfhGqxo2i/jDBuY9LSA8kyxAaLdTsaFa1yH6fOf9uOxAtTROWCrsx2q9G7h+zme2mfcYvNOuY3OfGw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR12MB6873.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(23010399003)(366016)(1800799024)(376014)(261021123027099003)(261022115727099003)(261022105027099003)(261021121427099003)(261009223027099003)(5023799004)(261102123227099003)(261022075727099003)(261026140227099003)(261026121527099003)(261028144727099003)(11063799006)(56012099006)(10067099003)(22082099003)(18002099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?djFiUU5JYnNiakFSemJoc0FqdmpndzhBVzZxMUxNb1dsaC96dEltVWN3bXBP?=
 =?utf-8?B?ZlBNTElFYUhBOUVhbVdXOTNqVnlZV2ZOV0hYejJsK00yWlMwSkNhSkEwZmVu?=
 =?utf-8?B?cHdXaEVlMXBHZlNKenJFVE5aU0l5Zmp1amFKN05ROURkdWFmNVppeGU3M1dh?=
 =?utf-8?B?UTBkNm9nUUJnZHRoKzhtWDM4TVZLYllQdWFYb1N1dXNQQ0txOUcvRjV4WVJy?=
 =?utf-8?B?REFqck91OWYzbVQ4UWxJU3RFWlJweW0vZUVpTU0rMlRpTVJUdXZ4WHNUTDQr?=
 =?utf-8?B?eTRFU21zU25TRUZQekptNTEzMyt5Ui9yTkUralpVbjIrajRUa0tFY0xxWStn?=
 =?utf-8?B?RjlZSE4rS0NmdUQwWURIQlQvRVpIdDZSQVMxYmRUcS96Qnp2RVdaZWtIL3pt?=
 =?utf-8?B?U1orVFoxMDB6aUw3dUdYWlc3WktVZDYzR0V0RGtCMHp2RnVXaklUMXAwRHRG?=
 =?utf-8?B?UGJEa2lZWUZaSnlCZkxXUm1IbU5lc2pHeEllcEJyQm9jKzRUTlRrR0tFdjJY?=
 =?utf-8?B?UlVvUFYyVXl6MjhRZnJKcjAwemZNUVp4d2hkN2U2b2lVY0NiWDdkSDdrcDFz?=
 =?utf-8?B?bm9MOVk4cjhFdCt0WW1VbWEvdTJKVHhTYWpWZTlnamR4T1JKZmY1aHZIUnJH?=
 =?utf-8?B?bVFWNmZRS0xLMi9ZbGpKRFp1N1pwU0hTMXpZMFAxWmd5R0czOHRaUDZKOThm?=
 =?utf-8?B?eFlabE5LUWNuVnM2ekYyWHNyUjNUck1ySStyMURFOVZseEVLbmZmVWRLQ2hI?=
 =?utf-8?B?UVRaUzBCSDJOT3VaSU5zUm1xRGNrbDdUWDc1TWVYNG15MVBaTVBxOHNjVlA0?=
 =?utf-8?B?STVVTTZtU2E2NUk1eEQrd0ZvK3dJTmdVYkpvZkZwMndwMEtWL2o0ZFpzYTNR?=
 =?utf-8?B?VnNkRTZLcWVUVWRjWGVwN0pmdWNwK1hhaEljc3ZnRlhDejQ0cnFtQUowVXdJ?=
 =?utf-8?B?a29ET05FNVhTUCtiTEtndDArOE90VTc5MzZmVS9FNzF6QWJVdjVPMXNUSTZp?=
 =?utf-8?B?WlNSN2RTTDh6WXBSSG96Vk5LWkJNNHN2cHRLSUtkY0IrakVGLzlFU1l6N1p4?=
 =?utf-8?B?elFLWUhZa2luV01lbDJ5UXRiRjRXUVgzaWRhRHp6NERPa1o0UFNXOTVxZHRw?=
 =?utf-8?B?cHhxUW5lWGY5aXE2b3ZBRlBWZE5ROGROZ1M0VEVWOXdKanMvRE85c2NXWlAw?=
 =?utf-8?B?LzZVdGk0bEVGTUF2NUtFY25sVzJ0Z2l4OXBPU3RzUUdCZ2RoT0ZTL2o1M3VR?=
 =?utf-8?B?VVNGV1RDZndkQitzQzJ0YnBQWkZzeUJqUXBGWTVKUVduR0Y2UW9LMFFPU1dn?=
 =?utf-8?B?UTA1Z3RmM3EzRWcrd3JISW5iN0Rva0RXLzBxOVhsbmhpNEtWMFJocjdwQUZ1?=
 =?utf-8?B?Wkg4S1YyS2xhSzMvcHZtMk4xV1dOV2FsdWJLUXpMd08rV1pNaWZwSDRMN2gv?=
 =?utf-8?B?MkJrS1B5VTFYQnlVVE0ySi93SFlLQnZyN2JvU1lRVjFSRjhuRjM5QnlQeDFX?=
 =?utf-8?B?NkFXdkMzeFRxK2xyMlg4Z3FPd1VCeXg2bE1ITThVTkxuZkFjdWdOOWpzQ0pF?=
 =?utf-8?B?MkRiL3p5aysveXhoWWFZK00xQ1BRY3Q3MU9yMHdPSE1yQVROaGRtRWdRd1RT?=
 =?utf-8?B?RVJDeG5ZRTZwUUE2SEdsRk1BbkQxd3Vmc0E0MW1xMzJHbitHN2Y3YUpDanE3?=
 =?utf-8?B?QmtpdWpYTWhXaW0xT1A1WG8wOCtIUXhla3ZoTnpkbkhGRkFZR0JMdDlya2xp?=
 =?utf-8?B?cXBmTG1JVTUwc1hGc1dVdW54QkFRQzd3c3E1RTdrWW1vbHgveGttY3ZEbDJI?=
 =?utf-8?B?QmRVQXhJSC9MdFoycmdxb0kxbEJxdFEyRU15empqdEl3UUVMVHlBR2p1U2t5?=
 =?utf-8?B?TzVDcW9Lc1p3VXpLYm9hZHQrcVg3SkxhQnE4a2NicTQwUTYzM3RLclRCQ0pV?=
 =?utf-8?B?eEFCSEJiR3ZNYktOZkxOYlZpUjdFZTRkL2pldWFvQ0ZobVdVZWVBc1F5cUQr?=
 =?utf-8?B?aFZoNEtOREVIbEVBVXk2RUtObmVsVk9pbCtsNlpEZWZLbC9xUkdqZCswbzJo?=
 =?utf-8?B?Uk9TTjRsNFpyNVFYQWNQWXdrYjR4amNadFBmdXUvMWhtZlpiUC9aa0J3VGtl?=
 =?utf-8?B?Qlg4Q3ZIYVJ5U2RucXI0Q2xudklOUFkyM0ZJby9VYWc5L0xvMmVkZXZxdHhx?=
 =?utf-8?B?ZVZ3RXFNRTcwZktPTzR2Q2gwblhBNGZzM2RWZEpKVlhmS29HT3luV1F6N05R?=
 =?utf-8?B?d3lTYXJLUjRQY2ZCNHJOc1ZIWXRNNVh2RUxlOWcyNDhMZmdWb0dITkVaenlq?=
 =?utf-8?B?NGN2emZqbGtlb0hvVDJTb0F0SG9Ua0VnSFdWWXlKUml3TkVrNFhpMkRvK09W?=
 =?utf-8?Q?epjPuNzURSpbe4NVfjFboShLgZB8CGkX6LvlUD1eUF+/9?=
X-MS-Exchange-AntiSpam-MessageData-1: wmZ6IFyHeFV4bg==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf9bda53-9329-4ef8-db1b-08df39946ddf
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB6873.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2026 10:22:57.2120
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HNBdYiJd6WWchSkkUeLpBSzT4vMYIghi0Yy5JI8X+QrYYNnErjy3Kr+4zhPt7HPchLsKfTpPmgI9pbObrYFElg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4475

From: John Hubbard <jhubbard@nvidia.com>

The generic falcon bootloader reads its load parameters from a
descriptor that the driver places in DMEM. The r000 load-and-execute
bootloader event carries such a descriptor, so its handler will need the
descriptor type.

The descriptor was defined in the FWSEC code, which was its only user.
Move the definition, unchanged, into the generic bootloader module.

No functional changes.

Assisted-by: LLM
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
[acourbot: keep the fields private, add a constructor and the ctx_dma()
 accessor instead of making every field pub(crate)]
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/firmware/fwsec/bootloader.rs | 95 +++++-----------------
 drivers/gpu/nova-core/firmware/gen_bootloader.rs   | 94 ++++++++++++++++++++-
 2 files changed, 112 insertions(+), 77 deletions(-)

diff --git a/drivers/gpu/nova-core/firmware/fwsec/bootloader.rs b/drivers/gpu/nova-core/firmware/fwsec/bootloader.rs
index 3943948d74bc..ad798ec5645a 100644
--- a/drivers/gpu/nova-core/firmware/fwsec/bootloader.rs
+++ b/drivers/gpu/nova-core/firmware/fwsec/bootloader.rs
@@ -35,60 +35,16 @@
     },
     firmware::{
         fwsec::FwsecFirmware,
-        gen_bootloader::GenericBootloader, //
+        gen_bootloader::{
+            BootloaderDmemDescV2,
+            GenericBootloader, //
+        },
     },
     gpu::Chipset,
     num::FromSafeCast, //
     regs,
 };
 
-/// Structure used by the boot-loader to load the rest of the code.
-///
-/// This has to be filled by the GPU driver and copied into DMEM at offset
-/// [`BootloaderDesc.dmem_load_off`].
-#[repr(C, packed)]
-#[derive(Debug, Clone)]
-struct BootloaderDmemDescV2 {
-    /// Reserved, should always be first element.
-    reserved: [u32; 4],
-    /// 16B signature for secure code, 0s if no secure code.
-    signature: [u32; 4],
-    /// DMA context used by the bootloader while loading code/data.
-    ctx_dma: u32,
-    /// 256B-aligned physical FB address where code is located.
-    code_dma_base: u64,
-    /// Offset from `code_dma_base` where the non-secure code is located.
-    ///
-    /// Also used as destination IMEM offset of non-secure code as the DMA firmware object is
-    /// expected to be a mirror image of its loaded state.
-    ///
-    /// Must be multiple of 256.
-    non_sec_code_off: u32,
-    /// Size of the non-secure code part.
-    non_sec_code_size: u32,
-    /// Offset from `code_dma_base` where the secure code is located (must be multiple of 256).
-    ///
-    /// Also used as destination IMEM offset of secure code as the DMA firmware object is expected
-    /// to be a mirror image of its loaded state.
-    ///
-    /// Must be multiple of 256.
-    sec_code_off: u32,
-    /// Size of the secure code part.
-    sec_code_size: u32,
-    /// Code entry point invoked by the bootloader after code is loaded.
-    code_entry_point: u32,
-    /// 256B-aligned physical FB address where data is located.
-    data_dma_base: u64,
-    /// Size of data block (should be multiple of 256B).
-    data_size: u32,
-    /// Number of arguments to be passed to the target firmware being loaded.
-    argc: u32,
-    /// Arguments to be passed to the target firmware being loaded.
-    argv: u32,
-}
-// SAFETY: This struct doesn't contain uninitialized bytes and doesn't have interior mutability.
-unsafe impl AsBytes for BootloaderDmemDescV2 {}
-
 /// Wrapper for [`FwsecFirmware`] that includes the bootloader performing the actual load
 /// operation.
 pub(crate) struct FwsecFirmwareWithBl<'a> {
@@ -140,9 +96,6 @@ pub(crate) fn new(
         };
 
         let dmem_desc = {
-            // Bootloader payload is in non-coherent system memory.
-            const FALCON_DMAIDX_PHYS_SYS_NCOH: u32 = 4;
-
             let imem_sec = firmware.imem_sec_load_params();
             let imem_ns = firmware.imem_ns_load_params().ok_or(EINVAL)?;
             let dmem = firmware.dmem_load_params();
@@ -154,30 +107,20 @@ pub(crate) fn new(
                 return Err(EINVAL);
             }
 
-            BootloaderDmemDescV2 {
-                reserved: [0; 4],
-                signature: [0; 4],
-                ctx_dma: FALCON_DMAIDX_PHYS_SYS_NCOH,
-                code_dma_base: firmware_dma.dma_address(),
-                // `dst_start` is also valid as the source offset since the firmware DMA object is
-                // a mirror image of the target IMEM layout.
-                non_sec_code_off: imem_ns.dst_start,
-                non_sec_code_size: imem_ns.len,
-                // `dst_start` is also valid as the source offset since the firmware DMA object is
-                // a mirror image of the target IMEM layout.
-                sec_code_off: imem_sec.dst_start,
-                sec_code_size: imem_sec.len,
-                code_entry_point: 0,
-                // Start of data section is the added padding + the DMEM `src_start` field.
-                data_dma_base: firmware_dma
-                    .dma_address()
-                    .checked_add(u64::from_safe_cast(align_padding))
-                    .and_then(|offset| offset.checked_add(dmem.src_start.into()))
-                    .ok_or(EOVERFLOW)?,
-                data_size: dmem.len,
-                argc: 0,
-                argv: 0,
-            }
+            // Start of data section is the added padding + the DMEM `src_start` field.
+            let data_dma_base = firmware_dma
+                .dma_address()
+                .checked_add(u64::from_safe_cast(align_padding))
+                .and_then(|offset| offset.checked_add(dmem.src_start.into()))
+                .ok_or(EOVERFLOW)?;
+
+            BootloaderDmemDescV2::new(
+                &imem_ns,
+                &imem_sec,
+                &dmem,
+                firmware_dma.dma_address(),
+                data_dma_base,
+            )
         };
 
         Ok(Self {
@@ -203,7 +146,7 @@ pub(crate) fn run(&self, dev: &Device<device::Bound>, falcon: &Falcon<'_, Gsp>)
 
         // Configure DMA index for the bootloader to fetch the FWSEC firmware from system memory.
         falcon.pfalcon.update(
-            regs::NV_PFALCON_FBIF_TRANSCFG::try_at(usize::from_safe_cast(self.dmem_desc.ctx_dma))
+            regs::NV_PFALCON_FBIF_TRANSCFG::try_at(usize::from_safe_cast(self.dmem_desc.ctx_dma()))
                 .ok_or(EINVAL)?,
             |v| {
                 v.with_target(FalconFbifTarget::CoherentSysmem)
diff --git a/drivers/gpu/nova-core/firmware/gen_bootloader.rs b/drivers/gpu/nova-core/firmware/gen_bootloader.rs
index d51948c6a2b8..a3de545731f5 100644
--- a/drivers/gpu/nova-core/firmware/gen_bootloader.rs
+++ b/drivers/gpu/nova-core/firmware/gen_bootloader.rs
@@ -8,7 +8,8 @@
 use kernel::{
     device,
     prelude::*,
-    ptr::Alignable, //
+    ptr::Alignable,
+    transmute::AsBytes, //
 };
 
 use crate::{
@@ -16,6 +17,7 @@
         self,
         gsp::Gsp,
         Falcon,
+        FalconDmaLoadTarget,
         FalconPioImemLoadTarget, //
     },
     firmware::tlv::{
@@ -26,6 +28,96 @@
     num::FromSafeCast, //
 };
 
+/// Structure used by the boot-loader to load the rest of the code.
+///
+/// This has to be filled by the GPU driver and copied into DMEM at offset
+/// [`BootloaderDesc.dmem_load_off`].
+#[repr(C, packed)]
+#[derive(Debug, Clone)]
+pub(crate) struct BootloaderDmemDescV2 {
+    /// Reserved, should always be first element.
+    reserved: [u32; 4],
+    /// 16B signature for secure code, 0s if no secure code.
+    signature: [u32; 4],
+    /// DMA context used by the bootloader while loading code/data.
+    ctx_dma: u32,
+    /// 256B-aligned physical FB address where code is located.
+    code_dma_base: u64,
+    /// Offset from `code_dma_base` where the non-secure code is located.
+    ///
+    /// Also used as destination IMEM offset of non-secure code as the DMA firmware object is
+    /// expected to be a mirror image of its loaded state.
+    ///
+    /// Must be multiple of 256.
+    non_sec_code_off: u32,
+    /// Size of the non-secure code part.
+    non_sec_code_size: u32,
+    /// Offset from `code_dma_base` where the secure code is located (must be multiple of 256).
+    ///
+    /// Also used as destination IMEM offset of secure code as the DMA firmware object is expected
+    /// to be a mirror image of its loaded state.
+    ///
+    /// Must be multiple of 256.
+    sec_code_off: u32,
+    /// Size of the secure code part.
+    sec_code_size: u32,
+    /// Code entry point invoked by the bootloader after code is loaded.
+    code_entry_point: u32,
+    /// 256B-aligned physical FB address where data is located.
+    data_dma_base: u64,
+    /// Size of data block (should be multiple of 256B).
+    data_size: u32,
+    /// Number of arguments to be passed to the target firmware being loaded.
+    argc: u32,
+    /// Arguments to be passed to the target firmware being loaded.
+    argv: u32,
+}
+
+impl BootloaderDmemDescV2 {
+    /// Context DMA slot through which the bootloader reads the image: physical, non-coherent
+    /// system memory.
+    const FALCON_DMAIDX_PHYS_SYS_NCOH: u32 = 4;
+
+    /// Creates the descriptor of an image whose code is at `code_dma_base` and whose data is at
+    /// `data_dma_base`.
+    ///
+    /// `imem_ns` and `imem_sec` locate the non-secure and secure code in the image, and `dmem`
+    /// gives the size of its data. The code DMA object must be a mirror image of the target IMEM
+    /// layout, because the bootloader uses the destination offset of each code segment as its
+    /// source offset too.
+    pub(crate) fn new(
+        imem_ns: &FalconDmaLoadTarget,
+        imem_sec: &FalconDmaLoadTarget,
+        dmem: &FalconDmaLoadTarget,
+        code_dma_base: u64,
+        data_dma_base: u64,
+    ) -> Self {
+        Self {
+            reserved: [0; 4],
+            signature: [0; 4],
+            ctx_dma: Self::FALCON_DMAIDX_PHYS_SYS_NCOH,
+            code_dma_base,
+            non_sec_code_off: imem_ns.dst_start,
+            non_sec_code_size: imem_ns.len,
+            sec_code_off: imem_sec.dst_start,
+            sec_code_size: imem_sec.len,
+            code_entry_point: 0,
+            data_dma_base,
+            data_size: dmem.len,
+            argc: 0,
+            argv: 0,
+        }
+    }
+
+    /// Returns the context DMA slot through which the bootloader reads the image.
+    pub(crate) fn ctx_dma(&self) -> u32 {
+        self.ctx_dma
+    }
+}
+
+// SAFETY: This struct doesn't contain uninitialized bytes and doesn't have interior mutability.
+unsafe impl AsBytes for BootloaderDmemDescV2 {}
+
 /// The generic falcon bootloader image and its IMEM load parameters.
 pub(crate) struct GenericBootloader {
     /// Bootloader code, zero-padded to a whole number of falcon memory blocks.

-- 
2.56.0

