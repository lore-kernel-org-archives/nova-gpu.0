Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.196.57
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794306080;
	b=fo2VU20dKuGhdttL8k8Sqn9+8dDXqIPN0PUJGzIsLYx9LGtBheUmEZ/iznToA8A4EJ+w
	 FK9hqjhLfCFrTCX1s19L9xh1twyXhViicHmNa+eA0fg4tMWK5kv/qTV7miMv2CF12CBPx
	 dW6NrvhEHLKZ8rC3YYQXscwUPvz/4uqZQk/k4FfJwQUNhyxTJmxDaCq2qbNAeSdIDuEfl
	 Tw6yODJlZS51XZTnDrs3TIRlJZKMZVTXIpVHswf6aHAgUlvQHs4MeFpy4qX20i2ueEIQU
	 Q1vZTlcEXr6BlC64FaXf1vlCIJShIxtdrJlQPcOwbLxTbNNZfWJHwvAz06Q0jKPRxgw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794306080;
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
	bh=gdGgpKSsBeGlZ514ZAWnjP7W5qt4Ly3Fy+6cuRWWKvQ=;
	b=cc+qphs5JnvPx8I+6LkD3X2zSIhq6WO5Z2uPakfsUhmF/xymbq9GCxmusB/3de9aqMB/
	 EUdBGwBBR5YGwtlT1xi7lFcrPyUOnw5UqQJLvbjR9K3njpSoAMjR3fS3kDw/CMkKmoTpp
	 p7ZSH898X/Q1sHG471xF2K9OitzuVNDyU03N1CCdgHxp1+6eRQLyqvuJrzkaY5IO+elHY
	 HbkbLN/fdz+UKJ+b+z6udzHVGCbg2ntmJKZ+H+o0oifGA3adxPSB0SDfqzvAz4MtSgUga
	 iCvPKOes5P/xZMDeQnttpgFUsjH56yhtu5br5VWvlsrxew+yzuNdZiTWUe5Avw+H1Qw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=LGSDPUHL;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.196.57
Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013057.outbound.protection.outlook.com [40.93.196.57])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABBCC60710E2
	for <nova-gpu@lists.linux.dev>; Tue, 10 Nov 2026 10:21:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ABBCC60710E2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=LGSDPUHL
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fq74BWZEC2ck7K+E0smgsvPAv4bnlvT+qS0ZJ0yt2elbkHinzz1KbOgRKBpX9fXpq+yW2J9Ts6zu0V3caYQk2hp95iqQRiFZTdhwt8KN7AqtLqldSEASOQjUd2m+P+IE69AS84Zri5v63OVxvhgoY9IluKchsyQ0xzb5kbxsouYPKofMrcsTb7n9FgjCVaqWwvYQ4Sh1wKKq85JxTPxb12TGQk2p8szqC+grY/eRT9GpeGQJ9XFQLFLeFp9SD4Wf0I4MFf/B6GSnJlVlJUmn3ysc9PWm6LG0ColgGdD7HeFC/CxJaEgK3TXvG4bNXvCfjFSSMdGEZ9uStEXQSK/lGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gdGgpKSsBeGlZ514ZAWnjP7W5qt4Ly3Fy+6cuRWWKvQ=;
 b=nRGWCQ4nWv61cv2dusThOEGPUQD5egZD76S8Px2UhymKYzvY+vlWfaZOX9qKwHr6gf2tYB5ayz88zAQyCLTCyDHIuXDbF3SxR3Peq25MsGHQGNGJcV+0PowMTdhzfZcSMe3qjKfsbTpAaT3JvDaYcZhv0Z+iy02Sj3fWC7GbfOCBC1RmXBg9Y+JFRS1xY9Piv2DA1bPKcelpvUBPpNdqS8JJM9cep1siaQo7moHNPS5Iy6iy8M2vnVQ46MN4iPpkGCAOKXEPaLcqLqxd6ilKA3eF+O2wBja9iiZ1zTIaumXGcBKkwud4AbTsq3uTWGyvbJ6Yxmx16HopsJluwHj9Lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gdGgpKSsBeGlZ514ZAWnjP7W5qt4Ly3Fy+6cuRWWKvQ=;
 b=LGSDPUHL14XQknuKUph5DldrcBtzCdKaxp452l3ZZwOl5sjX/THUo4G7uGjDz4/yt/0p1aM1nPZhxJ36lKJXPiGZfF7qJDgzvWbkmL4VS08jwidRvdr0KKxvELY3yfIhQoxFCyWdL6U4cnsa3pKf68CrljcklDjg2ZYRVqu0IlbooEVUVcLxx/N0c15Y2indZoIdioZnLnK1WP+M+1AAVOfwYwKf5w3KsRAgYAMJem/gDq7xiS0493LsWPppn+a31HinK1n3A6WpR/ML/0xZYxGXa682QvKszHnjf1c0Vl4sYoUEKJKaivYrY756qTLWiZaWJkgNoM9SJADfUv84Og==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MW4PR12MB6873.namprd12.prod.outlook.com (2603:10b6:303:20c::17)
 by SAEPR12MB328447.namprd12.prod.outlook.com (2603:10b6:802:209::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Tue, 10 Nov
 2026 10:21:16 +0000
Received: from MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1]) by MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1%5]) with mapi id 15.21.0592.010; Tue, 10 Nov 2026
 10:21:16 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Tue, 10 Nov 2026 19:20:53 +0900
Subject: [PATCH v3 04/13] gpu: nova-core: run the generic bootloader from
 its own type
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261110-r000-fw-v3-4-20d79ebb646f@nvidia.com>
References: <20261110-r000-fw-v3-0-20d79ebb646f@nvidia.com>
In-Reply-To: <20261110-r000-fw-v3-0-20d79ebb646f@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: John Hubbard <jhubbard@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Eliot Courtney <ecourtney@nvidia.com>, Zhi Wang <zhiw@nvidia.com>, 
 nova-gpu@lists.linux.dev, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: TYCP286CA0271.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c9::16) To MW4PR12MB6873.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MW4PR12MB6873:EE_|SAEPR12MB328447:EE_
X-MS-Office365-Filtering-Correlation-Id: a78c1c82-b741-4f69-a3f9-08df3f145a9b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|10070799003|23010399003|10067099003|11063799006|56012099006|261022105027099003|261021123027099003|261022075727099003|261021121427099003|261022115727099003|261026140227099003|261026121527099003|261028144727099003|261102123227099003|261009223027099003|18002099003|22082099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	tdHD0LDDQoEqMsgn7GaGq28TdUAaA+Y28RdA2A94IKSGkiONYRAlfXCJVeCkLYQUFfIO5TQANtKoMUlNX5o/bToMR4I39Uff2FI7SrtlTsRy42V8vODF3EyPvl81TJOIPCWhes7C/xzGbuhkt7ggsKQcM5cstmlD58yHFdLsMPpojtivxhWcWR2ZInbAdZ6vMLijOrYIEZbJlqh2BQXDM94ubdiAeTMt9WNq4+TYrchb0x7IRcwfxmt5UKZ1pFBX/iNmF8PWjLg3bZZJLerwVuMZOKB6VpogiC6V5tPc3jVz4EGfGDy/ncI8JKDB7tq8q2VHRv01g3H+ox9RtZ5NYp12TeW2zN3PRwnT/yp1fB504yvDYqH2Nsrs+WZF+L09F8wqh7Jjs0fsEwvrqCdFd8WL0MEofjzPgpcCnA1e3kWbYNA5Zfi+oMszZGm4PaqxcydLAkdyWYP7EfQ/WaxywTLJqN5AXUxXca0MD8Ol7CTDPfEpjub9TKR+3R/fcUnbiVw0c3BpBUmfb54w7nRc6g5Bx2dlq95sRvW7KpMq7W7KXPCloa+TejZIowa+eRQ89la3X252kw/cqrPcJM7YYog/z4IlQ8HuWZvwMAkRdqTACXRjNzpStTi9Sx/X1oB99ORGHgbqgo0aMip3GTjUlEN1pFRoJ3RTg4HTIxP41tY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR12MB6873.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(10070799003)(23010399003)(10067099003)(11063799006)(56012099006)(261022105027099003)(261021123027099003)(261022075727099003)(261021121427099003)(261022115727099003)(261026140227099003)(261026121527099003)(261028144727099003)(261102123227099003)(261009223027099003)(18002099003)(22082099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Ui9raVhsOTdEMHdYKzlzczN5UUZQd2I0c1lJMkd2TTB3clhZdTdDS3UzV1R0?=
 =?utf-8?B?SEZjUmFDc2tYS2FKczRmclVGSWdqNUJ6U21EaERMaU9oelA2L3oyUEZxVFZz?=
 =?utf-8?B?RDMxWEd0ZWRsNzdJdE54bm5yUlRkbmV6SjBEalFWOGxwbTUxNytsQmEzdjlY?=
 =?utf-8?B?Q1JkS0pjMzBqbjV6WHBHaFU5Qmo5UlgzNkZLZHdQcEVzNllOaEpjZHl1c3cv?=
 =?utf-8?B?TFA4NDRsam5ieGU2dFZxQUNBRDNLMWtSeGQrL3I1VEZZR1MzSzQ2cmI5KzBl?=
 =?utf-8?B?Vk13SHp1NzkrSndHcmwwS0NHQi82T2hUYXJtZnJpcnA0alZGekpZNDZoR1lv?=
 =?utf-8?B?c2VVUWZuTk9XLytLR1ZTVGhraVJGK0haV1VmV3oveXFlRzdnYjlXQTNmNUZG?=
 =?utf-8?B?MmpzTGUvbSt6QVdlRW5MQktBUjV6NTk2WXlIMWZEdnQxNXhXWHlmNS9oYzB0?=
 =?utf-8?B?R3U5b2NkaGp6T0FFRzFmV09sNmJSUmRxSnY3VVBpeTRIUXlrTk5SY3d5aklr?=
 =?utf-8?B?cGJaQVh3Z0JLblY2NVg4MFhISjMxdDRDZDNrNVlad2N1WEFaOCtuZDBDS0Zn?=
 =?utf-8?B?VHZEdnZDeDVKTlN5amVOMjFtMHlHTEp4UEJQQm1NQVc3bUMrYk5aK3RiTk9N?=
 =?utf-8?B?QUpBRUNGSXJVQnY2UE5tcHVtT05hRXFJUUdIOWpZYjh6RHlXVExMSm9lajlX?=
 =?utf-8?B?by9ReFU3VEV6djFOTFZuRnJPQVo5NzNMZ3pIYUR1NG90dW9xU0xabXF2ZDk5?=
 =?utf-8?B?L1NLamU3SlZnaTdNWnk0aUJuMzRkRzVDY3dIUnpKYWZBRC9ZQTBXYjJRd1Av?=
 =?utf-8?B?ZG1iUm1tQnNnMkxMTU5TbnZCdWkxTXJzRm5RZ3Y2UTBaTUhKbkgvWGVwNnhi?=
 =?utf-8?B?OFZ1UG1XemQxcDVKSENzQmhiNWliN3FIMTdRUEJzblVvbFJZYzE2WU5saUhy?=
 =?utf-8?B?UXhMdjlBMzEzK1VTdEtzZk9oSy9PNFhJMjkwN05XUU0vUlZmM05NZU9tc1Az?=
 =?utf-8?B?SE1pbm5MbWF0SGN3UTUxdzlDTTl4WXdRNkVUWXlZZVBSUGhwRnU4Tjh3M3ZX?=
 =?utf-8?B?WW5FNnlvM3JYMWU3NmxPaDdHVWtVd0QxMVZtdU5pMFI5K0tqSVBtMkM0NlBJ?=
 =?utf-8?B?bG1CdWdGUXhRRXBUNk9ldjZBVGNRWXk2R1ZIVXZxKzF2QmlaNWRUUmJ4aktx?=
 =?utf-8?B?Mk5YQUo1eFRxNGxQTmtkZkNnUnhOQmsxV1l1b3JmVWV3Y0hWUjBNUlRGK2sv?=
 =?utf-8?B?L0duWlQvbGZRR1dFZFVveDBmRDRqWkIyeFV5UzRWakRMN0d3Y1l0UC90eUtL?=
 =?utf-8?B?R1h1NXBqdy82MFlaRHZlZ0VaekUzYzFYUkNLT2toVXVDMW80TEFKNzJMYTdh?=
 =?utf-8?B?Qk1Qb2RXbFFyZHdna1dyS01ZQVlDWHErdzZBbWIvNTBBZWQrSkI4MTU4eDNS?=
 =?utf-8?B?c3FkN3JJeURldUZSKys1T01OTHBvbWRiWW1rKzcvTml1dTVlRkVKUTNzSzlZ?=
 =?utf-8?B?cnlkY1lCdXdtV24vdVFBUmFrZmNqN0JrL3JyYjZGSlR1LzRkejNSUEViNXVU?=
 =?utf-8?B?QmRVbEp1a0hFVlBuTnJITDlsenB2cktBTkFvSzhLRUZNc0dZK2FaaTZPZXJv?=
 =?utf-8?B?c1RYZDNNajlkWFRENzQ1N3JUdjloZXJ1UjVTZW1FcHpQcUJobHZOTXNKOGtw?=
 =?utf-8?B?NDlmbXJrQnkycXBieDJYVURsTVBWK0lWM0VWa0twdGJraXRjeS9xSmcxQXQz?=
 =?utf-8?B?ZVhWY2NJR28yYUtkVWRNU096S0ZESUtiejZGMHdyMHpGbDNUZlk1cFdVRW8v?=
 =?utf-8?B?RGxkNFp1NnNhNXBQa2xYWDF3aWxSR2preUJUSjIxQVAxdnMwY2diT3pPUVB0?=
 =?utf-8?B?WXF1VzdvM0I1SDZKWDNTQWdwSGxWSVpOYitMTUpXOHJzQmRLT2pJMURxQ1RI?=
 =?utf-8?B?TjJiK3o3Z1paakxQYldJTnJqY1RDRDh3cGxFcFJDdFYzbVRqUFBkTDRwclJN?=
 =?utf-8?B?RnRVZmtSMmF1RFBLVmMyU3MwOFRuY0xUZms1Q1VyRlBqSmZRMXFISUx5bkcr?=
 =?utf-8?B?cDhBUGJISFlCc09USHg1L1hDdEJ1SlJFUHpTU0RWZFptck1zeWkzdktEWmE4?=
 =?utf-8?B?SG9CYXVVSmljS2VkVjlYaXdNMmg0MVJjSGtPK0lLWWVKdUF1Qy80aktSRTFy?=
 =?utf-8?B?cVBYVjMyd1YzUXZZdGxkNE9tZzVGZHpCaFBucFZSdFl6ZFBxR2h2NjN3TWJM?=
 =?utf-8?B?NFZiRE1iWnZ0UVlyb3piMmxEWFhBdXAvcFZnRktmNU5ISEs0d0ZaNWc0RHJS?=
 =?utf-8?B?TU9xUGhOTjNhL3k2WU5xd3VIUWNYMVZVS0E4TFZNN3Fra0FSSmtHRVlZL3Zu?=
 =?utf-8?Q?giiNF/wAExNP5LQf6Mhwki3m303M0mctBdoYgfcKVFWYq?=
X-MS-Exchange-AntiSpam-MessageData-1: 90z3p6Pfdw/YbQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a78c1c82-b741-4f69-a3f9-08df3f145a9b
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB6873.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2026 10:21:16.3598
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U/VVqkb5ToLJ5eCEKaV0NyPqVAkCgqgBUm4kjWqR8bTdRkbB3Z7hBvgfVDeB8zem9YzbeHDk8CzWfaTa+SEHSQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SAEPR12MB328447

From: John Hubbard <jhubbard@nvidia.com>

The generic falcon bootloader needs a descriptor in DMEM to know what to
load, so loading it into a falcon means loading the two together by PIO
and starting the falcon. The FWSEC wrapper did that through its own
implementation of the PIO loading traits. The r000 load-and-execute
bootloader event will need to do the same thing.

Give the generic bootloader a run method, which pairs it with the
descriptor that it receives, loads the pair by PIO, starts the falcon
with the given MAILBOX0 value and returns the mailboxes once the falcon
has halted. This will allow the FWSEC and r000 load-and-execute
bootloader event to share the same code.

No functional changes.

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
Co-developed-by: Alexandre Courbot <acourbot@nvidia.com>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
Reviewed-by: Eliot Courtney <ecourtney@nvidia.com>
---
 drivers/gpu/nova-core/firmware/fwsec/bootloader.rs |  70 ++------------
 drivers/gpu/nova-core/firmware/gen_bootloader.rs   | 107 +++++++++++++++++++--
 2 files changed, 104 insertions(+), 73 deletions(-)

diff --git a/drivers/gpu/nova-core/firmware/fwsec/bootloader.rs b/drivers/gpu/nova-core/firmware/fwsec/bootloader.rs
index e7933b5af201..461e5e6f7899 100644
--- a/drivers/gpu/nova-core/firmware/fwsec/bootloader.rs
+++ b/drivers/gpu/nova-core/firmware/fwsec/bootloader.rs
@@ -12,26 +12,15 @@
         Device, //
     },
     dma::Coherent,
-    io::{
-        register::Array,
-        Io, //
-    },
-    prelude::*,
-    transmute::AsBytes,
+    prelude::*, //
 };
 
 use crate::{
     falcon::{
         gsp::Gsp,
         Falcon,
-        FalconBromParams,
         FalconDmaLoadable,
-        FalconFbifMemType,
-        FalconFbifTarget,
-        FalconFirmware,
-        FalconPioDmemLoadTarget,
-        FalconPioImemLoadTarget,
-        FalconPioLoadable, //
+        FalconFbifTarget, //
     },
     firmware::{
         fwsec::FwsecFirmware,
@@ -42,7 +31,6 @@
     },
     gpu::Chipset,
     num::FromSafeCast, //
-    regs,
 };
 
 /// Wrapper for [`FwsecFirmware`] that includes the bootloader performing the actual load
@@ -54,8 +42,6 @@ pub(crate) struct FwsecFirmwareWithBl<'a> {
     bootloader: GenericBootloader,
     /// Descriptor to be loaded into DMEM for the bootloader to read.
     dmem_desc: BootloaderDmemDescV2,
-    /// BROM parameters of the loaded firmware.
-    brom_params: FalconBromParams,
 }
 
 impl<'a> FwsecFirmwareWithBl<'a> {
@@ -127,7 +113,6 @@ pub(crate) fn new(
             _firmware_dma: firmware_dma,
             bootloader,
             dmem_desc,
-            brom_params: firmware.brom_params(),
         })
     }
 
@@ -136,26 +121,14 @@ pub(crate) fn new(
     /// The bootloader will load the FWSEC firmware and then execute it. This function returns
     /// after FWSEC has reached completion.
     pub(crate) fn run(&self, dev: &Device<device::Bound>, falcon: &Falcon<'_, Gsp>) -> Result<()> {
-        // Reset falcon, load the firmware, and run it.
         falcon
             .reset()
             .inspect_err(|e| dev_err!(dev, "Failed to reset GSP falcon: {:?}\n", e))?;
-        falcon
-            .pio_load(self)
-            .inspect_err(|e| dev_err!(dev, "Failed to load FWSEC firmware: {:?}\n", e))?;
 
-        // Configure DMA index for the bootloader to fetch the FWSEC firmware from system memory.
-        falcon.pfalcon.update(
-            regs::NV_PFALCON_FBIF_TRANSCFG::try_at(usize::from_safe_cast(self.dmem_desc.ctx_dma()))
-                .ok_or(EINVAL)?,
-            |v| {
-                v.with_target(FalconFbifTarget::CoherentSysmem)
-                    .with_mem_type(FalconFbifMemType::Physical)
-            },
-        );
-
-        let (mbox0, _) = falcon
-            .boot(Some(0), None)
+        // Run the bootloader, which loads the FWSEC firmware and runs it.
+        let (mbox0, _) = self
+            .bootloader
+            .run(falcon, &self.dmem_desc, FalconFbifTarget::CoherentSysmem, 0)
             .inspect_err(|e| dev_err!(dev, "Failed to boot FWSEC firmware: {:?}\n", e))?;
         if mbox0 != 0 {
             dev_err!(dev, "FWSEC firmware returned error {}\n", mbox0);
@@ -165,34 +138,3 @@ pub(crate) fn run(&self, dev: &Device<device::Bound>, falcon: &Falcon<'_, Gsp>)
         }
     }
 }
-
-impl FalconFirmware for FwsecFirmwareWithBl<'_> {
-    type Target = Gsp;
-
-    fn brom_params(&self) -> FalconBromParams {
-        self.brom_params.clone()
-    }
-
-    fn boot_addr(&self) -> u32 {
-        // On V2 platforms, the boot address is extracted from the generic bootloader, because the
-        // gbl is what actually copies FWSEC into memory, so that is what needs to be booted.
-        self.bootloader.boot_addr()
-    }
-}
-
-impl FalconPioLoadable for FwsecFirmwareWithBl<'_> {
-    fn imem_sec_load_params(&self) -> Option<FalconPioImemLoadTarget<'_>> {
-        None
-    }
-
-    fn imem_ns_load_params(&self) -> Option<FalconPioImemLoadTarget<'_>> {
-        Some(self.bootloader.imem_load_params())
-    }
-
-    fn dmem_load_params(&self) -> FalconPioDmemLoadTarget<'_> {
-        FalconPioDmemLoadTarget {
-            data: self.dmem_desc.as_bytes(),
-            dst_start: 0,
-        }
-    }
-}
diff --git a/drivers/gpu/nova-core/firmware/gen_bootloader.rs b/drivers/gpu/nova-core/firmware/gen_bootloader.rs
index b7aac9a25a53..2f42d3ad1ba5 100644
--- a/drivers/gpu/nova-core/firmware/gen_bootloader.rs
+++ b/drivers/gpu/nova-core/firmware/gen_bootloader.rs
@@ -7,6 +7,10 @@
 
 use kernel::{
     device,
+    io::{
+        register::Array,
+        Io, //
+    },
     num::{
         Bounded,
         TryIntoBounded, //
@@ -20,15 +24,24 @@
 use crate::{
     falcon::{
         self,
+        gsp::Gsp,
+        Falcon,
+        FalconBromParams,
         FalconDmaLoadTarget,
-        FalconPioImemLoadTarget, //
+        FalconFbifMemType,
+        FalconFbifTarget,
+        FalconFirmware,
+        FalconPioDmemLoadTarget,
+        FalconPioImemLoadTarget,
+        FalconPioLoadable, //
     },
     firmware::tlv::{
         request_tlv, //
         Tlv,
     },
     gpu::Chipset,
-    num::FromSafeCast, //
+    num::FromSafeCast,
+    regs, //
 };
 
 /// Structure used by the boot-loader to load the rest of the code.
@@ -111,11 +124,6 @@ pub(crate) fn new(
             argv: 0,
         }
     }
-
-    /// Returns the context DMA slot through which the bootloader reads the image.
-    pub(crate) fn ctx_dma(&self) -> u32 {
-        self.ctx_dma
-    }
 }
 
 // SAFETY: This struct doesn't contain uninitialized bytes and doesn't have interior mutability.
@@ -179,12 +187,12 @@ pub(crate) fn new(dev: &device::Device, chipset: Chipset) -> Result<Self> {
 
     /// Returns the address at which the falcon starts executing the bootloader: the IMEM virtual
     /// address of its first code block.
-    pub(crate) fn boot_addr(&self) -> u32 {
+    fn boot_addr(&self) -> u32 {
         u32::from(self.start_tag) << 8
     }
 
     /// Returns the PIO parameters that place this bootloader in non-secure IMEM.
-    pub(crate) fn imem_load_params(&self) -> FalconPioImemLoadTarget<'_> {
+    fn imem_load_params(&self) -> FalconPioImemLoadTarget<'_> {
         FalconPioImemLoadTarget {
             data: self.ucode.as_ref(),
             dst_start: self.imem_dst_start,
@@ -192,4 +200,85 @@ pub(crate) fn imem_load_params(&self) -> FalconPioImemLoadTarget<'_> {
             start_tag: self.start_tag,
         }
     }
+
+    /// Runs the bootloader on `falcon` to load and start the image that `dmem_desc` names.
+    ///
+    /// The bootloader and the descriptor are loaded by PIO, the bootloader is started with `mbox0`
+    /// in `MAILBOX0`, and this returns the mailbox values once the falcon has halted, that is,
+    /// once the loaded image has run to completion.
+    ///
+    /// The caller is expected to reset `falcon` beforehand.
+    ///
+    /// # Errors
+    ///
+    /// - `ETIMEDOUT` if the falcon has not halted within two seconds of starting.
+    /// - `EINVAL` if `dmem_desc`'s DMA context isn't valid.
+    ///
+    /// Errors from the PIO load are propagated as-is.
+    pub(crate) fn run(
+        &self,
+        falcon: &Falcon<'_, Gsp>,
+        dmem_desc: &BootloaderDmemDescV2,
+        target: FalconFbifTarget,
+        mbox0: u32,
+    ) -> Result<(u32, u32)> {
+        // Configure DMA index for the bootloader to fetch the FWSEC firmware from system memory.
+        falcon.pfalcon.update(
+            regs::NV_PFALCON_FBIF_TRANSCFG::try_at(usize::from_safe_cast(dmem_desc.ctx_dma))
+                .ok_or(EINVAL)?,
+            |v| {
+                v.with_target(target)
+                    .with_mem_type(FalconFbifMemType::Physical)
+            },
+        );
+
+        falcon.pio_load(&GenericBootloaderLoad {
+            bootloader: self,
+            dmem_desc,
+        })?;
+
+        falcon.boot(Some(mbox0), None)
+    }
+}
+
+/// The generic bootloader together with the descriptor that it reads from DMEM offset 0, as one
+/// firmware that [`Falcon::pio_load`] accepts.
+struct GenericBootloaderLoad<'a> {
+    bootloader: &'a GenericBootloader,
+    dmem_desc: &'a BootloaderDmemDescV2,
+}
+
+impl FalconFirmware for GenericBootloaderLoad<'_> {
+    type Target = Gsp;
+
+    fn brom_params(&self) -> FalconBromParams {
+        // The bootloader is unsigned, and the falcon HALs of the chipsets that load it this way
+        // write no BROM registers, so these values never reach hardware.
+        FalconBromParams {
+            pkc_data_offset: 0,
+            engine_id_mask: 0,
+            ucode_id: 0,
+        }
+    }
+
+    fn boot_addr(&self) -> u32 {
+        self.bootloader.boot_addr()
+    }
+}
+
+impl FalconPioLoadable for GenericBootloaderLoad<'_> {
+    fn imem_sec_load_params(&self) -> Option<FalconPioImemLoadTarget<'_>> {
+        None
+    }
+
+    fn imem_ns_load_params(&self) -> Option<FalconPioImemLoadTarget<'_>> {
+        Some(self.bootloader.imem_load_params())
+    }
+
+    fn dmem_load_params(&self) -> FalconPioDmemLoadTarget<'_> {
+        FalconPioDmemLoadTarget {
+            data: self.dmem_desc.as_bytes(),
+            dst_start: 0,
+        }
+    }
 }

-- 
2.56.0

