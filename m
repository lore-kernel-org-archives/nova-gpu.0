Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012071.outbound.protection.outlook.com [40.107.209.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49B87401A06
	for <nova-gpu@lists.linux.dev>; Wed,  3 Jun 2026 07:31:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780471870; cv=fail; b=Nvas3WC1YqbfVCQlnL79Moq6H8vbubxdVcRSixU7/905FMJmKVgvblfgYz4i2KbOrfTjIUI2vnOdAZCf8gaoYKk59nZBoFXxBOFDtJYMWgduSvk1PyXllN9v2g4RL3guxWi10mdRjyK7d/+VZYzQ+nOd822+duVUsSNwy2/SMV0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780471870; c=relaxed/simple;
	bh=djmPwlV9wiVsfjPzPZ7NtPQgZqErX0GCZfvOxsSStnI=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=cx4cfEGeQcOH0/Ki/obUwurJjXSkLx6mxvT6SEqOcxGE6LnqAEqMAnqrw/i3KuzpNS8Pmy9vg2YS159lFKOmpDW0mYLiIE3aCN0h4sfLqxEWAxF0ihR++gZ/LxAf8fb+PT8qU50dsafk9Rhn0p1WdvnoKemjbqEe6M9FdrbmYzM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=LeCiaaXF; arc=fail smtp.client-ip=40.107.209.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="LeCiaaXF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Uur7NJn13ih6FKJ0ZcQRCt+J6Z+BJeqeGBp/uIp9r+Hae7KaT0W7QRQ937VgQSmF2c/WQVlqJTdJdvvRiZBOp8tZikeIX5JmFCxF0ZhfJkh1xk2SLTd3EkfXyhf90ZTnY3+URToIJKMQ/GQKZPHXWKe06D3jZpGllaUXvN+B+CRNKV3/x46JtyxxFDPlhQzAge6OuNdXrGsk6CPuTRR8VnFvSTjlRdda34NvRsUljWmXLw2xaCMtTv4qBxtDBwo8HffLJ2Habqk9UAkrNrpdJVCxShi8cxLlsxm70Vucd+dQmXoPlap0SLOXPw5uAsxMj8gx7xNnNdqBrEA07Y9YxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ldWZ4qWpL5WhCGoh49J3Akl61cEEM8fhs08w5+emSAA=;
 b=MnvwqSaSE7AG6ZVECMyJGMPcKgASFJ+e1N/VIV4/HmvjTTwP6bmFI39fG819pbZ2a64VrUMZpcGwdcst4CSbh0AuYsdsLqrNAu4FJtQV7hOeo4/59rVsRFN+18EDrwbvuXu0SMadsbaavHVyOCtQB1MCnYi3NLqaqweeYEoMXUInCz3ECmUXW2FyuowKNzPmoEPkYaEcKV65d/XIm6sPxUgyCpcFizO74BwbuWzWjI5uo5NGGNLKaBYWSoZgqHb6IOLpRB9Me5VLTL05tjqr/ohcw5gVXdVRkKhbUzlku5BD+9df0NLGlmJ+bbS3r01+Cf1X1cWnW7Rqwdw4kehcTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ldWZ4qWpL5WhCGoh49J3Akl61cEEM8fhs08w5+emSAA=;
 b=LeCiaaXF4TIIZmSCfJq5Dgfp3noMCRYzbNN+jXcQMxQjFQLcO4jNO7BhSQXGkKwzrt9jcLCvDCyYRigTncHYbfU0Npi7P7UpIHTmSLxhtpT+4r3IJp7jaASA3fEsQDRq/b77yN+sFbqOPvCzwYif7Ls0ShS/YzT7Bhn3UjvSWBQrnfinsL6QilVmGn67+EJRjI+3XDHygUYXTxI3gWzPuIhQ5Ct5YA9+lVy0Uznm4Jqp7tDA6vGAzZkxnjew1kWfDEJ7xFjpOqVvTUY7tdIEv3xsRaZx9kF9C4y8I17OYMoMYsef0P6Iyfad8TLNAdC+JdNuG+rKC7nKo0WXECpUnA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SJ0PR12MB7036.namprd12.prod.outlook.com (2603:10b6:a03:483::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 07:31:00 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.21.0092.006; Wed, 3 Jun 2026
 07:31:00 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Wed, 03 Jun 2026 16:30:23 +0900
Subject: [PATCH v13 6/9] gpu: nova-core: Hopper/Blackwell: add FSP Chain of
 Trust boot
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260603-b4-blackwell-v13-6-d9f3a06939e0@nvidia.com>
References: <20260603-b4-blackwell-v13-0-d9f3a06939e0@nvidia.com>
In-Reply-To: <20260603-b4-blackwell-v13-0-d9f3a06939e0@nvidia.com>
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
X-ClientProxiedBy: TYCP286CA0277.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c9::7) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SJ0PR12MB7036:EE_
X-MS-Office365-Filtering-Correlation-Id: c0e28216-7ec7-4b35-c4d3-08dec1420f1f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|376014|7416014|1800799024|366016|56012099006|11063799006|6133799003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	94O12ZqrXLKSdIXxEHP4TV5vDAzXw+2U73yMWsMippE9UgYd9VOD0LowKoLxUo3uhxFgFkqPHodqXtE2woEurjjVWh9wVd+npEt38gBvoYh9F83mYHuGyjgn143dAS5OrNBfPWpyaKmAjKi3gr0jO1VCQktuw2PvsTXOav+ldSDG2uHyoT4ckrpG9Rlll2ggwKOq7ztyM43egWOMWFIIRftbxFJgjhcbnKW1wNPzCP62EFJVMCpb627xg7LTGvX4KFLxl/IsA1Aqe+mkki45qgGqq96FKO5DitDmCai2uFT3HRx2A1lc+lzGW+3leSjvYRUHnXLRG/rsJw2LO5E4joAkU9tdTQ0MMyWfdbs21nOWC7PWhDkJeNDnzBANkhk5nkC4iIYXmiwCBG56M7l4PBI5gC1FQapTjxrxG6LGw0Er75sHMDSf7/QWTen8DGAEoa/GMXmtyTW6RRiRIW8XLe9BE2AQE9L19RVyIYzzK2SHE133Nap5hHB2vPU2p+7n0KGincQjuiQQwqCas+MT9B1v+lHT7myveDx5rBPjbNplW105uU7FyI4ZkCcNnDq0MZkb+mY2TLB/m3M6nCxtTzonLn+b5rwFU/F31S1p1n9+ChTETon3YCfpapLbIjNSZIidREWqpm6ZiSKJFBtOVZIrnIgrcoRvfzT0yKzVlz+4HWL3NpCENKILwiViSjS8
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(376014)(7416014)(1800799024)(366016)(56012099006)(11063799006)(6133799003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q1BOc0pjZHF4N0xwN21XZ0djQ251TWFXRWdScXJpSFQ5SmEzUlFORE5HWlpP?=
 =?utf-8?B?LzRiRzIrK2JHT0tLMkZUNHFkMHZHZkd5QmdsQWlmVGVud1hxU2R4KzFTcnV5?=
 =?utf-8?B?QUpSemlsV0tqK05haXhBVUlkb0Nyd1JYKzdPUTdndFFnQ2NSNzBmV0tQTm1B?=
 =?utf-8?B?LzdMMmxZdWkzMTBpajQwemx5YWsvS0NaZDB6VVI5L0E4R08wK3FHazZ3N0li?=
 =?utf-8?B?dEZST1ZUWEhhMm5Qd3prMXBmQU95Y1VCZWZwYk5hQWRkbmo4RUpadVRYUzdw?=
 =?utf-8?B?UFVJd2RldUFqWmovTW1ja1hlVWJnblpLYjlSa1dwNUpQNCs5NWdUY2xyUTU3?=
 =?utf-8?B?ZXA0UzNheDBzMkk5eGgzTnpmQnUwZ2pva00wQm41UTJ3SFFNOUhVVG13SHZn?=
 =?utf-8?B?a25SQngrTHB5Z0lKV0c2U1Jtcmk2R21sem1NRVdFaEZjYllxUFBFTzdpZXVq?=
 =?utf-8?B?WkdZYjZpNkRIYWEzYXdta3lTVGVwTmFaUXRJTXRoUzJOcEJMRCtKRlhtazNZ?=
 =?utf-8?B?M3lMcmN6cVV6eXZDWVdsNUdHKzdEWGtHdHhUVStEekE4cUlmMUhiUEh0UWpy?=
 =?utf-8?B?QkovTlhNQ0JMOHo5M3g5eVRSYXNmYWszRUlISXdndjBmN3lFSDdJUHlza1NI?=
 =?utf-8?B?Q3d3dVBWZEdkMlg5MGtkeUw3UjZXV0VvaDFMaEFCNGMzUGNGNWpFTkZ0UkFN?=
 =?utf-8?B?ZDZDWmUydmdlTTd4ZE1VbFBqeUJpSS9oWWJqckVjdHk0TkcycVNOM29PcTVt?=
 =?utf-8?B?aC9PS1R0SVkzWkt6RTEvUFJUN1pWT2NnVE1wbHFPaWsrdXJYMTU4WThFOFA2?=
 =?utf-8?B?YnoxcVg5Qk02ZFpDTVNWZHdlWUZIWmtoQ2xSdDJyYVRacFR6dWNBZlBFYkJk?=
 =?utf-8?B?YlFkZjNKRk96SmQrRzhST2hSTlVqVkRHVGU1aTVRVk0veE9HdEljdGdXK1Bm?=
 =?utf-8?B?SDJtUG9JQ0o2cGJrTTZGcnRjcDJmTHhjWkt3NnI0YTZ1emNvejMvRHVYaEQ2?=
 =?utf-8?B?U0hmVDMxaUcrdzR5Y0dBUmg0QjNzaG9mWWlGRTk0cUYvSUw3M2JpTHcxd051?=
 =?utf-8?B?UncwU3lqVExvUFVXZ05zTXhETXNSMStLeWszSzlMcnBjYStycW9MT2djSEVx?=
 =?utf-8?B?VFZ5c3huTDB5OUtxOWtKcUw0ZWZGTHhESWFwRHJpUDExNDdCQlNIQjU3NHNI?=
 =?utf-8?B?M1M4M3h5UTdTSTdRUVNINXJjWmF1N3FDQU1rMVliaDl0ZFFrSk16WXNMdnBX?=
 =?utf-8?B?NjdrZm4vOWRTUnFIZnI5WGZVTjU1TnJiK0ZIWnZBSnFOekFKZ3U2dTdUMDI5?=
 =?utf-8?B?UHNNVVgwU2IrUVhPNUt1bWFvVXRhdXJ6UXMwQ2FXVGFzZjRNYTR4QU1EYU5a?=
 =?utf-8?B?b0RyK3pDdHJnN3hveENBR25MbFV5U2kvN3ppNzI5OC81c2hiS3VlWTEvT2RE?=
 =?utf-8?B?NjlRQnJYcmtZajBFWjBaS3RSZ3ZXTG1OWHk4MXpwWFY2Tjh2S09mcFAwMFdF?=
 =?utf-8?B?NUVyQmM0NndSdHZyL3llMGhUWVUwQlo0UTBuem0wTURneHp3T1ZFQitSaFY5?=
 =?utf-8?B?UjVPcW9VZnVIWnlhUUFlZXA0NjFtUWd0dmNFSVdEM0hPWXdhUjkrY3dmRW9z?=
 =?utf-8?B?N0ViTGlBUjg2Q0dVWVZHYzhlNnVmamJ4WFlYS0Q1WFdydGJ3bjdUNk1OQ2Jt?=
 =?utf-8?B?SnI3WFV2SWkzdUpqVFdZVm9XNm1RNUJ1NzJzbnNoTUQvSzFkTjh3SS9STXN4?=
 =?utf-8?B?cVBsNHdUUGpBVy82dk4wbTU2SjJOZTd6NnVsb1NabXB6d3ZkWHdFQXpNR01q?=
 =?utf-8?B?ZUJ5R2lXNVhveTUvd3BVNlNFM1dlWmdRazZzRllXMGMyWUcvd1VSWHE1L1Z6?=
 =?utf-8?B?cGErMUlKdzBjUkxoSUtERW92eUtLVzlpM0tMK3A5ZmpyRU4yT0lEcnBnT3Zx?=
 =?utf-8?B?OFFwZzBFUm5aR1A5NWwydHloNjZuUEJTanRBUUJHV0lJL1NEcmVrV1lYVWgv?=
 =?utf-8?B?T0NNV0I3endNandKZER0dkFXTHovV2ZmMVFzelpEcGZmSHhYajV0RVNrL0lL?=
 =?utf-8?B?bSt2ZVZ6clJtQXJtRHJONW5qcEpkK2d0Qi91ZzArVWgzT1k1ZjBPMFFPRWRO?=
 =?utf-8?B?ajFpWkZqTWFLUmhCNHlWSnM4MmQ0UGVSd3M2Ykd1dzlGNUJ4VEFVa0w5NEZo?=
 =?utf-8?B?WFhFYzBSTkFkL0t1NmZneUdsL3pjUkcrMGx5OWZXRTZ4K1Q5dzNWT0N1bzZC?=
 =?utf-8?B?TGhUbmRyME5mdllKbjRFK1MzMWhtUnJkaXhGd3gvZWpSUFl5UVhFZjIrZ1hh?=
 =?utf-8?B?V1crL3VsQVlpalJkdmFKa0lLMmZpWGtUOVNjbHJnOW9PM3B5T21DRUE5Z3Q1?=
 =?utf-8?Q?SWqb3EX5RmmE+iECzOp5Z9qMy2nEdhSGu+S15PHiu4Oq1?=
X-MS-Exchange-AntiSpam-MessageData-1: J/q1dHAJ32vLrw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c0e28216-7ec7-4b35-c4d3-08dec1420f1f
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 07:31:00.0891
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5XiC7VM58VARP7gxrug7HqoM8VVsiETWSVUEINFeYP8+ZxCx0K7QbKua4vUyiQT0oDyu8QMSqE8vU7CilYgeMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB7036

From: John Hubbard <jhubbard@nvidia.com>

Build and send the Chain of Trust message to FSP, bundling the
DMA-coherent boot parameters that FSP reads at boot time.

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
Co-developed-by: Alexandre Courbot <acourbot@nvidia.com>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/firmware/fsp.rs             |   2 -
 drivers/gpu/nova-core/fsp.rs                      | 145 +++++++++++++++++++++-
 drivers/gpu/nova-core/fsp/hal.rs                  |   1 -
 drivers/gpu/nova-core/gsp.rs                      |   1 +
 drivers/gpu/nova-core/gsp/fw.rs                   |  65 ++++++++++
 drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs |  82 ++++++++++++
 drivers/gpu/nova-core/gsp/hal/gh100.rs            |  23 +++-
 drivers/gpu/nova-core/mctp.rs                     |   2 -
 8 files changed, 308 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/nova-core/firmware/fsp.rs b/drivers/gpu/nova-core/firmware/fsp.rs
index 9b211426a75a..6eaf1c684b9d 100644
--- a/drivers/gpu/nova-core/firmware/fsp.rs
+++ b/drivers/gpu/nova-core/firmware/fsp.rs
@@ -39,10 +39,8 @@ pub(crate) struct FmcSignatures {
 
 pub(crate) struct FspFirmware {
     /// FMC firmware image data (only the "image" ELF section).
-    #[expect(dead_code)]
     pub(crate) fmc_image: Coherent<[u8]>,
     /// FMC firmware signatures.
-    #[expect(dead_code)]
     pub(crate) fmc_sigs: KBox<FmcSignatures>,
 }
 
diff --git a/drivers/gpu/nova-core/fsp.rs b/drivers/gpu/nova-core/fsp.rs
index cedfea173e50..883ac4f8b811 100644
--- a/drivers/gpu/nova-core/fsp.rs
+++ b/drivers/gpu/nova-core/fsp.rs
@@ -9,8 +9,14 @@
 
 use kernel::{
     device,
+    dma::Coherent,
     io::poll::read_poll_timeout,
     prelude::*,
+    ptr::{
+        Alignable,
+        Alignment, //
+    },
+    sizes::SZ_2M,
     time::Delta,
     transmute::{
         AsBytes,
@@ -24,13 +30,19 @@
         fsp::Fsp as FspEngine,
         Falcon, //
     },
-    firmware::fsp::FspFirmware,
+    fb::FbLayout,
+    firmware::fsp::{
+        FmcSignatures,
+        FspFirmware, //
+    },
     gpu::Chipset,
+    gsp::GspFmcBootParams,
     mctp::{
         MctpHeader,
         NvdmHeader,
         NvdmType, //
     },
+    num,
     regs, //
 };
 
@@ -66,6 +78,114 @@ pub(crate) trait MessageToFsp: AsBytes {
     const NVDM_TYPE: NvdmType;
 }
 
+/// NVDM (NVIDIA Data Model) CoT (Chain of Trust) payload, the main
+/// message body sent to FSP for Chain of Trust boot.
+#[repr(C, packed)]
+#[derive(Clone, Copy, Zeroable)]
+struct NvdmPayloadCot {
+    version: u16,
+    size: u16,
+    gsp_fmc_sysmem_offset: u64,
+    frts_sysmem_offset: u64,
+    frts_sysmem_size: u32,
+    frts_vidmem_offset: u64,
+    frts_vidmem_size: u32,
+    sigs: FmcSignatures,
+    gsp_boot_args_sysmem_offset: u64,
+}
+
+/// Complete FSP message structure with MCTP and NVDM headers.
+#[repr(C)]
+#[derive(Clone, Copy)]
+struct FspMessage {
+    mctp_header: MctpHeader,
+    nvdm_header: NvdmHeader,
+    cot: NvdmPayloadCot,
+}
+
+impl FspMessage {
+    /// Returns an in-place initializer for [`FspMessage`].
+    fn new<'a>(
+        fb_layout: &FbLayout,
+        fsp_fw: &'a FspFirmware,
+        args: &'a FmcBootArgs,
+    ) -> Result<impl Init<Self> + 'a> {
+        // frts_offset is relative to FB end: FRTS_location = FB_END - frts_offset
+        let frts_offset = if !args.resume {
+            let frts_reserved_size = fb_layout.heap.len() + u64::from(fb_layout.pmu_reserved_size);
+
+            frts_reserved_size
+                .align_up(Alignment::new::<SZ_2M>())
+                .ok_or(EINVAL)?
+        } else {
+            0
+        };
+
+        let frts_size: u32 = if !args.resume {
+            fb_layout.frts.len().try_into()?
+        } else {
+            0
+        };
+
+        let version = hal::fsp_hal(args.chipset).ok_or(ENOTSUPP)?.cot_version();
+        let size = num::usize_into_u16::<{ core::mem::size_of::<NvdmPayloadCot>() }>();
+
+        Ok(init!(Self {
+            mctp_header: MctpHeader::single_packet(),
+            nvdm_header: NvdmHeader::new(NvdmType::Cot),
+            // The payload is packed, so we cannot use `init!`. Initialize it member-by-member using
+            // `chain`.
+            cot <- pin_init::init_zeroed(),
+        })
+        .chain(move |msg| {
+            msg.cot.version = version;
+            msg.cot.size = size;
+            msg.cot.gsp_fmc_sysmem_offset = fsp_fw.fmc_image.dma_handle();
+            msg.cot.frts_vidmem_offset = frts_offset;
+            msg.cot.frts_vidmem_size = frts_size;
+            msg.cot.gsp_boot_args_sysmem_offset = args.fmc_boot_params.dma_handle();
+            msg.cot.sigs = *fsp_fw.fmc_sigs;
+
+            Ok(())
+        }))
+    }
+}
+
+// SAFETY: `FspMessage` is `#[repr(C)]` with no padding, so all of its
+// bytes are initialized.
+unsafe impl AsBytes for FspMessage {}
+
+impl MessageToFsp for FspMessage {
+    const NVDM_TYPE: NvdmType = NvdmType::Cot;
+}
+
+/// Bundled arguments for FMC boot via FSP Chain of Trust.
+pub(crate) struct FmcBootArgs {
+    chipset: Chipset,
+    fmc_boot_params: Coherent<GspFmcBootParams>,
+    resume: bool,
+}
+
+impl FmcBootArgs {
+    /// Builds FMC boot arguments, allocating the DMA-coherent boot parameter
+    /// structure that FSP will read.
+    pub(crate) fn new(
+        dev: &device::Device<device::Bound>,
+        chipset: Chipset,
+        wpr_meta_addr: u64,
+        libos_addr: u64,
+        resume: bool,
+    ) -> Result<Self> {
+        let init = GspFmcBootParams::new(wpr_meta_addr, libos_addr);
+
+        Ok(Self {
+            chipset,
+            fmc_boot_params: Coherent::<GspFmcBootParams>::init(dev, GFP_KERNEL, init)?,
+            resume,
+        })
+    }
+}
+
 /// FSP interface for Hopper/Blackwell GPUs.
 ///
 /// An `Fsp` is produced by [`Fsp::wait_secure_boot`], which only returns once FSP secure boot
@@ -73,7 +193,6 @@ pub(crate) trait MessageToFsp: AsBytes {
 /// Chain of Trust boot.
 pub(crate) struct Fsp {
     falcon: Falcon<FspEngine>,
-    #[expect(dead_code)]
     fsp_fw: FspFirmware,
 }
 
@@ -109,7 +228,6 @@ pub(crate) fn wait_secure_boot(
     }
 
     /// Sends a message to FSP and waits for the response.
-    #[expect(dead_code)]
     fn send_sync_fsp<M>(&mut self, dev: &device::Device, bar: &Bar0, msg: &M) -> Result
     where
         M: MessageToFsp,
@@ -170,4 +288,25 @@ fn send_sync_fsp<M>(&mut self, dev: &device::Device, bar: &Bar0, msg: &M) -> Res
 
         Ok(())
     }
+
+    /// Boots GSP FMC via FSP Chain of Trust.
+    ///
+    /// Builds the CoT message from the pre-configured [`FmcBootArgs`], sends it
+    /// to FSP, and waits for the response.
+    pub(crate) fn boot_fmc(
+        &mut self,
+        dev: &device::Device<device::Bound>,
+        bar: &Bar0,
+        fb_layout: &FbLayout,
+        args: &FmcBootArgs,
+    ) -> Result {
+        dev_dbg!(dev, "Starting FSP boot sequence for {}\n", args.chipset);
+
+        let msg = KBox::init(FspMessage::new(fb_layout, &self.fsp_fw, args)?, GFP_KERNEL)?;
+
+        self.send_sync_fsp(dev, bar, &*msg)?;
+
+        dev_dbg!(dev, "FSP Chain of Trust completed successfully\n");
+        Ok(())
+    }
 }
diff --git a/drivers/gpu/nova-core/fsp/hal.rs b/drivers/gpu/nova-core/fsp/hal.rs
index 8aebe1800a64..86c595d70c8e 100644
--- a/drivers/gpu/nova-core/fsp/hal.rs
+++ b/drivers/gpu/nova-core/fsp/hal.rs
@@ -18,7 +18,6 @@ pub(super) trait FspHal {
     fn fsp_boot_status(&self, bar: &Bar0) -> u32;
 
     /// Returns the FSP Chain of Trust protocol version this chipset advertises.
-    #[expect(dead_code)]
     fn cot_version(&self) -> u16;
 }
 
diff --git a/drivers/gpu/nova-core/gsp.rs b/drivers/gpu/nova-core/gsp.rs
index 1885cfa5cb38..69175ca3315c 100644
--- a/drivers/gpu/nova-core/gsp.rs
+++ b/drivers/gpu/nova-core/gsp.rs
@@ -25,6 +25,7 @@
 mod sequencer;
 
 pub(crate) use fw::{
+    GspFmcBootParams,
     GspFwWprMeta,
     LibosParams, //
 };
diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/fw.rs
index 0c54e8bf4bb3..4db0cfa4dc4d 100644
--- a/drivers/gpu/nova-core/gsp/fw.rs
+++ b/drivers/gpu/nova-core/gsp/fw.rs
@@ -934,3 +934,68 @@ fn new(cmdq: &Cmdq) -> impl Init<Self> + '_ {
         })
     }
 }
+
+#[repr(u32)]
+pub(crate) enum GspDmaTarget {
+    #[expect(dead_code)]
+    LocalFb = bindings::GSP_DMA_TARGET_GSP_DMA_TARGET_LOCAL_FB,
+    CoherentSystem = bindings::GSP_DMA_TARGET_GSP_DMA_TARGET_COHERENT_SYSTEM,
+    NoncoherentSystem = bindings::GSP_DMA_TARGET_GSP_DMA_TARGET_NONCOHERENT_SYSTEM,
+}
+
+type GspAcrBootGspRmParams = bindings::GSP_ACR_BOOT_GSP_RM_PARAMS;
+
+impl GspAcrBootGspRmParams {
+    fn new(target: GspDmaTarget, wpr_meta_addr: u64) -> impl Init<Self> {
+        #[allow(non_snake_case)]
+        let params = init!(Self {
+            target: target as u32,
+            gspRmDescSize: num::usize_into_u32::<{ size_of::<GspFwWprMeta>() }>(),
+            gspRmDescOffset: wpr_meta_addr,
+            bIsGspRmBoot: 1,
+            wprCarveoutOffset: 0,
+            wprCarveoutSize: 0,
+            __bindgen_padding_0: Default::default(),
+        });
+
+        params
+    }
+}
+
+type GspRmParams = bindings::GSP_RM_PARAMS;
+
+impl GspRmParams {
+    fn new(target: GspDmaTarget, libos_addr: u64) -> impl Init<Self> {
+        #[allow(non_snake_case)]
+        let params = init!(Self {
+            target: target as u32,
+            bootArgsOffset: libos_addr,
+            __bindgen_padding_0: Default::default(),
+        });
+
+        params
+    }
+}
+
+pub(crate) type GspFmcBootParams = bindings::GSP_FMC_BOOT_PARAMS;
+
+// SAFETY: Padding is explicit and will not contain uninitialized data.
+unsafe impl AsBytes for GspFmcBootParams {}
+// SAFETY: This struct only contains integer types for which all bit patterns are valid.
+unsafe impl FromBytes for GspFmcBootParams {}
+
+impl GspFmcBootParams {
+    pub(crate) fn new(wpr_meta_addr: u64, libos_addr: u64) -> impl Init<Self> {
+        #[allow(non_snake_case)]
+        let init = init!(Self {
+            // Blackwell FSP obtains WPR info from other sources, so
+            // wprCarveoutOffset and wprCarveoutSize are left zero.
+            bootGspRmParams <- GspAcrBootGspRmParams::new(GspDmaTarget::CoherentSystem,
+                wpr_meta_addr),
+            gspRmParams <- GspRmParams::new(GspDmaTarget::NoncoherentSystem, libos_addr),
+            ..Zeroable::init_zeroed()
+        });
+
+        init
+    }
+}
diff --git a/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs b/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs
index 1d592bd3f9ed..ea350f9b2cc4 100644
--- a/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs
+++ b/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs
@@ -883,6 +883,88 @@ fn default() -> Self {
         }
     }
 }
+pub const GSP_DMA_TARGET_GSP_DMA_TARGET_LOCAL_FB: GSP_DMA_TARGET = 0;
+pub const GSP_DMA_TARGET_GSP_DMA_TARGET_COHERENT_SYSTEM: GSP_DMA_TARGET = 1;
+pub const GSP_DMA_TARGET_GSP_DMA_TARGET_NONCOHERENT_SYSTEM: GSP_DMA_TARGET = 2;
+pub const GSP_DMA_TARGET_GSP_DMA_TARGET_COUNT: GSP_DMA_TARGET = 3;
+pub type GSP_DMA_TARGET = ffi::c_uint;
+#[repr(C)]
+#[derive(Debug, Default, Copy, Clone, MaybeZeroable)]
+pub struct GSP_FMC_INIT_PARAMS {
+    pub regkeys: u32_,
+}
+#[repr(C)]
+#[derive(Debug, Copy, Clone, MaybeZeroable)]
+pub struct GSP_ACR_BOOT_GSP_RM_PARAMS {
+    pub target: GSP_DMA_TARGET,
+    pub gspRmDescSize: u32_,
+    pub gspRmDescOffset: u64_,
+    pub wprCarveoutOffset: u64_,
+    pub wprCarveoutSize: u32_,
+    pub bIsGspRmBoot: u8_,
+    pub __bindgen_padding_0: [u8; 3usize],
+}
+impl Default for GSP_ACR_BOOT_GSP_RM_PARAMS {
+    fn default() -> Self {
+        let mut s = ::core::mem::MaybeUninit::<Self>::uninit();
+        unsafe {
+            ::core::ptr::write_bytes(s.as_mut_ptr(), 0, 1);
+            s.assume_init()
+        }
+    }
+}
+#[repr(C)]
+#[derive(Debug, Copy, Clone, MaybeZeroable)]
+pub struct GSP_RM_PARAMS {
+    pub target: GSP_DMA_TARGET,
+    pub __bindgen_padding_0: [u8; 4usize],
+    pub bootArgsOffset: u64_,
+}
+impl Default for GSP_RM_PARAMS {
+    fn default() -> Self {
+        let mut s = ::core::mem::MaybeUninit::<Self>::uninit();
+        unsafe {
+            ::core::ptr::write_bytes(s.as_mut_ptr(), 0, 1);
+            s.assume_init()
+        }
+    }
+}
+#[repr(C)]
+#[derive(Debug, Copy, Clone, MaybeZeroable)]
+pub struct GSP_SPDM_PARAMS {
+    pub target: GSP_DMA_TARGET,
+    pub __bindgen_padding_0: [u8; 4usize],
+    pub payloadBufferOffset: u64_,
+    pub payloadBufferSize: u32_,
+    pub __bindgen_padding_1: [u8; 4usize],
+}
+impl Default for GSP_SPDM_PARAMS {
+    fn default() -> Self {
+        let mut s = ::core::mem::MaybeUninit::<Self>::uninit();
+        unsafe {
+            ::core::ptr::write_bytes(s.as_mut_ptr(), 0, 1);
+            s.assume_init()
+        }
+    }
+}
+#[repr(C)]
+#[derive(Debug, Copy, Clone, MaybeZeroable)]
+pub struct GSP_FMC_BOOT_PARAMS {
+    pub initParams: GSP_FMC_INIT_PARAMS,
+    pub __bindgen_padding_0: [u8; 4usize],
+    pub bootGspRmParams: GSP_ACR_BOOT_GSP_RM_PARAMS,
+    pub gspRmParams: GSP_RM_PARAMS,
+    pub gspSpdmParams: GSP_SPDM_PARAMS,
+}
+impl Default for GSP_FMC_BOOT_PARAMS {
+    fn default() -> Self {
+        let mut s = ::core::mem::MaybeUninit::<Self>::uninit();
+        unsafe {
+            ::core::ptr::write_bytes(s.as_mut_ptr(), 0, 1);
+            s.assume_init()
+        }
+    }
+}
 #[repr(C)]
 #[derive(Debug, Default, Copy, Clone, MaybeZeroable)]
 pub struct rpc_unloading_guest_driver_v1F_07 {
diff --git a/drivers/gpu/nova-core/gsp/hal/gh100.rs b/drivers/gpu/nova-core/gsp/hal/gh100.rs
index b25970dd4561..f41f3fea15ff 100644
--- a/drivers/gpu/nova-core/gsp/hal/gh100.rs
+++ b/drivers/gpu/nova-core/gsp/hal/gh100.rs
@@ -20,7 +20,10 @@
         fsp::FspFirmware,
         FIRMWARE_VERSION, //
     },
-    fsp::Fsp,
+    fsp::{
+        FmcBootArgs,
+        Fsp, //
+    },
     gpu::Chipset,
     gsp::{
         boot::BootUnloadGuard,
@@ -39,17 +42,27 @@ impl GspHal for Gh100 {
     /// the GSP boot internally - no manual GSP reset/boot is needed.
     fn boot<'a>(
         &self,
-        _gsp: &'a Gsp,
+        gsp: &'a Gsp,
         dev: &'a device::Device<device::Bound>,
         bar: &'a Bar0,
         chipset: Chipset,
-        _fb_layout: &FbLayout,
-        _wpr_meta: &Coherent<GspFwWprMeta>,
+        fb_layout: &FbLayout,
+        wpr_meta: &Coherent<GspFwWprMeta>,
         _gsp_falcon: &'a Falcon<GspEngine>,
         _sec2_falcon: &'a Falcon<Sec2>,
     ) -> Result<BootUnloadGuard<'a>> {
         let fsp_fw = FspFirmware::new(dev, chipset, FIRMWARE_VERSION)?;
-        let _fsp = Fsp::wait_secure_boot(dev, bar, chipset, fsp_fw)?;
+        let mut fsp = Fsp::wait_secure_boot(dev, bar, chipset, fsp_fw)?;
+
+        let args = FmcBootArgs::new(
+            dev,
+            chipset,
+            wpr_meta.dma_handle(),
+            gsp.libos.dma_handle(),
+            false,
+        )?;
+
+        fsp.boot_fmc(dev, bar, fb_layout, &args)?;
 
         Err(ENOTSUPP)
     }
diff --git a/drivers/gpu/nova-core/mctp.rs b/drivers/gpu/nova-core/mctp.rs
index 90e289d4c3fe..482786e07bc7 100644
--- a/drivers/gpu/nova-core/mctp.rs
+++ b/drivers/gpu/nova-core/mctp.rs
@@ -7,8 +7,6 @@
 //! Data Model) messages between the kernel driver and GPU firmware processors
 //! such as FSP and GSP.
 
-#![expect(dead_code)]
-
 use kernel::pci::Vendor;
 
 /// NVDM message type identifiers carried over MCTP.

-- 
2.54.0

