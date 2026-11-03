Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.56.40
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793701388;
	b=A/DdLL4Cmp+1aeIy+ZhGp8xCVlH5KdYB7Ur5zXpSDHrftfBVLwUA5rYJyk9/cT8/M8Zn
	 F2haXthxOe1PZttUMgpUphCwmN4aE3Klhq4PL5jkBU0kZJrXpvSokXQjjnE+koCjLOGih
	 KM8ozTJfutMTYazqQecA+tKuGV8gWYMkL8qnRZr7Oul768B5t+A/rdfgXZh6mfAyfTHr/
	 +4rb1nIQtiF+7E+IB2XbfZttQribyakv4V47o2cSb3AiiISqleb7uOjjwHIhfONtDOdt7
	 axFRQtRUi4kO2ynqvKXaf6LaFP4GByrPk+KO8qs5EJvOEnEJUFKquDJ/k+JcuK1Z+/w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793701388;
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
	bh=0ow7y3xOCCm7ia/YovVDyjMWPBk/rAKxyTNO02ElnB0=;
	b=CS7YVD6nFOz1jJ1NbPnFMCTurQZkL5K4HbTNkC3QDiEaE0Wg9jZ81W9yS8UFxDDaHnqN
	 ho1sjFwSwchkzmdjmnXFSXOhWjCzqvgv9OJaBxZyKOMBqykpkLGeunm37yp5VFqlpsDC/
	 ZtXr3I24Ed4kRqrt/TwpLgD3qtVYkuWHLGKI+ozhI5x+PwzDWrnaquir121zywRAzWhHQ
	 ndtP04dg3VQEvw4xcLwSKCE9Oi4sXuJNIaXUh2N5i0LXiFG8gjsymaOyjuliYzrafmB5n
	 7NaUB911cBYOd36nXwpL1mt/X4DOREJslMwjXG59ChheV5tO4e8kBsUnbp5lilfWuFw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=cmXP6jhJ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.56.40
Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010040.outbound.protection.outlook.com [52.101.56.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D028E60850A4
	for <nova-gpu@lists.linux.dev>; Tue,  3 Nov 2026 10:23:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D028E60850A4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=cmXP6jhJ
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v1iEVqvPPI9ieWGpXAXefsSmWJ+aA/x96b8N+qBETL9tf1auOYarAR2WCA9N4GCvdbtZfceGjCG3Gu2hlziHSPucVX6DNvgeSVFrpRgZXPwkwu/54aLl9sSKc464C9CkqbruGCRFmsYpOVlCOmPdQB+F+Z9UeYcrIbxb++87vK0yw9GVj/JcSDITpSDQenKHodmEl/DdbWe58KxQM1vh37xMOVh9Xul6EGh9hX2R8ILER5/gQIT4E/WytwmueOQN0NltAPBfTjnM2tfTV9KMLbfZFLbtXKvMJeCkroCIMIIKs6d0vTUdW9yLXSrocZtK6D5Mk+GiKreCdUPClbBEaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0ow7y3xOCCm7ia/YovVDyjMWPBk/rAKxyTNO02ElnB0=;
 b=M2UcB1csahqbZxospLALHeafVDulXDtET26Yv5VtA4Xwp3h8jBU342SBicpyYpV4xLphG9eHi7zQHHoUMBxKyzSB+Y/aBIGXRqkYQfkVkJzTQXzhRH8M6O+q1f/JYusE7lm79YFmmqK+K5Dh7b9JYeJsArc150CK/pIpGCDEyMkzx2BiurrrkLxHvF1JJtt+ZAs6OdZLVJzQlvEdZKaWJF+Q7ZRgzDS9XJrSjxxSwE+w6DU7WYPAyYzFC+f+fmVCOjpYmo9QiHYZg2HjviWjPgd6bfnlt8CyliMXS19p1p7OEFsxGZwXGMRNm4mslFj8J0wzo3q1dlJx/QevfIYu0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0ow7y3xOCCm7ia/YovVDyjMWPBk/rAKxyTNO02ElnB0=;
 b=cmXP6jhJTYojYwxodyky1XsbPXb1M+jbxJKV/J+8tzsOvpw6OTbhbWO4Sl+WSTFooHRZNMOKSMq0oNHsbclnvJ+mZYkF2pw3ZvU1vIIgkmrdveW9Gvzx4lNbbmakEW5y4I7KY68gAVnKN6KYkQLjMWYGe8vfReowJPyS7MH4T/vQSVIsShBS48qekTuVRCrkEAzR0br+cRP2AygBeahTi59Bao51LyPFnC5vzXpd/UqzxX26avKPzMJOfvQjoKpuAvZ3kG1oAxWwiLxP2jpQJ2+0MUf/8zPZMfPSj/Wx+0ZzqHSCSNaZf9b9OLDcMv8nb+IkWKBIDHa+gtvfTNUZGg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MW4PR12MB6873.namprd12.prod.outlook.com (2603:10b6:303:20c::17)
 by BL1PR12MB5756.namprd12.prod.outlook.com (2603:10b6:208:393::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Tue, 3 Nov
 2026 10:23:04 +0000
Received: from MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1]) by MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1%5]) with mapi id 15.21.0592.007; Tue, 3 Nov 2026
 10:23:03 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Tue, 03 Nov 2026 19:22:43 +0900
Subject: [PATCH 5/7] gpu: nova-core: falcon: allow DMEM DMA transfers to
 request tagging
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261103-r000-fw-v1-5-e3d38fc130e3@nvidia.com>
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
X-ClientProxiedBy: TY4P286CA0128.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:37f::17) To MW4PR12MB6873.namprd12.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MW4PR12MB6873:EE_|BL1PR12MB5756:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f105a0a-7197-4e84-9879-08df3994713f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|10070799003|23010399003|366016|261102123227099003|56012099006|261021121427099003|11063799006|261009223027099003|261022115727099003|261022075727099003|261026121527099003|261021123027099003|10067099003|22082099003|18002099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	n8o3lNN/wLzFHKwOuJBW9fpKjpRfGAyX3fYOO4IKmsSW7sIuzW+iz7EGaSDOUfwpNQdlnsdqgyLtFarMQ/w70Nzc3StTGYJbB4Y3D0zyUs8o+3239zeFyyDflDmkPPIeSZ1zXvrUflzPtTfZi0qyYIpWv7XL+vRs3u63Prs71mjVJAk6dM/WzFq7y44fNeF+LceXDmR7+d6xBqMgz4WjMCHqdQmWTJCI1lqTgs69HR9apTFEjVndLBeXqbNBptN5+mZXhY2UkbGiZtKhi2cb+Lt0kJdLS8Vr9hsnmCfBNyUIxQFWR/B2IXWGlzN8rYhjbaYhyFLwwzoEgrETlR3hvIMTggfGIIwnX9sficlK+cUaRcZPm9innx60gikz/+Ma6terEuqzqDvG+0GEHihTo8oq1NV3BNfrl6vBTor2QYS8EhZSwwTTNSxROccElHm+G43EpSoLHQSQ8ieDeEFd2t0WwPnF5Zl2nzdL9MKMmBDYjVYQ/8dFhvkPZWAMPFff4aPn+1ViLon+ctSBJtki/H+DMTc/fd/yVK+vBZ8vw1rkqAR8NXQfhUL10zTILGfkXvuveJhbu2FUdb/Qa10atf4YDK7Pf+QJwwc2inI24Eec+a2EwDGfiY6Kr9d0BBLuXG6gq2uETiLU4bxuTLnPuLt7LT612J6ORfz4dej6abg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR12MB6873.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(10070799003)(23010399003)(366016)(261102123227099003)(56012099006)(261021121427099003)(11063799006)(261009223027099003)(261022115727099003)(261022075727099003)(261026121527099003)(261021123027099003)(10067099003)(22082099003)(18002099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a3N3VWxhUVdNRU5WZkpyS2lPSGFmT0pvbXAveGloUmFCalY2a29MQmRLWENn?=
 =?utf-8?B?L3E1TFZwS2c3ZWlmTWdMRmVFWnNFRlIzRWI4QWlLQXJjSTJsVVFJZE9jN2t5?=
 =?utf-8?B?OVdjQUE1MUFIOGhhN0JqYkFNSnQrVGpKK3hvMW1xR1p0cEJRdFl1UUJqN2Rz?=
 =?utf-8?B?NEpEZkZWRi9yd0JxTEo0eFVETTczQXNoOUlIenlldFlaOStraUZIQVRjWlY4?=
 =?utf-8?B?KzlUTTBiVlJNYXBCVXh1TFk4L0lrU21OYUVFb0o0WmxTbS9UM2FDTGpWWVB4?=
 =?utf-8?B?UEpzRWQ4VEFDV2k0NEVpSDQzUjFjUW1sSHBHaVEraEhLNEdaRlpRTWM0RzF5?=
 =?utf-8?B?NmZGUWhSODE4VFZ6THNwWWI2TzhNTnQySUxYNWhBa3BLNFJrM2t0UjlnM21Q?=
 =?utf-8?B?UHczelVlQ3EwMlkrMkdyS1FIbDlHTERMeXgyQ1p1RXN4djVCalJDUjUxUUNT?=
 =?utf-8?B?Z3UybWc3S0QyR29NSExVMVlXTkMwREMyQjY4YXlhNjNZYkVOWGhLRVd0Mmlz?=
 =?utf-8?B?MG1ERUJxZGFlSU8vUFBoeEhTUGpLUUJ5aEV6MzZsZy9nV3RvOXZUS2pFdFVx?=
 =?utf-8?B?T21FRTdoNXdQTjd4NlhVODAvUm5DemFqUzZSQW41VjdCM2FtR2Vzd09IMnY1?=
 =?utf-8?B?WFloN0pmL1k2KzdNUnM0TVFKc24rQXlvbW1WZzJ3eS8vTTZnbm5FanY4WVFu?=
 =?utf-8?B?Sk03RmJ0d3VINkxEeXEweHZFbEgwbzlPWHVwZG5vY3NraldWZERuQnIxdmx2?=
 =?utf-8?B?SEMvOHVvc3NNL2ExYTN2Y0pRMmUwNkNKakljMFZEU3FBNlZsVDNLUG4vTVN1?=
 =?utf-8?B?RUhxSUJOQUNOTzZKRU1BQnpLMERBbmVqWmQwL3pCUlpqSHFhZjRnaW1reGp0?=
 =?utf-8?B?VVB6aWcwWDZNN0FTNFBOVWVtWHdxS0I4eFFvc2c4eHFscGloMS8rVk96bHNk?=
 =?utf-8?B?U3BDVDFjS3ZkdWpZR1Rub0RISG5iNFF0aVhRa0M1bkpPT1VCNEF2d3BhUnc4?=
 =?utf-8?B?SkRiMHF4dkcxRStRdmhDN3BwU0dkNjRSaWJmNDJFZWhnSDl1dGUrK2Uwamh3?=
 =?utf-8?B?cVlyTFdHTmtpeUl2Y0Z0cXZ1N2c4WFgxRVpienhLZ241RFZpYmZDWDJ1b2lD?=
 =?utf-8?B?N0N5OVJsaTRxeVUyWEZXeGRHb0FFd0pZZG4ranh0SUdKSDdrNzJSOUJ5K1Rs?=
 =?utf-8?B?VmtKMGhBakRBaiszTjcwOFI3MllqQklMVklJbjh3WndCNXl0RFBFZTZINDZ1?=
 =?utf-8?B?eGZaRHM4N1pWRkpUQ0tDdzJRSHpIbC9KUWh1SURSYlpWMDhqb09kRnNQM0tk?=
 =?utf-8?B?aFZTWVB6RGlPSU56RllidTluNnowVjVGdkpIUEtsL29rS09aaStIWU1ZSEFl?=
 =?utf-8?B?cHc4SFc5NWZ3Uk5FVVZrMmdBOVZ0U0ticjh6YXJzNElEa3VRQXR2RnNNZUts?=
 =?utf-8?B?REhNa0xMNjNCNkxXTU1EOFNVb25rbnF3ZWZNM2dqY0tNejNrS0pyVllCeE1m?=
 =?utf-8?B?QzdFNUY0QktJdkFDNXlpcnFkVFpFQk8wS052d01SamRuUmcwcDdzNTVrejcz?=
 =?utf-8?B?cnQ1RXNORW9CQXlCMFVSRHlxQklEc0p6N25HWWRVMDhQSjVjbXFyeHVZMGUw?=
 =?utf-8?B?ZVZEL0xvN0pkeCtiZFpvdGJkLytMZGUxY0JEakpRaWtnY2VIRktJb3NjREVj?=
 =?utf-8?B?SjIzZ1ZyYmNiYnhsYUxqWFZFQkZIM0RsZUVuT2hjTVVNWFZJc0Q2cUxFWWhE?=
 =?utf-8?B?YnZCVGlxcEFOcXRVMFlkMzJUY0JUZUpSc09EMXlyQUFoa1VERWI4SW9hL2ll?=
 =?utf-8?B?VXV6T3BwUmI1N1BSMmM1SS9VSWpNcWhJTVpZNyttVWdNcjV5ZlZYV1ZTZ1hY?=
 =?utf-8?B?RFRZTmpyYjhHQzRXd3R2VFFmem1Sbm1LQlRRZ0w4MHdNQ1IyQ1J1SVdxeWhI?=
 =?utf-8?B?QzRJa25WQzJrNmdEQUdnUEZQUWwzTGE3LzBTWDY5Y0tSRm5ieWJ0WENaR2FE?=
 =?utf-8?B?YUpSVjBoNXVNdmVENG1YdGovUE9RRFhmN1lxYzlrZmdpUzdvaW1TUk12MTFp?=
 =?utf-8?B?YzNSNXgwN0dBaG4rMUdaVWlaeWh6MGU5WFJhOWpKSkROYjNQVW4vbFc4QVpw?=
 =?utf-8?B?b1BUeG1ucGIxNUJzaWhtVWV6MmxoTGlrcXVWN1pPcS96UGhucTFuSmtkSThk?=
 =?utf-8?B?NWdFbDNVejZ5a1hMcHhZclhZdWJxaG5adDJrVC9XdFRZRmpZNEdxeEsrNkxG?=
 =?utf-8?B?UFh3S214aURhZUlmMDVuK2RkODFCbjIzZUJjQnBRT2lDUVBCb1ZPNVZ0TU4x?=
 =?utf-8?B?dE1XV3hoV3Nqejl6UjA4aGw1SjVpcXhjTUJyT2hzc0lSaEVXeWs2eXdHZnla?=
 =?utf-8?Q?cIRsPGwXlh1eYS0ZaHffRW3+H4t9r3zUlqzTEBZ8HnAZn?=
X-MS-Exchange-AntiSpam-MessageData-1: 1a0E3/QVS3f1iQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f105a0a-7197-4e84-9879-08df3994713f
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB6873.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2026 10:23:02.8949
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WG9Dha9y+1ooGnaHT42EeHTvgKetbJwYPLPhNbYt70KCkufEq9qs60W474cNG+kzlPlfBdGPM9T+gL4sfe98Jw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5756

Add a tag flag to FalconMem::Dmem and set DMATRFCMD's DMTAG bit from it.

This is needed for the r000 load-and-execute event which specifies
whether DMEM should be tagged or not.

No functional change intended.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/falcon.rs | 20 +++++++++++++-------
 drivers/gpu/nova-core/regs.rs   |  2 +-
 2 files changed, 14 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falcon.rs
index 1bceb38c33c6..f48f2eabab0f 100644
--- a/drivers/gpu/nova-core/falcon.rs
+++ b/drivers/gpu/nova-core/falcon.rs
@@ -131,8 +131,9 @@ pub(crate) enum FalconMem {
     /// Non-Secure Instruction Memory.
     #[expect(unused)]
     ImemNonSecure,
-    /// Data Memory.
-    Dmem,
+    /// Data Memory. If `tag` is set, a transfer into DMEM also tags each block with its source
+    /// offset, which is then the DMEM virtual address of the image.
+    Dmem { tag: bool },
 }
 
 bounded_enum! {
@@ -529,9 +530,9 @@ fn dma_wr(
         // code addresses in the firmware (and the boot vector) are virtual.
         //
         // For DMEM, the start offset is folded into the DMA address.
-        let (src_start, dma_start) = match target_mem {
-            FalconMem::ImemSecure | FalconMem::ImemNonSecure => (load_offsets.src_start, 0),
-            FalconMem::Dmem => (0, usize::from_safe_cast(load_offsets.src_start)),
+        let (src_start, dma_start, tag_dmem) = match target_mem {
+            FalconMem::ImemSecure | FalconMem::ImemNonSecure => (load_offsets.src_start, 0, false),
+            FalconMem::Dmem { tag } => (0, usize::from_safe_cast(load_offsets.src_start), tag),
         };
 
         let dma_address = {
@@ -568,7 +569,8 @@ fn dma_wr(
 
         let cmd = regs::NV_PFALCON_FALCON_DMATRFCMD::zeroed()
             .with_size(DmaTrfCmdSize::Size256B)
-            .with_falcon_mem(target_mem);
+            .with_falcon_mem(target_mem)
+            .with_set_dmtag(tag_dmem);
 
         for pos in (0..num_transfers).map(|i| i * DMA_LEN) {
             // Perform a transfer of size `DMA_LEN`.
@@ -625,7 +627,11 @@ fn dma_load<F: FalconFirmware<Target = E> + FalconDmaLoadable>(&self, fw: &F) ->
             });
 
         self.dma_wr(&dma_obj, FalconMem::ImemSecure, fw.imem_sec_load_params())?;
-        self.dma_wr(&dma_obj, FalconMem::Dmem, fw.dmem_load_params())?;
+        self.dma_wr(
+            &dma_obj,
+            FalconMem::Dmem { tag: false },
+            fw.dmem_load_params(),
+        )?;
 
         self.hal.program_brom(self, &fw.brom_params());
 
diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
index b7070282d692..cba080ccaab2 100644
--- a/drivers/gpu/nova-core/regs.rs
+++ b/drivers/gpu/nova-core/regs.rs
@@ -323,7 +323,7 @@ pub(crate) fn mem_scrubbing_done(self) -> bool {
 impl NV_PFALCON_FALCON_DMATRFCMD {
     /// Programs the `imem` and `sec` fields for the given FalconMem
     pub(crate) fn with_falcon_mem(self, mem: FalconMem) -> Self {
-        let this = self.with_imem(mem != FalconMem::Dmem);
+        let this = self.with_imem(!matches!(mem, FalconMem::Dmem { .. }));
 
         match mem {
             FalconMem::ImemSecure => this.with_const_sec::<1>(),

-- 
2.56.0

