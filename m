Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012033.outbound.protection.outlook.com [52.101.43.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93126396B8C
	for <nova-gpu@lists.linux.dev>; Wed,  3 Jun 2026 07:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780471845; cv=fail; b=gvNLPzMeV/Y50gE54TjJdlINt2Yv8pPnP2yfvHYnWydnRlHpwU7pNCGDTppXzaTTtegNQunteKYxzrKC0fIP+ZVE1GNpZovilXkCQNpHep8OiuBGNY5MwSEdK4tNjQ67cBZ5kM5pQIcMRilYm2jKNps7yrqeTRZC8JiRt9M8fSE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780471845; c=relaxed/simple;
	bh=WnNuUjfzzyeJWvHlX/TEZ2mo/mo4IwlblC10k90EeMI=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=CgI22Z/KrQX/lBPXPGGxmlgAO9go5JUx9nKxYymOsce3JeVVP2MItRfgtl0gnlvTENJO/t3gBPBR9UzugYxJYUTS/EA6CLpLpHDg7a2FG+90f186fDrmouuey8QlvwNP/bnkNoBNc/wi6mV6PsOZI+j0RnGa028beIOg6ePFDMc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=OH1mmvG6; arc=fail smtp.client-ip=52.101.43.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="OH1mmvG6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VVfAFYVfDz7bLYs9KIMishOai/AsP5K1T7W7ifMZuw3Pbvja1c/nnVT5ca1+TmwQJvl5+pPVXGF3ca00bCa8/KJJU7c1DB7qxFzr9kcLrZdUKIF6IGuYLhPJxWC2wN8DivUq3KQ4m1opuR4uX74N/G/2NCySUk4GimlOOaT6TJCGtwr0/QmSmVKhghKWmisOeSAt2tgUpslw5D+xBeBn3hajMSMVppFKaNbX039bpwOTjtAfSJH9ykBv1qb28jx4Uv6MRAazS/3ELvALn2KoGm085Z+jDosdGJJCsO3cAF6I386KahrtEQir+veGMN0E++wgGWe84xGKCQCJuUNpsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RsFFaiVFZQu6QU0MJDdgITuoFtAMSpkHIKtfXS2YtHs=;
 b=gj7whz2QLaRK+D5afMUu6A6Z862Ij89PbBJUBsynG1AjXkHCA1/5O4TTqZRQmSRfObKLmbQhPH2zS8ouFUifIgUy+c2MZpQz8RkdZKm1P0qzmVVk3JfkI3b5eVgBuHeKqDPgdR2disnp3xLZqjpjPgw0SLckFSkvgPyE7X1feQ16bGC/GJpxDftmz4QDHH+4CnxghXdeehSH7DokJd72Frq2hUk9iCk1PYLobjr2DriBep3HQNlSiAYBTQa3UNF9PpApb0YEKUsMdGuA3Gu8pWodlrGOlnqcuupsRdUmP463el/qvEgBSAlVHOyDvJ5fSQVk/kFZz4yp/8KX97B2vQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RsFFaiVFZQu6QU0MJDdgITuoFtAMSpkHIKtfXS2YtHs=;
 b=OH1mmvG64r5zbaC03A+7ojIjmo3aHCmIFyun8vto8lfInJ3wdf2jQkpa7+vfYdsAdTMuIePW4vXGZFcB4F5iZOdqJPruMYuXfWgVkCiz/kzqWYzl5J1Pqj8Gvzy+TdsJA07D3a8lZzEHT2w21mF4jLWaJsYQuKp5TsjzGk+zwNhHha8svRF4xXVpjCdsj0tOJh+P8CmI0wqHA1sEYitGwVtWNzcE5bP0VExmDhP1R8R8Tlxz1rJFwIJ42tH8tBucKRg36XLY+Umsan8TJcNsCYmY0WIM/6ScTAq7uaV+XAdYZxdNpWJhATaCQd4IKbh3SCP50JdNpPZyQgvMFtZOCw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by PH7PR12MB6667.namprd12.prod.outlook.com (2603:10b6:510:1a9::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 07:30:30 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.21.0092.006; Wed, 3 Jun 2026
 07:30:29 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Subject: [PATCH v13 0/9] gpu: nova-core: Hopper/Blackwell support
Date: Wed, 03 Jun 2026 16:30:17 +0900
Message-Id: <20260603-b4-blackwell-v13-0-d9f3a06939e0@nvidia.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDI11FJSSM
 xLz0lN1M1OAAkpGBkZmBmYGxrpJJrpJOYnJ2eWpOTm6hkkpySaWRgaJyeZGSkAtBUWpaZkVYPO
 iYyH84tKkrNTkEpAZSrW1AOyUWNxxAAAA
X-Change-ID: 20260603-b4-blackwell-1bdc4920ac72
To: Danilo Krummrich <dakr@kernel.org>, John Hubbard <jhubbard@nvidia.com>
Cc: Timur Tabi <ttabi@nvidia.com>, Alistair Popple <apopple@nvidia.com>, 
 Eliot Courtney <ecourtney@nvidia.com>, 
 Shashank Sharma <shashanks@nvidia.com>, Zhi Wang <zhiw@nvidia.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Bjorn Helgaas <bhelgaas@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 nova-gpu@lists.linux.dev, LKML <linux-kernel@vger.kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, Boqun Feng <boqun@kernel.org>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: TY4P286CA0033.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:2b2::14) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|PH7PR12MB6667:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ae42680-96cd-4aba-3297-08dec141fbd9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|10070799003|376014|7416014|3023799007|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	lxU4pNQyvPpwE1jEX6BaJHsKMGpcbKv8ZWnLtPXzDM49IdK1OFRJKNlGCpHe4lZKVmBbnpz4kdex/8cQ1wTRseH8tEFW6GYCdrRZuJ5YnU50Z7XfjWBRMTTQyKxc1z0xFdi2ynL7qMcagA2Vy0lEzrlTJqyPzSif3I5DU9i+f7++Ah7CaYsUejFzgQtbJjkGEf/wDrO8RG9ijZOYWMrokksrL61FZbs5PkWBujZG6S8wC2gjlyjI5dAEO81sYtMUPVUqT3muO6uRUx30RIxX7V66Ph5qadC4RpHRd9DP3hToOPfaZ5jjTtXbJr1n8I/LcI1p1C9cf5SbHo+pRpUulyp6x8lH/5cZzGHfhldT0+EYb6VGvBgHWbxL0Q1Ud7flMoDvRdLOfpdeZ/8SmpzcHWgtpf4fOlYbpjgj0UyFEIxOOZA93QMyTqumXD9s17jzmwm4bWsP+JUXWmRxCXVG3mHYlTUQsq2HlGiKdHx6/w9Cch5ZjDM4exTD+uVliygA7zVyKkJ58thpk1eV1lLQaiI421pkIgA8d0fVOkBex0jiKAlXR3YKt3SutKHnoJmPNLGxs72ZHpjq3ZhpZxYEbl+okCC7WzkgSEYJ9MhG2hsfN68eKLhJdPcgKc9qYdkCZaHlQOpPJA5QEopQJLnLvDQsIkANL+x8Vj+vmuAtU81fRSzdbrGpgvvOywWKshOu
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(10070799003)(376014)(7416014)(3023799007)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R3ZsWjFSMEdKUkZ0S1VtT3FQTXNRWko3OUFnbXhPOUZjQnhFaTcvZnBjTGFV?=
 =?utf-8?B?TjlXdnVmYXpPZ1BDbFpPYlNJSkJOak9idTJoaS83STE5YXFNbEJleVBmd1B6?=
 =?utf-8?B?MjlwOG5aQk9QYm8xSExCMVNRd2U5bjVERm5PaXp1QTR3ZmFFaVlPdkFSSzM4?=
 =?utf-8?B?UFVGTEtiVytQTXpNTUNEMktUZTJpS01HUWt6SFBuQTUyL00wT3N3c0t5a3po?=
 =?utf-8?B?WkJEcFJ6Rk9ReDM4d2k3QlFzb1NObCtuTndSakNYeHU3Y1pBN0tpdm1PWnN6?=
 =?utf-8?B?NEJZbHVDcGN5cE5Gc2xXbHdMcXJKS0hFVjBzVGFvOUxjQVR0bmFYU0dYQUpv?=
 =?utf-8?B?eGxqOTYxT244Vkd6bTBOZlZtdEg2eGhCU1VvcllURHBqZEZJNzluUE0za29u?=
 =?utf-8?B?VElaYTZpNGVnc3NnYitWWnBGYlBZL3VBOGlWQ2dycXc2Uisvd1RUbzlMcXZ4?=
 =?utf-8?B?Y1Iza0NTRlY1Slg0Mm55VHRsWDJVUER0TEJyVjBwWW1RTk92cHZyWTR4dW1U?=
 =?utf-8?B?cURSZnM1MVF0TnJZWmhVN1psMldHRCtGQ2o3MHljaTBqbEhqU21vUUd2UHEz?=
 =?utf-8?B?aTdnUnRFVEltN1dWRThsU0U3VDFwVEdDK3R4OExSamxRYjBQeGFRWHBYL0lE?=
 =?utf-8?B?TGpuL2dab1hPOTVXT3NUSGg2dVAwN2k1Y3diTGh5VjhhSDdRL0FHcUIrbzFS?=
 =?utf-8?B?Rk9vaWhvSGJkejlCVk9QRHBtK3ArMkdmN01KUVgrUHFpT2UvRWwzQTNmdTR5?=
 =?utf-8?B?QXNGVEpaZ2RKNTJjRkpmZzdneWV4dUlNZEpFS1F1d2pTejhNVGhNd2xlbHRP?=
 =?utf-8?B?aHhhRnlQc25EeEowUEluK3hNdHFJR2hPSzEwdXV4Sm5lUUxKUkI2U3FTcjdM?=
 =?utf-8?B?cE9EeVVBMlVjYlZOblAvNzNyS0tXdklqaEdOTEl2YnEwTzFpQVU3TitRZkp6?=
 =?utf-8?B?YklvWk16cGl2eFJtakZ0N1ViUFM1VUZCM3c3ZEtKc3MvZlNMSW9DVzZmbU9h?=
 =?utf-8?B?WHQxaysrdHZmenlOaDQwSElkR0NMaEpIbDFRb3FNeUJCUkd2RzJocnhMTy9q?=
 =?utf-8?B?M3dJSnBIVkM1aEgzQlNVT1c1WmJGWTAxYkdVTndBTk91TnNIMUxoaDJWcm15?=
 =?utf-8?B?K1hWU2hxMjdGbDFNc0NsSS9CTUlmeFBnR3lvYjhCRDZsVjkwY3FUaG1KUnFx?=
 =?utf-8?B?Y25WWDBlQXF0RWR6ZktqUEFuODFyUFVjUWo0bk9EMVN1aXY0Uy8rYmpETVQv?=
 =?utf-8?B?b24rNEM3eWFtRi9lZUtndlMwRXF1NjhpZUFCQVVOcVczajVYRFUrUllpU1M0?=
 =?utf-8?B?UndGQWtFb2lhVXNTMW05WmY2b3FxbWw4bmQweHN4Z3NvNjFkSDU5US9Zb3Ar?=
 =?utf-8?B?ZVRnSFRqN3JWdUkyU20yekpqcDZRT1F1NUtKK0ppd0lzMVl2RWJsV2swMGtn?=
 =?utf-8?B?OEtEUXJDcHNnL3NwZEZOY2p3bURPOHVFYlVpcnhaSXJRRDlwYmxKZzJabXNo?=
 =?utf-8?B?cG5JY2lKV2tvdXo0VDRUd0wvdnN0Mzh4bi9TWDliTkJkUHZFT05KYTZ5eEhG?=
 =?utf-8?B?WWpkTmNpb1FwcVlUTnppRmNmcUQ3N1plN1ZEK08xMTFicXFPdWZ1aFBSR1Bx?=
 =?utf-8?B?WGNhU0wrTU1DNDV0Mk9wcG9oR3pySW5oM0hqbDZzWHZtL0IwQzNENTZJa2p4?=
 =?utf-8?B?WlFxckNzSyt5R0k3eWF4OTdPcUtrbHZ1Vm85aTBiOWYxY1JyNnJWTmNFTWFQ?=
 =?utf-8?B?cENkSTFmOFBtZGprM2MvR2Mrd1dvNC93cXlYTXBINjM4UE5PYVZxRDhFZEtE?=
 =?utf-8?B?R1hyS3pObkNMWTRtdGZxbmVDVnpwZnFCNmtWNVV1Tkx2clAwNWs5dUVkUENV?=
 =?utf-8?B?UWtTRmVmcFB3bHZlaFF3N2dJTUV2aGVWdzZLUnZENnJWeDkyZ0dQRDBKdzZZ?=
 =?utf-8?B?WG5iRmd2TlZqMHdlVHpBcW1jYzVxcHUyNU5UWVUya1UxVDJzUHFqZDVqQWRG?=
 =?utf-8?B?aTkyMUE0Rmt2cVhlNjlrWlJld3ZTeWswcWNVYmNqSkQyQ0tnRDJuV2p2K0Rs?=
 =?utf-8?B?ZWpnYWR6TmNaQXNLVVhZbWthRHFZd2hkc0FVUGVuck82cExRS1ZXelNieEhT?=
 =?utf-8?B?MXAybTZyNEhPTWR1azdCeTlyR2p0akJkbnpncm8zT0t0VTQvY2NYU1g0YlY4?=
 =?utf-8?B?bnVWQk5OS1FDcXVaOHppZG95QkxpMkQvM1VWNTUvZktGaVpheTg2OXRMRmF6?=
 =?utf-8?B?OVFaMGtZc3JBU2Y5bmh2dlRVUHZuZk9uVkQ0azhDd0wzSm0zRTd4QkRlNm1O?=
 =?utf-8?B?c0NTTmljNk9UaSt0M0wzZHhrNUFpWDFJaWRJcm9TTVhORS9FWDNlQkJYNXd4?=
 =?utf-8?Q?MqMCyJJGMREXI/MyC7mHNIWtJ9or/Oe7XEKBSA0ZrWYSq?=
X-MS-Exchange-AntiSpam-MessageData-1: 0O6YkSaLYO6t4w==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ae42680-96cd-4aba-3297-08dec141fbd9
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 07:30:29.1238
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WSp5B5cO0F1uB94AMVgOkYzuz/cYRvfjsgAtBckPSnaRR4Y+K4Vn2Ykb4Z2fJv68TXlU57I0ztbccsIYiK7QkQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6667

Tentative final spin at the remaining patches of this series before
merging.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
Changes in v13:
- spell NVDM as "NVIDIA Data Model".
- remove unused `From<u32>` impl blocks in `mctp.rs`.
- Remove copying of the large `FspCotMessage` on the stack.
- Make `NVDM_TYPE` a `NvdmType`.
- Add method for checking the RISC-V lockdown bit in `Falcon<Gsp>`.
- Remove `offset` argument from EMEM ops and collapse the methods/types
  that became unneeded.
- Align EMEM registers naming and structure to OpenRM's definitions.
- Allocate the FSP message buffer in `Fsp::recv_msg` instead of relying
  on the caller to pass a buffer of the correct length.
- Link to v12: https://patch.msgid.link/20260602032111.224790-1-jhubbard@nvidia.com

---
Alexandre Courbot (1):
      gpu: nova-core: gsp: enable FSP boot path

Eliot Courtney (1):
      gpu: nova-core: add non-sec2 unload path

John Hubbard (7):
      gpu: nova-core: Hopper/Blackwell: add FSP falcon EMEM operations
      gpu: nova-core: Hopper/Blackwell: add FSP message infrastructure
      gpu: nova-core: add MCTP/NVDM protocol types for firmware communication
      gpu: nova-core: Hopper/Blackwell: add FSP send/receive messaging
      gpu: nova-core: Hopper/Blackwell: select FSP Chain of Trust version
      gpu: nova-core: Hopper/Blackwell: add FSP Chain of Trust boot
      gpu: nova-core: Hopper/Blackwell: add GSP lockdown release polling

 drivers/gpu/nova-core/falcon/fsp.rs               | 148 ++++++++++++-
 drivers/gpu/nova-core/falcon/gsp.rs               |   6 +
 drivers/gpu/nova-core/firmware/fsp.rs             |   2 -
 drivers/gpu/nova-core/fsp.rs                      | 254 +++++++++++++++++++++-
 drivers/gpu/nova-core/fsp/hal.rs                  |   7 +-
 drivers/gpu/nova-core/fsp/hal/gb100.rs            |  23 ++
 drivers/gpu/nova-core/fsp/hal/gb202.rs            |   4 +
 drivers/gpu/nova-core/fsp/hal/gh100.rs            |  15 +-
 drivers/gpu/nova-core/gsp.rs                      |   1 +
 drivers/gpu/nova-core/gsp/fw.rs                   |  65 ++++++
 drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs |  82 +++++++
 drivers/gpu/nova-core/gsp/hal/gh100.rs            | 151 ++++++++++++-
 drivers/gpu/nova-core/mctp.rs                     |  88 ++++++++
 drivers/gpu/nova-core/nova_core.rs                |   1 +
 drivers/gpu/nova-core/regs.rs                     |  41 ++++
 15 files changed, 862 insertions(+), 26 deletions(-)
---
base-commit: 0023a1e8d01a9d400257d30c851bd16a29568809
change-id: 20260603-b4-blackwell-1bdc4920ac72

Best regards,
--  
Alexandre Courbot <acourbot@nvidia.com>

