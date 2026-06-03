Received: from SJ2PR03CU001.outbound.protection.outlook.com (mail-westusazon11012033.outbound.protection.outlook.com [52.101.43.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 945F93A5E88
	for <nova-gpu@lists.linux.dev>; Wed,  3 Jun 2026 07:30:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.43.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780471847; cv=fail; b=gR48gXHQ+NoWHVhmGs5omPcDoDgD5GFISpQB96IvG2YeTnV8gmkO42IaCfbw5r0nRVLnQkLlxN1hRWXT7dsQgaOLRtKB6gQ3eEZKCs+AOLnH5Up8zl7HykNrRCpwbc2P+EDDtdArsGrBHBBg0JDU88ZtIoxfGHGbKfQ2zGTT8KY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780471847; c=relaxed/simple;
	bh=EdRPuC4rrJaLev2/A9ZuP+d08A0ON3ZX8nfBoTG6vO0=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=IPryk6l6w+LxPRR/QXn2Rfe/RzQU2OL2sEUsmIMWyb3zm2rgh06GgmTM0JLv7y8Krs/ZH3XSCMHPSIEq/h34R1P/8+veZu5e0YqzNkzAEKtor+eWrgtSG/Vb4Ty4SQln7yxca7IGso5XGksnGWeuxaoj5u+neE+hFZaJoUL7mhE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=q364aGpq; arc=fail smtp.client-ip=52.101.43.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="q364aGpq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xB9tdtpZF7y4xA7GHmzjmwsDmjhsobSLrFnFRZWuQn0yu8ZbaXCBfozEKG1kRrJJRjGr1R7YYGwlc61QJu056IGBjOqnr4CzCtwb6vx3c3IEUx7UAxa2R2+1+PBaOku4Bb4L/OD3zR/+v0qPF4Jv9tc4Nv7a0CaJVzznxWogkEsMYpjvAx4BqGvdDnsa3mLdNIXvj8YFH6jZx16jpLPHZwmnCLunCkCjPQxAAAkhA3LHTU0BLPe0fnzjU40h7iCt2yG2pZBD+io0SOSCHoO7tP+b7kIQ7AxPOsC66XMhbg0Yz/DsyyQWHj3vBNLZwt/c86tR9nOI/W2MMc+A6ZeqAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sFsbhI3HHnTg4gfD0HjnkxB0pqWHHQRTP9mnf9lfwhU=;
 b=jtfA5e3W4JvDasEVh2P1mqLMtnWgyv1rdqvJG+/VMHBV14N5pABjddYbeojqDj6p1OHFlZy2MA1IT57HTvpy1RcckrftVCxvbIaVn70yyDSvJ2PxUjSjx6/5QvaaTJ6FBI8HEnEdAXDPSS6/ljXEDGgebz4pw64SXcO5gu7i552A1QybGEfw/H58g84qQ8fDbkbdb7r2I3hnskBfPycebDI+2rAHhKl2+3ePg/tNX8wS8GgRbGp7AQH3kGY6k2KkEaAurGyCTOJIlhktqRTlTIQaCqndL9j/Xxp6kMyX0h4ehl3mWbBUe5O89ocd5gyJiJa1sC0frCzhXMl5OeNm7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sFsbhI3HHnTg4gfD0HjnkxB0pqWHHQRTP9mnf9lfwhU=;
 b=q364aGpqmtZWHvyzEOp4GfrPeeljaDMHeTx5R7hU83IiHDEPcTPVqrzvr+v+re0CPjHLsPpS4LJtjkVWTQaYJG2vZE9K7eoBvcvcLZT7wn6riRVRCRLfZx2RQQJIrKh2JWVEpb2n6qCKw/4rYnEVhRni2Bu2Cq0x/E73Xt9Fah3TTLHy5zF5kQ659A+GOpshT1heLE4e9Y5I1dfsj3KNP5cnyhfHBX+c+RQN+SGnTE8cZBQNOzXb+mVLJcSMfQ+O95yYwpJ1pEnVASbIYZ+kzxwbMgvxWp55ODrvwcsDBxNI8+lwt/6dcek89mLuA8OPcAvLocHsa1vKyOr2qDmkgg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by PH7PR12MB6667.namprd12.prod.outlook.com (2603:10b6:510:1a9::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 07:30:34 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.21.0092.006; Wed, 3 Jun 2026
 07:30:34 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Wed, 03 Jun 2026 16:30:18 +0900
Subject: [PATCH v13 1/9] gpu: nova-core: Hopper/Blackwell: add FSP falcon
 EMEM operations
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260603-b4-blackwell-v13-1-d9f3a06939e0@nvidia.com>
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
X-ClientProxiedBy: TYCPR01CA0172.jpnprd01.prod.outlook.com
 (2603:1096:400:2b2::9) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|PH7PR12MB6667:EE_
X-MS-Office365-Filtering-Correlation-Id: c898c714-94c9-4d5e-fe9e-08dec141ff8a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|10070799003|376014|7416014|18002099003|22082099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	i4+x5QHnaQ4EAKIqnpb0AS09r5dIDJYMDGrM1WzcWhlDXiNuCLPxuHkJzkasmfx6dmhcYf/YEmkmAt070IThtPzKdhBIm1KqGVf9oyblXQzSNyDrOptV8BKLl/pb6KgNJHmkBEYFmJjeRXiDktf56peFPSITl0VqKjuTpP8Pg3jX0TMksuhyLKPOZYVrQgxZwuZ9HZXbeAGn+cs3KqSIP9ckEztyBFxe/dE9jDApdpyaE1TMA8dEErh3TKVTJl+YpAACkWJijZBMScLAJAWDsr+xhftXFWDI9uSW936f9bYmqjG+qdTY7V2TKw/HK8YFgu8PRL1Wfol1xZZI+NgxCL6539Qf2gETW8HloFHRTt+prHcyB92rLMApL9R76q/gnMyKC9xfvJtnW/JrV6bHErj248KPx3CBnTqBgkbIhUp4xf2G9/kGH9Vo3hCaSHByTleaYhUjGnpTKzdz4E2G9G7dz5+uJoH8mY05YdIVgiAHQIhNBe2BeVt3F5tKt4MV+r0hNMgqDzHtXcF6juq924bbQ5R3FdXXC09mLxHS8+aKuWsvFL4oSolRGLmcMOM1N8qU7WrPrxS8+elcKG4x3g8nGRMvPSl7XceLevZqNuM/lUBqisCvlez+omjNWDqzFn7R3SZ73XPxrxSsNK3p+eQcZi6lE2iJkAbLk3yNScRBpdUzOvswTJIF2OgxSXof
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(10070799003)(376014)(7416014)(18002099003)(22082099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U1lVT2loNlJDOW5FRVhRYXVQRHFHZU1WcmR0d2VwYlhaMzB4WXU5b0NmVUJq?=
 =?utf-8?B?dEJSN3cvbVZpWUJiKythRzkza0xJY3hub1BOZGUrNzRxYkttMnRZQVloTlhn?=
 =?utf-8?B?S0ZJSGFjbVdhSzRqV2JwYkg1ek1uK3JpMTJMQy8vdmRBdFQ3YUUvYlArUmRs?=
 =?utf-8?B?WFAxd2QxS1RpUk96NzVkNk5XdGtWa2FYSFpqdGF1VkF5TXRBdHBMc3orNzBn?=
 =?utf-8?B?dmw4WDVBRnI4NDNPeEFKNWJaR0pRTXEybzEyT3FDaG9XN2RyQ0w0Yk1ic2Rh?=
 =?utf-8?B?MFZJV3N3V014Vjd1N2VqWmhNcnhZR3lsSkdmbVJQWEVGVzNTNGFXZkRqNTZt?=
 =?utf-8?B?dW8vQ1MzSi9NdmZzcGNJVGt4czlEeE9FclYwSkgzRG5RVDNrU0tRNFlMTUxS?=
 =?utf-8?B?VlIyWk9MMzJ5ZXVtcUZUSE9rNFFNcndmOEE2OE1oOVRCT3pXRVlMbElLVTdy?=
 =?utf-8?B?bFdXaGY2ZzJvVlE4bTQ4NTZTaENJWmx5SmJ2Z2VXRlc3V1lkY0JMQ0cwMHNW?=
 =?utf-8?B?elBHang2Yit5cHRYTU5PU25QNlZIcnoydnp0V3o2TmJ2QU85UVhNUFlDdE5l?=
 =?utf-8?B?cEQrL091Ni9NdDFOTXB2NzBVcHd1ckRuNFN2ckM4SC9RZkpCWjk3ZXdYOVRu?=
 =?utf-8?B?aW9lUGgyU3Y3Si9iT0x0UWRQM0lXNkZMZW1oZHZDK09XTXJBc01QME5NNW5y?=
 =?utf-8?B?czFaNzNWREVoLzFuTHNNWUtJdFVLdDhrOW9aMWFMYUVXSUhEWU95QWNWaWVH?=
 =?utf-8?B?VjJYSjB6ZzlOTWR1emNFb29VaE5SNkErVFBub2JsZ3dRV1BrQ3F4OTE2ZlZY?=
 =?utf-8?B?RVM0NHRCZmxHbTRESDZoZFFkNFdIZlV2R003TGFTaWFWRngwQ2sycEdQcjk2?=
 =?utf-8?B?RHJTL2plalBaUnlPNkhablRxY3Z2dkpsZDZrcnhIeUdCOXNaZ1dvVjgwRVdI?=
 =?utf-8?B?eHY4cGtTU3hZWk12MzNMWEplSFFOQ0pGMlh5UE94bU83eWZPSXVJVWh4eHBa?=
 =?utf-8?B?ZHBRMHEzKzgzWWdQallGZDMzMEtrY293YmZkYXdrbndrczdaQ3pGelZJaXZZ?=
 =?utf-8?B?RDRzN09CWXJ1cjZ6L0M0RW05SUt6RjdrTmcxeC9Ud2VybU9CTCthQWJtYU9F?=
 =?utf-8?B?bjAvNy9wcWNIeVUzWlg0Q2ZXSkJIVDE2ZlJ0UUdXUHZYSDdpQitkbHExTnln?=
 =?utf-8?B?N2NLajY3ZllFM2p5RVRkaUY4WUZEdlBkTXRianRyMlZSLzlxSFRjOUk0cmMy?=
 =?utf-8?B?R1NNMmdVZHVveUp3anZmc3VwUHRQKzBkUTlzeXBmR29HckN4QWR1eEVkSWpa?=
 =?utf-8?B?V09RanJITDJHaFN0REhWazVxeGRMSFJXTEttODRzZzJpTklOQkF1amgyVHRB?=
 =?utf-8?B?VmczcTlnSFY1aE5vT1h2R1ZSckk4eEhtaW1TTUYwVnQrWjdhaHdlaDFOTm1N?=
 =?utf-8?B?ZUdVVHIybWpSTEFHaEFTeExYNmo4Z2QycjFhMzhlbm94N09OV1lEc0JEWWxy?=
 =?utf-8?B?OHRJcnBOZXpXOTNZeExmZjRDV3p1NzkzZTBubHN0eEQ1T2o3S0l4NzY4YTM0?=
 =?utf-8?B?SGJjcnZlMFh4M2NPRkdwa0JqQ1YyeXpzMStZV09YaHQvMHdSM3RVOVNyNHRJ?=
 =?utf-8?B?YVVWbTNFYkNJK0NPeUhveldJZ0txV0FPUzVxUWpQcC9OUHhLbTFXUXJLVE9L?=
 =?utf-8?B?dnRjZjMvRlNJMlF5OHllQ05OelpCMjZsbFhFWk9qUGQ3OWJoNmVhb0dZcG5j?=
 =?utf-8?B?WWhuYjdBQWwxNXRncUZPalAzWG14MTlGN3FocVIydFllazB1dlliTkxHdGdV?=
 =?utf-8?B?Q2ZoTWhlUEZ4WU0zcnlDU2lENDlNTWcwbVR4dExueit5MU5Fc3o5a0t1SG44?=
 =?utf-8?B?MVlrbEhBakNPaWljbkVGY3RsRTlNeEZQRkswZkhSQ1hacEhNOE9rcTBSekhG?=
 =?utf-8?B?QlZpOHoyRHZLTGJsSUpkd0t3WUY2YUM4ZUVrTktzd2RMSTZxZ1lpNHZ2cXpk?=
 =?utf-8?B?Mmt1Rk5lOWk1M3VqWGdwWmJudkJocmlYSXQwdTExMkFjUHR3VzJSZXhDK1FK?=
 =?utf-8?B?MGIrbU5VbVV0OUZaSUpRN3BsUzMrNjZRRElkbWJ1R3NOTU9rTlhLbGhKRzlL?=
 =?utf-8?B?OWhqQXJSWEEvZ0IySEdETmFzS25FVGJJWkYwaFpRWFdnTk1PN0l5YlRUcWpS?=
 =?utf-8?B?SW5TQ0RZNzBTMjJJUlJYZkcrUXE3SnlVZmMrNHlwK05jZHNCWEZQOEY3MER3?=
 =?utf-8?B?cjFQMG5OaUI0ZUNZVHVJdzZZek5rb0tSOWFrVG9mdkNMWUJ5MWdFQ3Z1WVhv?=
 =?utf-8?B?bmJTS25iQWhUWnQxNVJhZEUzUlpXWHdTYTA3TzJFemtKVUg2MHZldXUyRmRn?=
 =?utf-8?Q?SDkYYTtID7Id0VQ54OQbE+C3nqncXR9goubB+Efk7AGpX?=
X-MS-Exchange-AntiSpam-MessageData-1: kKlpnhaE0eFCmQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c898c714-94c9-4d5e-fe9e-08dec141ff8a
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 07:30:34.6920
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7J+KNBJitbgmEFrOEcaEwH6b6PfnnPM7+p0+Vicw7WBrueu7QFpOlFgx3KPte2gxVMttB6T7CcyFAFIlkB1flA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6667

From: John Hubbard <jhubbard@nvidia.com>

Add external memory (EMEM) read/write operations to the GPU's FSP falcon
engine. These operations use Falcon PIO (Programmed I/O) to communicate
with the FSP through indirect memory access.

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/falcon/fsp.rs | 80 ++++++++++++++++++++++++++++++++++---
 drivers/gpu/nova-core/regs.rs       | 18 +++++++++
 2 files changed, 93 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/nova-core/falcon/fsp.rs b/drivers/gpu/nova-core/falcon/fsp.rs
index d9f87262e8b1..0956a75ef7aa 100644
--- a/drivers/gpu/nova-core/falcon/fsp.rs
+++ b/drivers/gpu/nova-core/falcon/fsp.rs
@@ -6,12 +6,26 @@
 //! The FSP falcon handles secure boot and Chain of Trust operations
 //! on Hopper and Blackwell architectures, replacing SEC2's role.
 
-use kernel::io::register::RegisterBase;
+use kernel::{
+    io::{
+        register::{
+            RegisterBase,
+            WithBase, //
+        },
+        Io, //
+    },
+    prelude::*,
+};
 
-use crate::falcon::{
-    FalconEngine,
-    PFalcon2Base,
-    PFalconBase, //
+use crate::{
+    driver::Bar0,
+    falcon::{
+        Falcon,
+        FalconEngine,
+        PFalcon2Base,
+        PFalconBase, //
+    },
+    regs,
 };
 
 /// Type specifying the `Fsp` falcon engine. Cannot be instantiated.
@@ -26,3 +40,59 @@ impl RegisterBase<PFalcon2Base> for Fsp {
 }
 
 impl FalconEngine for Fsp {}
+
+impl Falcon<Fsp> {
+    /// Writes `data` to FSP external memory at offset `0`.
+    ///
+    /// `data` is interpreted as little-endian 32-bit words. Returns `EINVAL`
+    /// if the `data` length is not 4-byte aligned.
+    #[expect(dead_code)]
+    fn write_emem(&mut self, bar: &Bar0, data: &[u8]) -> Result {
+        if data.len() % 4 != 0 {
+            return Err(EINVAL);
+        }
+
+        // Begin a write burst at offset `0`, auto-incrementing on each write.
+        bar.write(
+            WithBase::of::<Fsp>(),
+            regs::NV_PFALCON_FALCON_EMEMC::zeroed().with_aincw(true),
+        );
+
+        for chunk in data.chunks_exact(4) {
+            let value = u32::from_le_bytes([chunk[0], chunk[1], chunk[2], chunk[3]]);
+
+            // Write the next 32-bit `value`; hardware advances the offset.
+            bar.write(
+                WithBase::of::<Fsp>(),
+                regs::NV_PFALCON_FALCON_EMEMD::zeroed().with_data(value),
+            );
+        }
+
+        Ok(())
+    }
+
+    /// Reads FSP external memory from offset `0` into `data`.
+    ///
+    /// `data` is stored as little-endian 32-bit words. Returns `EINVAL` if
+    /// the `data` length is not 4-byte aligned.
+    #[expect(dead_code)]
+    fn read_emem(&mut self, bar: &Bar0, data: &mut [u8]) -> Result {
+        if data.len() % 4 != 0 {
+            return Err(EINVAL);
+        }
+
+        // Begin a read burst at offset `0`, auto-incrementing on each read.
+        bar.write(
+            WithBase::of::<Fsp>(),
+            regs::NV_PFALCON_FALCON_EMEMC::zeroed().with_aincr(true),
+        );
+
+        for chunk in data.chunks_exact_mut(4) {
+            // Read the next 32-bit word; hardware advances the offset.
+            let value = bar.read(regs::NV_PFALCON_FALCON_EMEMD::of::<Fsp>()).data();
+            chunk.copy_from_slice(&value.to_le_bytes());
+        }
+
+        Ok(())
+    }
+}
diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
index 2cb1f02f35a4..e602c7860459 100644
--- a/drivers/gpu/nova-core/regs.rs
+++ b/drivers/gpu/nova-core/regs.rs
@@ -475,6 +475,24 @@ pub(crate) fn vga_workspace_addr(self) -> Option<u64> {
     pub(crate) NV_PFALCON_FBIF_CTL(u32) @ PFalconBase + 0x00000624 {
         7:7     allow_phys_no_ctx => bool;
     }
+
+    // Falcon EMEM PIO registers (used by FSP on Hopper/Blackwell).
+    // These provide the falcon external memory communication interface.
+
+    pub(crate) NV_PFALCON_FALCON_EMEMC(u32) @ PFalconBase + 0x00000ac0 {
+        /// EMEM byte offset (4-byte aligned) within the block.
+        7:2     offs;
+        /// EMEM block to access.
+        15:8    blk;
+        /// Auto-increment the offset after each write.
+        24:24   aincw => bool;
+        /// Auto-increment the offset after each read.
+        25:25   aincr => bool;
+    }
+
+    pub(crate) NV_PFALCON_FALCON_EMEMD(u32) @ PFalconBase + 0x00000ac4 {
+        31:0    data => u32;
+    }
 }
 
 impl NV_PFALCON_FALCON_DMACTL {

-- 
2.54.0

