Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010030.outbound.protection.outlook.com [52.101.193.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F329A3C9890
	for <nova-gpu@lists.linux.dev>; Wed, 19 Aug 2026 03:53:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787111599; cv=fail; b=o5PJNpM/rlKBXybxRCjRo9dtM1ew2/VEphglQrw8Kh0eDUyj+8HOu6CkPQVnRroWsnWH6/PMqdzDnlp1oAGToN7gUesMIieeNk/zfVOtVJ9LpkZ9Wd7u7QKzh6E3HID1DEsI41kxT+uGR61PG2xf7wbrvwhAVHd1ltHodTekBos=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787111599; c=relaxed/simple;
	bh=P+neQClMi8Z+sbaa10KQ3Es04Zsv0H0hvgFKZh59icI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=BuYwlYhwA730eO59zHFFjov2QrjzGOrPnbVqs3J0mfufpNIo6pv0tvD0gy4MUtfNvhNKFpqg+249l+yKOQnNd+eAi+83SRaQ/rftNdyRQUBAyV6F+Sg8oRden3YQ/yntHG3GTQskoSy3EDRD4ePBubmQj8WkOFYvLbvEFT9QbA4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=pyl9KLWX; arc=fail smtp.client-ip=52.101.193.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="pyl9KLWX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aRQjFHlo+AdlHmbFBTi23lDZR98+fZpf59GPXuVaMNiR+aeDJr8goW93/ZGNNgV+vd9NnzNPWXHb6U9Ugtx14Z+7nH43YkTt+tuWWC4pRlBDrKI44tVnHRGAnBgYEXD5dtmrVdrCB1lEZ/05tW0L0Tg1J98mke9dtPjpz7TsaGBdNn5dP/QU5ZcGUr89ppHMP8ESYZmNNvvZtf1f1pphVGjHLrURgb+xGfQGTBsjPAQIBbSB4TNybI2U+XnLbnGZYw+bivYiK4uMgoxazzmoixMEUl9c1qsB3+eelm2q6/F3eJX0WglhUMCxZ1AYOF++4C6ll1KwswwzkyYnEVpuWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3VCSMgdoFPNe57xbbI6sPF/Wq1Z2UBL0Qc4TsQLBPhc=;
 b=nnJ/GdhLuG9tWaQfdARb7IpmCDe5Tb9kc2p0kXl0auY3sEbAB+iPK2fDVyle9liVMWCRWEPSkqyCoc4SI8XiBHfhMesGUznG/fQj2rKazslWp2Igfvh0zLkQgWFFwyGAjSS4q5lzVSpotnxKbHOFIbSB3Gbhrg3YyQU0jMYf9CMBPccblwwopwh2yZo2bOazbZhoWK0AuFN5lJxQ6yklSi6FSSHs3vNGPArHsuMYu77ZRk0lEroNCD7IjsJhELhetOG6L1BVjr7LzIkEoq3ojy9J5QhtfIn1ufvudEjkGlwhjYuLt8Lk1h5g9jHoHwakc+T0YD7w5oh1UHpvdDCGDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3VCSMgdoFPNe57xbbI6sPF/Wq1Z2UBL0Qc4TsQLBPhc=;
 b=pyl9KLWXkPP1jwmBNe/1Jm0xftSHVKDxeBrGPdbyFR7WYLr93Sh0lq0OWRtQh/U66/7KSrJQ9G1aycC8vUedbIhoCY/20dRTHNeC8yLd2sOeOkAVZY+P6kz38T36+pkf13WmE2BpY78g7yeI9k8C2YBCUTckm9aspi3W0izBIx8kK/bOs8WfpUgZtEe9EwTMpq0HrI/QQIQaTWobODQNmwyZ9iQ1f9DnCVHqMOmI6L93Sn9Fpq/VJ3CEZJexq5d+hXP0LxMURO09UgF0+z8uqI7KXUVmTMo2gbvUkWJ9KlnasKgE2I4gWJkDhQ/DTL00BrDiN0WYqx7hgrANrS+Zzw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 LV2PR12MB5990.namprd12.prod.outlook.com (2603:10b6:408:170::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Wed, 19 Aug
 2026 03:52:52 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%4]) with mapi id 15.21.0339.007; Wed, 19 Aug 2026
 03:52:52 +0000
From: John Hubbard <jhubbard@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>
Cc: Timur Tabi <ttabi@nvidia.com>,
	Alistair Popple <apopple@nvidia.com>,
	Eliot Courtney <ecourtney@nvidia.com>,
	Zhi Wang <zhiw@nvidia.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	nova-gpu@lists.linux.dev,
	LKML <linux-kernel@vger.kernel.org>,
	John Hubbard <jhubbard@nvidia.com>
Subject: [PATCH 25/27] gpu: nova-core: switch to the r000 GSP firmware
Date: Tue, 18 Aug 2026 20:52:18 -0700
Message-ID: <20260819035221.336390-26-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260819035221.336390-1-jhubbard@nvidia.com>
References: <20260819035221.336390-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0145.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::30) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|LV2PR12MB5990:EE_
X-MS-Office365-Filtering-Correlation-Id: 903b473a-c9bb-4894-e100-08defda55846
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|23010399003|1800799024|3023799007|18002099003|22082099003|11063799006|56012099006|5023799004|10067099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	imFNbIa4SyajKwlCDEmO0aSkLpuYXuHZWRakloJP1tT2lu3mZkZs/AipVhqkWTjBV8hDQCF+aysjjhGKoKTjIO7Qhck0LNmJNNtX2OzR0RrjlbhLB9KbjzM+AMBjjxmCMvP2VweELJyeKTNQmkAAfbgdZB+BO4bsWhtA354SUZFZqFfh/ODLsosHBba7K7tKe23wvDTKi1Z556Oj31/+jhRmqYIGlwZ579uRmrD2HGSGiDQCfMVbC2jTuMlv1x1IBepQsk0Sz0c06w01V78ogWuocBXDL9DAb0Zv6dyWIIoGNw641cv4hJanmlHGmqWcX9klZE0hE/LVgnO/J6bvL3DA2eY3PxKY9kEHD92yY1Sqk/YwIkp9JYqV1y5ZmKBnZvEXThMtg219zcPLhVKnTUjWg24I5NI+K1hq5xnsTFn7P5aYDd/l18Gb3u+iW3M7bFI05PW1LrcsImIc/1xqYIgmjqfcMU4EYteYTe7zNPRUmq9IXF/npNrgbGIbHsGimRgQKREwDwAbwo1/wUUudkBM90cJPNMy9e6fzosLS+qLTZhnCkOQ73rRzA158DAamLTn89/bdKJ9a2X5bBe3HAWi/XtS9Hmoc28qN1bTRh2gTzh0QIgNX/ljq73d4FV1JKVg+gYwVtExlDVy++M5lRIPX0on4NwD+LPofV/Um2c=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(23010399003)(1800799024)(3023799007)(18002099003)(22082099003)(11063799006)(56012099006)(5023799004)(10067099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?JVapPHng2Ne5K55H7nIwJvD5qQhcm7npvr5YzVRpHVtSB9mYFUZkunbnAyd1?=
 =?us-ascii?Q?QS0r93tdH2rRaFKhmYDnx1e3oKKxesI5pU8bGGQZW/o8yhu0EG6sYTw78dfm?=
 =?us-ascii?Q?NzHGVvr+Iq2zsZ2gJwWEf5+rIgkEU3m2tBOR6vGNevjChRtj8wipvj3Tkdaj?=
 =?us-ascii?Q?nLpgNFDYsokGQ5WHzQIrqsOUkz2wBzvAQZl3z2H6B4GtUg+RC5G+L6Px1lIE?=
 =?us-ascii?Q?PuVNZMkIdG55h9cI8B1n2Izsc1r+x61uOT5wn4NiSMqr6JhIrpqiyhpnVnFg?=
 =?us-ascii?Q?aA0lFmNd5wX7HTYL7q4uBwUH7ch3AtZ9GU7oN/1KF54zNMNB4odB7K1ckrhT?=
 =?us-ascii?Q?nPg3jeZ9MuAEXxibhD99hQB4v9VJRcYVZe2KFmI0sByhAU/2ojMhTeljbp+P?=
 =?us-ascii?Q?uGmvzsWYuguqyNsDOz7wzST2NmzRpYtcEUYTOEvOxk52vt8GtdcqB2o5H2x9?=
 =?us-ascii?Q?clMsUblcgqSG0fQYsash+jADbll88xx7KvTIZPojiLRiQnnhe4UbHUOJqb8r?=
 =?us-ascii?Q?+wXxg9efEt/EhJZYGzwK1Jpw427BxH2SNooyXDLxaT/fkwWVDPfI3qyXndqZ?=
 =?us-ascii?Q?0QPM7jG+csJ7Sn8mHlg4dbx6yCc7wZSkLfJeYJnXvIlBrR+CeHCas7hnvSrj?=
 =?us-ascii?Q?roJL7cMRRREWXiUddHQjLLDOoGZePa8oOyjlfIdqPCCTCZXPzXLQh9BvQq1R?=
 =?us-ascii?Q?q0MzowYJeF0NwggnnCw6SXkF6ZBo8eeckByRbUmyKGzDvN7Zh3RXcCs9GtME?=
 =?us-ascii?Q?cA5p3TQLkUb206zMyY3rp0vNnZY/OhuPeO78UbtXcfNN2pG1i/vrIO9B5qci?=
 =?us-ascii?Q?gp85MZJs0tMpJe27vKb8ZOmb+ej1SNJ+WQ91UczI3I+eUCdn7LCoG8U5+JuH?=
 =?us-ascii?Q?haT7PExRqYauxIhVFKkBK3g9sKyDrNcaRc4wZeN73rARxzvYjTABUA9byt0g?=
 =?us-ascii?Q?fKbhXCWiX1PjvD+m3jcWLVSpCk6qAc4u8dDwT9eEn7gi8+5uZJnbwwkTxctN?=
 =?us-ascii?Q?LPfkLUJe/nfjdb09JI5EvwRen7hwzddzlJyypYh/tvjeI5oqZGSjw0l4W9/I?=
 =?us-ascii?Q?IdiXWAWJabCC7gP6rnkRuoCPMMI/mWbvE6XTGCSZnhxmvBNO2I3ukcNgklqd?=
 =?us-ascii?Q?Qael4R/9nua6/7xPqHFAEMyWeCWMr/ibZX2XdZAwP1DI+jfi6E1bwDqlRZSW?=
 =?us-ascii?Q?uvna8lOzaeW1fxTvSIq0dxdChMkxS91ZFUREwCubV9f/APaPDdX9ddI0qzIB?=
 =?us-ascii?Q?YYHsp6mhA/HJDqi/j1Si1TMxlQ+vR7mRedl7BXKkZRlXR9wEwwloL+kxreML?=
 =?us-ascii?Q?/U+5HYQE0CRJYN2CDb9t4cJQ+GQLmbthj7vuo6CLZjUS46zNDvV0rwgMXBVA?=
 =?us-ascii?Q?wP5apqlddx+24obKCz2v+mtSCnBABUI62eleAWGLfSc4sMj0j/V9pcbsJ4PI?=
 =?us-ascii?Q?iI7z8RUtLjQYp3dq9ePeIVGtd2zId6u0VAB6Z9gPHvBFQqxMA65098E8tSBf?=
 =?us-ascii?Q?ZN1fnXcFPmuSs2Kk0ozImvuNQFNbdV2d7P7X3qpLjIm5YVCbmnGUUisqFZBE?=
 =?us-ascii?Q?Zf4KJIMQNKNVT6xpCwvyFTfLL45yzQVt0dLYCHg0QEghI+DEmjQ0Aq0nxM+F?=
 =?us-ascii?Q?pxUN8kfu4z3KEJ4libkO/191s6OroPrIY7H9mqyfGt0+wi/8Lgh1A7iTHtYa?=
 =?us-ascii?Q?dld11XxWIAysgm0zDRBuC/+d4YBhUOq9X2Cj6skqdlZbBl0A+oWCz/1RJwx9?=
 =?us-ascii?Q?jGZMjg5iOw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 903b473a-c9bb-4894-e100-08defda55846
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2026 03:52:52.7718
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PJG366GANFJRYVLs6RsDz/1dAhq/wrQgsKurJvmJs3gEXrMwcg4ZDOvqHG588qwg+6p3XBVD3My/udzHEWa9fw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5990

The r000 firmware changes four things about how it talks to the driver.
Queue elements carry MCTP and NVDM headers and no checksum. Msgq version
2 keeps all four ring pointers in BAR0, and its head-register write
doubles as the doorbell. Load-and-execute steps arrive as GMC commands
rather than as RPC events. And a single GSP_INIT request replaces the
system-info, registry and static-info commands, with its reply standing
in for the init-done event.

None of the four can change on its own, because only one firmware
version is present at a time, so a commit that changed only some of them
would not boot at all.

Switch all four together. The startup arguments gain the ucodes image
and the state-monitor buffer, and the FMC boot parameters gain the magic
and size header that r000 expects. A missing ucodes image is now fatal,
which is what Open RM requires everywhere except GB10Y. Only Turing and
GA100 raise the generic-bootloader event, so the bootloader image is
requested only on those chipsets.

Each load-and-execute event ends in a GSP falcon reset, which zeroes all
four msgq counters. GSP-RM writes back the two counters it owns and
carries on counting from where it stopped. Write the driver's two
counters back the same way, counting the element just handled as
consumed.

Name the r000 module in the bindings alias, so that every constant comes
from the r000 headers rather than the r570 ones. The r570 headers size
the GSP heap at 14 MiB of RM boot working memory on Hopper and later,
and the r000 headers size it at 18 MiB.

Msgq version 2 holds the read pointer in BAR0, so the r000 headers
define no RX header. Remove the driver's copy and the space it occupied.
No offset changes, because the message data is page-aligned and already
sits at 4096.

The r000 firmware also sizes two framebuffer carveouts differently, and
the driver reserves them. Its PMU region above FRTS covers the backing
store, the communication surfaces and the misc memory, which come to
25 MiB + 384 KiB, and GB20x asks for a flat 3 MiB of non-WPR heap. Both
are larger than the r570 amounts, so carrying those forward
under-reserves memory the firmware expects to own.

The boot events and the GSP_INIT reply replace the CPU sequencer and the
wait for init-done, so neither has a caller left. Remove both, and the
run-CPU-sequencer entry in the message-function table with them, so that
code arriving on the queue is reported as unknown rather than decoded
into types nothing acts on.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/driver.rs           |   2 +-
 drivers/gpu/nova-core/fb/hal/gb100.rs     |  25 +-
 drivers/gpu/nova-core/fb/hal/gb202.rs     |   5 +-
 drivers/gpu/nova-core/firmware/bindata.rs |   1 -
 drivers/gpu/nova-core/gpu.rs              |  21 +-
 drivers/gpu/nova-core/gsp.rs              |  34 +-
 drivers/gpu/nova-core/gsp/boot.rs         | 139 ++++--
 drivers/gpu/nova-core/gsp/cmdq.rs         | 365 +++++---------
 drivers/gpu/nova-core/gsp/commands.rs     |  68 +--
 drivers/gpu/nova-core/gsp/fw.rs           | 564 ++++++----------------
 drivers/gpu/nova-core/gsp/hal.rs          |  22 +-
 drivers/gpu/nova-core/gsp/hal/tu102.rs    |  12 -
 drivers/gpu/nova-core/gsp/sequencer.rs    | 379 ---------------
 drivers/gpu/nova-core/irq/gsp.rs          |   2 +-
 drivers/gpu/nova-core/mctp.rs             |   2 +
 15 files changed, 456 insertions(+), 1185 deletions(-)
 delete mode 100644 drivers/gpu/nova-core/gsp/sequencer.rs

diff --git a/drivers/gpu/nova-core/driver.rs b/drivers/gpu/nova-core/driver.rs
index 21d7df0744ed..eb657cc0062e 100644
--- a/drivers/gpu/nova-core/driver.rs
+++ b/drivers/gpu/nova-core/driver.rs
@@ -135,7 +135,7 @@ fn probe<'bound>(
                     // SAFETY: as for the `bar` borrow above.
                     let bar = unsafe { &*core::ptr::from_ref(bar) };
                     crate::irq::gsp::enable(bar, gpu.chipset(), vectors_ref.irq_type());
-                    gpu.cmdq().drain()?;
+                    gpu.cmdq().drain(bar)?;
                 },
                 _reg: auxiliary::Registration::new(
                     pdev.as_ref(),
diff --git a/drivers/gpu/nova-core/fb/hal/gb100.rs b/drivers/gpu/nova-core/fb/hal/gb100.rs
index d9e4d62ae632..2e2beb60cf3b 100644
--- a/drivers/gpu/nova-core/fb/hal/gb100.rs
+++ b/drivers/gpu/nova-core/fb/hal/gb100.rs
@@ -80,10 +80,27 @@ fn write_sysmem_flush_page_gb100(bar: Bar0<'_>, addr: Bounded<u64, 52>) {
     );
 }
 
-// This PMU reservation size is r570-specific.
+/// PMU backing store (see Open RM: `kpmuReservedMemoryBackingStoreSizeGet`).
+const PMU_BACKING_STORE_SIZE: usize = 9 * SZ_1M;
+
+/// PMU communication surfaces (see Open RM: `gpuGetPmuReservedMemorySurfacesSize`).
+const PMU_SURFACES_SIZE: usize = SZ_16M + SZ_256K;
+
+/// Miscellaneous PMU memory (see Open RM: `kpmuReservedMemoryMiscSizeGet`).
+const PMU_MISC_SIZE: usize = SZ_4K;
+
+// Open RM reserves the backing store, the surfaces and the misc memory as one region above
+// FRTS, aligned to KPMU_RESERVED_MEMORY_ALIGNMENT (see kpmuReservedMemorySizeGet).
 pub(super) const fn pmu_reserved_size_gb100() -> u32 {
-    usize_into_u32::<{ const_align_up(SZ_8M + SZ_16M + SZ_4K, Alignment::new::<SZ_128K>()).unwrap() }>(
-    )
+    usize_into_u32::<
+        {
+            const_align_up(
+                PMU_BACKING_STORE_SIZE + PMU_SURFACES_SIZE + PMU_MISC_SIZE,
+                Alignment::new::<SZ_128K>(),
+            )
+            .unwrap()
+        },
+    >()
 }
 
 impl FbHal for Gb100 {
@@ -112,7 +129,7 @@ fn pmu_reserved_size(&self) -> u32 {
     }
 
     fn non_wpr_heap_size(&self) -> u64 {
-        // Non-WPR heap for GB10x (see Open RM: kgspGetNonWprHeapSize, GB100/GB102).
+        // Open RM's kgspGetNonWprHeapSize returns a flat 2 MiB for GB10x.
         u64::SZ_2M
     }
 
diff --git a/drivers/gpu/nova-core/fb/hal/gb202.rs b/drivers/gpu/nova-core/fb/hal/gb202.rs
index 4341ecf36188..de063e518b50 100644
--- a/drivers/gpu/nova-core/fb/hal/gb202.rs
+++ b/drivers/gpu/nova-core/fb/hal/gb202.rs
@@ -72,9 +72,8 @@ fn pmu_reserved_size(&self) -> u32 {
     }
 
     fn non_wpr_heap_size(&self) -> u64 {
-        // Non-WPR heap for GB20x (see Open RM: kgspGetNonWprHeapSize, GB202+).
-        // This size is r570-specific.
-        u64::SZ_2M + u64::SZ_128K
+        // Open RM's kgspGetNonWprHeapSize returns a flat 3 MiB for GB20x.
+        3 * u64::SZ_1M
     }
 
     fn frts_size(&self) -> u64 {
diff --git a/drivers/gpu/nova-core/firmware/bindata.rs b/drivers/gpu/nova-core/firmware/bindata.rs
index d9625ab7d738..c303518b25b1 100644
--- a/drivers/gpu/nova-core/firmware/bindata.rs
+++ b/drivers/gpu/nova-core/firmware/bindata.rs
@@ -21,7 +21,6 @@
 /// A missing metadata file is reported as [`None`] so that the eventual caller can decide whether
 /// ucodes are optional for its boot path. Once the metadata has been found, all parse and payload
 /// loading errors, including a missing referenced file, are returned as errors.
-#[expect(dead_code)]
 pub(crate) fn request_ucodes_firmware(
     dev: &device::Device,
     chipset: Chipset,
diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index c0ba561a3bf1..a9b91db9fd27 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -27,7 +27,6 @@
     gsp::{
         self,
         cmdq::Cmdq,
-        commands::GetGspStaticInfoReply,
         Gsp,
         GspBootContext, //
     },
@@ -276,16 +275,14 @@ struct GspResources<'gpu> {
     /// GSP runtime data.
     #[pin]
     gsp: Gsp,
-    /// GSP unload firmware bundle, if any.
-    unload_bundle: Option<gsp::UnloadBundle>,
+    /// What the GSP boot sequence produced, including the unload bundle.
+    boot_result: gsp::BootResult,
 }
 
 /// Structure holding the resources required to operate the GPU.
 #[pin_data]
 pub(crate) struct Gpu<'gpu> {
     spec: Spec,
-    /// Static GPU information as provided by the GSP.
-    gsp_static_info: GetGspStaticInfoReply,
     /// GSP and its resources.
     #[pin]
     gsp_resources: GspResources<'gpu>,
@@ -303,7 +300,7 @@ fn drop(self: Pin<&mut Self>) {
         let this = self.project();
         let device = *this.device;
         let bar = *this.bar;
-        let bundle = this.unload_bundle.take();
+        let bundle = this.boot_result.take_unload_bundle();
 
         let _ = this
             .gsp
@@ -398,10 +395,10 @@ pub(crate) fn new(
 
                 gsp <- Gsp::new(pdev, spec.chipset),
 
-                // This member must be initialized last, so the `UnloadBundle` can never be dropped
+                // This member must be initialized last, so the unload bundle can never be dropped
                 // from outside of the constructed `GspResources`, ensuring that the unload sequence
                 // is properly run in case of failure.
-                unload_bundle: gsp.boot(GspBootContext {
+                boot_result: gsp.boot(GspBootContext {
                     pdev,
                     bar,
                     chipset: spec.chipset,
@@ -412,9 +409,9 @@ pub(crate) fn new(
                 })?,
             }),
 
-            gsp_static_info: {
-                // Obtain and display basic GPU information.
-                let info = gsp_resources.gsp.get_static_info(bar)?;
+            _: {
+                // The `GSP_INIT` reply already carried this.
+                let info = &gsp_resources.boot_result.static_info;
                 match info.gpu_name() {
                     Ok(name) => dev_info!(dev, "GPU name: {}\n", name),
                     Err(e) => dev_warn!(dev, "GPU name unavailable: {:?}\n", e),
@@ -434,8 +431,6 @@ pub(crate) fn new(
                             / u64::SZ_1M
                     );
                 }
-
-                info
             }
         })
     }
diff --git a/drivers/gpu/nova-core/gsp.rs b/drivers/gpu/nova-core/gsp.rs
index f1bd66024b72..8e912eaf8e2e 100644
--- a/drivers/gpu/nova-core/gsp.rs
+++ b/drivers/gpu/nova-core/gsp.rs
@@ -30,7 +30,6 @@
 #[cfg_attr(not(CONFIG_KUNIT), allow(dead_code))]
 mod nvkv;
 mod regs;
-mod sequencer;
 
 pub(crate) use fw::{
     GspFmcBootParams,
@@ -334,8 +333,12 @@ pub(crate) fn new(
             Ok(try_pin_init!(Self {
                 gsp_tlv,
                 cmdq: Arc::pin_init(Cmdq::new(dev), GFP_KERNEL)?,
-                rmargs: Coherent::init(dev, GFP_KERNEL, GspArgumentsPadded::new(cmdq.as_ref()))?,
                 rm_state_monitor: Coherent::zeroed(dev, GFP_KERNEL)?,
+                rmargs: Coherent::init(
+                    dev,
+                    GFP_KERNEL,
+                    GspArgumentsPadded::new(cmdq.as_ref(), None, rm_state_monitor),
+                )?,
                 libos: {
                     let mut libos = CoherentBox::zeroed_slice(
                         dev,
@@ -405,6 +408,9 @@ pub(crate) fn new(
     }
 
     /// Query the GSP for the static GPU information.
+    ///
+    /// The r000 boot path gets the same information from the `GSP_INIT` reply instead.
+    #[expect(dead_code)]
     pub(crate) fn get_static_info(&self, bar: Bar0<'_>) -> Result<commands::GetGspStaticInfoReply> {
         self.cmdq.send_command(bar, commands::GetGspStaticInfo)
     }
@@ -417,3 +423,27 @@ pub(crate) fn cmdq(&self) -> Arc<Cmdq> {
 
 /// Opaque bundle required to unload the GSP. Created by [`Gsp::boot`], consumed by [`Gsp::unload`].
 pub(crate) struct UnloadBundle(KBox<dyn hal::UnloadBundle>);
+
+/// What a successful [`Gsp::boot`] leaves the caller.
+pub(crate) struct BootResult {
+    unload_bundle: Option<UnloadBundle>,
+    /// Static GPU configuration, as reported in the `GSP_INIT` reply.
+    pub(crate) static_info: commands::GetGspStaticInfoReply,
+}
+
+impl BootResult {
+    pub(super) fn new(
+        unload_bundle: Option<UnloadBundle>,
+        static_info: commands::GetGspStaticInfoReply,
+    ) -> Self {
+        Self {
+            unload_bundle,
+            static_info,
+        }
+    }
+
+    /// Takes the unload bundle out, leaving none behind, for the teardown path.
+    pub(crate) fn take_unload_bundle(&mut self) -> Option<UnloadBundle> {
+        self.unload_bundle.take()
+    }
+}
diff --git a/drivers/gpu/nova-core/gsp/boot.rs b/drivers/gpu/nova-core/gsp/boot.rs
index 15933ecc061b..3e9a6a539cae 100644
--- a/drivers/gpu/nova-core/gsp/boot.rs
+++ b/drivers/gpu/nova-core/gsp/boot.rs
@@ -28,20 +28,28 @@
         FalconModSelAlgo, //
     },
     firmware::{
+        bindata::request_ucodes_firmware,
         gen_bootloader::{
             BootloaderDmemDescV2,
             GenericBootloader, //
         },
         gsp::GspFirmware,
+        radix3::Radix3, //
     },
     gsp::{
-        cmdq::Cmdq,
+        cmdq::{
+            Cmdq,
+            QueuePointers, //
+        },
         commands,
         fw::{
+            BindataArgs,
+            GspArgumentsPadded,
             GMCAPI_CMD_EXEC_GENERIC_BOOTLOADER,
             GMCAPI_CMD_EXEC_HS_BINARY, //
         }, //
     },
+    num,
     regs, //
 };
 
@@ -52,12 +60,17 @@ impl super::Gsp {
     /// user-space, patching them with signatures, and building firmware-specific intricate data
     /// structures that the GSP will use at runtime.
     ///
-    /// Upon return, the GSP is up and running, and its unload bundle (to be given as argument to
-    /// [`Self::unload`]) returned.
+    /// Upon return, the GSP is up and running, and the static configuration it reported plus its
+    /// unload bundle (to be given as argument to [`Self::unload`]) are returned.
+    ///
+    /// # Errors
+    ///
+    /// - `ENOENT` if the ucodes firmware image is absent. GSP-RM requires it on every chipset
+    ///   this driver supports.
     pub(crate) fn boot(
         self: Pin<&mut Self>,
         mut ctx: super::GspBootContext<'_, '_>,
-    ) -> Result<Option<super::UnloadBundle>> {
+    ) -> Result<super::BootResult> {
         let pdev = ctx.pdev;
         let bar = ctx.bar;
         let chipset = ctx.chipset;
@@ -67,6 +80,19 @@ pub(crate) fn boot(
 
         let gsp_fw = KBox::pin_init(GspFirmware::new(dev, chipset, &self.gsp_tlv), GFP_KERNEL)?;
 
+        // GSP-RM reads the ucodes image through a radix3 page table, so the mapping has to
+        // outlive initialization.
+        let ucodes = request_ucodes_firmware(dev, chipset)?.ok_or(ENOENT)?;
+        let ucodes_size = ucodes.len();
+        let ucodes_radix3 = KBox::pin_init(Radix3::new(dev, ucodes), GFP_KERNEL)?;
+        GspArgumentsPadded::set_bindata(
+            &self.rmargs,
+            Some(&BindataArgs {
+                radix3: ucodes_radix3.dma_address(),
+                size: num::usize_as_u64(ucodes_size),
+            }),
+        );
+
         // Perform the chipset-specific boot sequence, and retrieve the unload bundle.
         let unload_bundle = hal.boot(&self, &mut ctx, &gsp_fw)?.or_else(|| {
             dev_warn!(dev, "The GSP won't be able to unload properly on unbind.\n");
@@ -96,17 +122,41 @@ pub(crate) fn boot(
 
         dev_dbg!(pdev, "RISC-V active? {}\n", gsp_falcon.is_riscv_active(),);
 
-        self.cmdq
-            .send_command_no_wait(bar, commands::SetSystemInfo::new(pdev, chipset))?;
-        self.cmdq
-            .send_command_no_wait(bar, commands::SetRegistry::new(ctx.vgpu.state())?)?;
-
-        hal.post_boot(&self, ctx, &gsp_fw)?;
-
-        // Wait until GSP is fully initialized.
-        commands::wait_gsp_init_done(&self.cmdq)?;
+        // GSP-RM discards any RPC that reaches it before GSP_INIT, so the system information and
+        // the registry keys ride inside that one request. Its reply is also what says GSP-RM has
+        // finished starting, and the load-and-execute events it raises first are dispatched as
+        // they arrive.
+        let init_payload = commands::build_gsp_init_payload(pdev, chipset, ctx.vgpu.state())?;
+        // Only the chipsets that raise `GMCAPI_CMD_EXEC_GENERIC_BOOTLOADER` are shipped a
+        // `gen_bootloader.tlv`, so requesting it elsewhere fails the whole boot with `ENOENT`.
+        let bootloader = if super::hal::uses_generic_bootloader(chipset) {
+            Some(GenericBootloader::new(dev, chipset, gsp_falcon)?)
+        } else {
+            None
+        };
+        let bootloader_app_version = gsp_fw.bootloader.app_version;
+        let libos_dma_handle = self.libos.dma_address();
+        let sec2_falcon = ctx.sec2_falcon;
+
+        let static_info =
+            commands::gsp_init(&self.cmdq, bar, &init_payload, |command_id, payload| {
+                Self::dispatch_gmc_boot_event(
+                    command_id,
+                    payload,
+                    bootloader.as_ref(),
+                    gsp_falcon,
+                    sec2_falcon,
+                    bar,
+                    dev,
+                    bootloader_app_version,
+                    libos_dma_handle,
+                )
+            })?;
 
-        Ok(unload_guard.dismiss().1)
+        Ok(super::BootResult::new(
+            unload_guard.dismiss().1,
+            static_info,
+        ))
     }
 
     /// Restart GSP-RM once a load-and-execute image has run to completion.
@@ -115,6 +165,8 @@ pub(crate) fn boot(
     /// mailboxes, and starts SEC2, which is what brings GSP-RM back up. Open RM calls this
     /// `kgspExecuteCoreResume`.
     ///
+    /// The falcon reset zeroes the four msgq v2 pointer registers.
+    ///
     /// # Errors
     ///
     /// - `EIO` if SEC2 reports a failure, or if the GSP is not running RISC-V afterwards.
@@ -171,35 +223,48 @@ fn core_resume(
     /// LIBOS2 chipsets send `GMCAPI_CMD_EXEC_GENERIC_BOOTLOADER` and LIBOS3 chipsets send
     /// `GMCAPI_CMD_EXEC_HS_BINARY`, so a given GPU only ever reaches one of the two handlers.
     ///
+    /// Both handlers restart GSP-RM, so a successful dispatch returns
+    /// [`QueuePointers::Reset`].
+    ///
     /// # Errors
     ///
-    /// - `EINVAL` if `command_id` is not a load-and-execute command.
+    /// - `EINVAL` if `command_id` is not a load-and-execute command, or if the GSP asks for the
+    ///   generic bootloader on a chipset that boots without one.
     ///
     /// Errors from the handlers are propagated as-is.
-    #[expect(dead_code)]
     #[allow(clippy::too_many_arguments)]
     fn dispatch_gmc_boot_event(
         command_id: u32,
         payload: &[u8],
-        bootloader: &GenericBootloader,
+        bootloader: Option<&GenericBootloader>,
         gsp_falcon: &Falcon<'_, Gsp>,
         sec2_falcon: &Falcon<'_, Sec2>,
         bar: Bar0<'_>,
         dev: &device::Device,
         bootloader_app_version: u32,
         libos_dma_handle: u64,
-    ) -> Result {
+    ) -> Result<QueuePointers> {
         match command_id {
-            GMCAPI_CMD_EXEC_GENERIC_BOOTLOADER => Self::handle_load_exec_bootloader(
-                payload,
-                bootloader,
-                gsp_falcon,
-                sec2_falcon,
-                bar,
-                dev,
-                bootloader_app_version,
-                libos_dma_handle,
-            ),
+            GMCAPI_CMD_EXEC_GENERIC_BOOTLOADER => {
+                let Some(bootloader) = bootloader else {
+                    dev_err!(
+                        dev,
+                        "GSP asked for the generic bootloader, which this chipset does not use\n"
+                    );
+                    return Err(EINVAL);
+                };
+
+                Self::handle_load_exec_bootloader(
+                    payload,
+                    bootloader,
+                    gsp_falcon,
+                    sec2_falcon,
+                    bar,
+                    dev,
+                    bootloader_app_version,
+                    libos_dma_handle,
+                )
+            }
             GMCAPI_CMD_EXEC_HS_BINARY => Self::handle_load_exec_hs_binary(
                 payload,
                 gsp_falcon,
@@ -227,6 +292,9 @@ fn dispatch_gmc_boot_event(
     /// aperture at wherever the image lives, and runs the bootloader, which does the copy from
     /// the descriptor and jumps to the image. The aperture is restored afterwards.
     ///
+    /// Ends in [`Self::core_resume`], so on success the msgq v2 pointer registers read zero and
+    /// the return is [`QueuePointers::Reset`].
+    ///
     /// # Errors
     ///
     /// - `EINVAL` if the payload is shorter than the parameter block, the descriptor is not the
@@ -243,7 +311,7 @@ fn handle_load_exec_bootloader(
         dev: &device::Device,
         bootloader_app_version: u32,
         libos_dma_handle: u64,
-    ) -> Result {
+    ) -> Result<QueuePointers> {
         let params = LoadExecGenericBootloaderParams::from_bytes_prefix(payload)
             .ok_or(EINVAL)?
             .0;
@@ -311,7 +379,9 @@ fn handle_load_exec_bootloader(
             dev,
             bootloader_app_version,
             libos_dma_handle,
-        )
+        )?;
+
+        Ok(QueuePointers::Reset)
     }
 
     /// Handle a `GSP_LOAD_EXEC_HS_BINARY` event.
@@ -320,6 +390,9 @@ fn handle_load_exec_bootloader(
     /// framebuffer. The driver DMAs the image into falcon memory, programs the BROM registers
     /// that make the falcon verify its PKC signature, runs it, and resumes GSP-RM.
     ///
+    /// Ends in [`Self::core_resume`], so on success the msgq v2 pointer registers read zero and
+    /// the return is [`QueuePointers::Reset`].
+    ///
     /// # Errors
     ///
     /// - `EINVAL` if the payload is shorter than the parameter block, or the ucode id does not
@@ -334,7 +407,7 @@ fn handle_load_exec_hs_binary(
         dev: &device::Device,
         bootloader_app_version: u32,
         libos_dma_handle: u64,
-    ) -> Result {
+    ) -> Result<QueuePointers> {
         let params = HsBinaryParams::from_bytes_prefix(payload).ok_or(EINVAL)?.0;
 
         gsp_falcon.wait_for_processor_suspend().inspect_err(|_| {
@@ -429,7 +502,9 @@ fn handle_load_exec_hs_binary(
             dev,
             bootloader_app_version,
             libos_dma_handle,
-        )
+        )?;
+
+        Ok(QueuePointers::Reset)
     }
 
     /// Shut down the GSP and wait until it is offline.
diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gsp/cmdq.rs
index 82ff46620911..8a8b8457d870 100644
--- a/drivers/gpu/nova-core/gsp/cmdq.rs
+++ b/drivers/gpu/nova-core/gsp/cmdq.rs
@@ -55,8 +55,7 @@
             GspGmcMsgElement,
             GspMsgElement,
             MsgFunction,
-            MsgqRxHeader,
-            MsgqTxHeader,
+            MsgqTxHeaderV2,
             GSP_MSG_QUEUE_ELEMENT_SIZE_MAX, //
         },
         PteArray,
@@ -185,17 +184,15 @@ struct MsgqData {
 ///
 /// Contains the data for a message queue, that either the driver or GSP writes to.
 ///
-/// Note that while the write pointer of `tx` corresponds to the `msgq` of the same instance, the
-/// read pointer of `rx` actually refers to the `Msgq` owned by the other side.
-/// This design ensures that only the driver or GSP ever writes to a given instance of this struct.
+/// Msgq v2 keeps all four ring pointers in BAR0, so this struct carries queue geometry and
+/// message data only. `msgq` is aligned to [`GSP_PAGE_SIZE`], which leaves the space that
+/// carried the msgq v0 read-pointer header as zeroed padding after `tx`.
 #[repr(C)]
 // There is no struct defined for this in the open-gpu-kernel-source headers.
 // Instead it is defined by code in `GspMsgQueuesInit()`.
 struct Msgq {
-    /// Header for sending messages, including the write pointer.
-    tx: MsgqTxHeader,
-    /// Header for receiving messages, including the read pointer.
-    rx: MsgqRxHeader,
+    /// Header describing the queue geometry.
+    tx: MsgqTxHeaderV2,
     /// The message queue proper.
     msgq: MsgqData,
 }
@@ -248,11 +245,13 @@ impl DmaGspMem {
     /// Allocate a new instance and map it for `dev`.
     fn new(dev: &device::Device<device::Bound>) -> Result<Self> {
         const MSGQ_SIZE: u32 = num::usize_into_u32::<{ size_of::<Msgq>() }>();
-        const RX_HDR_OFF: u32 = num::usize_into_u32::<{ mem::offset_of!(Msgq, rx) }>();
+        const MSG_SIZE: u32 = num::usize_into_u32::<GSP_PAGE_SIZE>();
+        const ENTRY_OFF: u32 = num::usize_into_u32::<{ mem::offset_of!(Msgq, msgq) }>();
 
+        // Msgq v2 keeps all four ring pointers in BAR0, so the in-memory RX header is never
+        // written and the TX header carries geometry only.
         let mut gsp_mem = CoherentBox::<GspMem>::zeroed(dev, GFP_KERNEL)?;
-        gsp_mem.cpuq.tx = MsgqTxHeader::new(MSGQ_SIZE, RX_HDR_OFF, MSGQ_NUM_PAGES);
-        gsp_mem.cpuq.rx = MsgqRxHeader::new();
+        gsp_mem.cpuq.tx = MsgqTxHeaderV2::new(MSGQ_SIZE, MSG_SIZE, MSGQ_NUM_PAGES, ENTRY_OFF);
 
         let gsp_mem: Coherent<_> = gsp_mem.into();
         PteArray::init(io_project!(gsp_mem, .ptes), gsp_mem.dma_address())?;
@@ -260,109 +259,6 @@ fn new(dev: &device::Device<device::Bound>) -> Result<Self> {
         Ok(Self(gsp_mem))
     }
 
-    /// Returns the region of the CPU message queue that the driver is currently allowed to write
-    /// to.
-    ///
-    /// As the message queue is a circular buffer, the region may be discontiguous in memory. In
-    /// that case the second slice will have a non-zero length.
-    fn driver_write_area(&mut self) -> (&mut [[u8; GSP_PAGE_SIZE]], &mut [[u8; GSP_PAGE_SIZE]]) {
-        let tx = self.cpu_write_ptr();
-        let rx = self.gsp_read_ptr();
-
-        // Pointer to the first entry of the CPU message queue.
-        let data = ptr::project!(mut self.0.as_mut_ptr(), .cpuq.msgq.data[build: 0]);
-
-        let (tail_end, wrap_end) = if rx == 0 {
-            // The write area is non-wrapping, and stops at the second-to-last entry of the command
-            // queue (to leave the last one empty).
-            (MSGQ_NUM_PAGES - 1, 0)
-        } else if rx <= tx {
-            // The write area wraps and continues until `rx - 1`.
-            (MSGQ_NUM_PAGES, rx - 1)
-        } else {
-            // The write area doesn't wrap and stops at `rx - 1`.
-            (rx - 1, 0)
-        };
-
-        // SAFETY:
-        // - `data` was created from a valid pointer, and `rx` and `tx` are in the
-        //   `0..MSGQ_NUM_PAGES` range per the invariants of `cpu_write_ptr` and `gsp_read_ptr`,
-        //   thus the created slices are valid.
-        // - The area starting at `tx` and ending at `rx - 2` modulo `MSGQ_NUM_PAGES`,
-        //   inclusive, belongs to the driver for writing and is not accessed concurrently by
-        //   the GSP.
-        // - The caller holds a reference to `self` for as long as the returned slices are live,
-        //   meaning the CPU write pointer cannot be advanced and thus that the returned area
-        //   remains exclusive to the CPU for the duration of the slices.
-        // - The created slices point to non-overlapping sub-ranges of `data` in all
-        //   branches (in the `rx <= tx` case, the second slice ends at `rx - 1` which is strictly
-        //   less than `tx` where the first slice starts; in the other cases the second slice is
-        //   empty), so creating two `&mut` references from them does not violate aliasing rules.
-        unsafe {
-            (
-                core::slice::from_raw_parts_mut(
-                    data.add(num::u32_as_usize(tx)),
-                    num::u32_as_usize(tail_end - tx),
-                ),
-                core::slice::from_raw_parts_mut(data, num::u32_as_usize(wrap_end)),
-            )
-        }
-    }
-
-    /// Returns the size of the region of the CPU message queue that the driver is currently allowed
-    /// to write to, in bytes.
-    fn driver_write_area_size(&self) -> usize {
-        let tx = self.cpu_write_ptr();
-        let rx = self.gsp_read_ptr();
-
-        // `rx` and `tx` are both in `0..MSGQ_NUM_PAGES` per the invariants of `gsp_read_ptr` and
-        // `cpu_write_ptr`. The minimum value case is where `rx == 0` and `tx == MSGQ_NUM_PAGES -
-        // 1`, which gives `0 + MSGQ_NUM_PAGES - (MSGQ_NUM_PAGES - 1) - 1 == 0`.
-        let slots = (rx + MSGQ_NUM_PAGES - tx - 1) % MSGQ_NUM_PAGES;
-        num::u32_as_usize(slots) * GSP_PAGE_SIZE
-    }
-
-    /// Returns the region of the GSP message queue that the driver is currently allowed to read
-    /// from.
-    ///
-    /// As the message queue is a circular buffer, the region may be discontiguous in memory. In
-    /// that case the second slice will have a non-zero length.
-    fn driver_read_area(&self) -> (&[[u8; GSP_PAGE_SIZE]], &[[u8; GSP_PAGE_SIZE]]) {
-        let tx = self.gsp_write_ptr();
-        let rx = self.cpu_read_ptr();
-
-        // Pointer to the first entry of the GSP message queue.
-        let data = ptr::project!(self.0.as_ptr(), .gspq.msgq.data[build: 0]);
-
-        let (tail_end, wrap_end) = if rx <= tx {
-            // Read area is non-wrapping and stops right before `tx`.
-            (tx, 0)
-        } else {
-            // Read area is wrapping and stops right before `tx`.
-            (MSGQ_NUM_PAGES, tx)
-        };
-
-        // SAFETY:
-        // - `data` was created from a valid pointer, and `rx` and `tx` are in the
-        //   `0..MSGQ_NUM_PAGES` range per the invariants of `gsp_write_ptr` and `cpu_read_ptr`,
-        //   thus the created slices are valid.
-        // - The area starting at `rx` and ending at `tx - 1` modulo `MSGQ_NUM_PAGES`,
-        //   inclusive, belongs to the driver for reading and is not accessed concurrently by
-        //   the GSP.
-        // - The caller holds a reference to `self` for as long as the returned slices are live,
-        //   meaning the CPU read pointer cannot be advanced and thus that the returned area
-        //   remains exclusive to the CPU for the duration of the slices.
-        unsafe {
-            (
-                core::slice::from_raw_parts(
-                    data.add(num::u32_as_usize(rx)),
-                    num::u32_as_usize(tail_end - rx),
-                ),
-                core::slice::from_raw_parts(data, num::u32_as_usize(wrap_end)),
-            )
-        }
-    }
-
     /// Allocates a region on the command queue that is large enough to send a command of `size`
     /// bytes, waiting for space to become available based on the provided timeout.
     ///
@@ -377,6 +273,7 @@ fn driver_write_area_size(&self) -> usize {
     /// - `EIO` if the command header is not properly aligned.
     fn allocate_command<H: FromBytes + AsBytes>(
         &mut self,
+        bar: Bar0<'_>,
         size: usize,
         timeout: Delta,
     ) -> Result<GspCommand<'_, H>> {
@@ -384,7 +281,7 @@ fn allocate_command<H: FromBytes + AsBytes>(
             return Err(EMSGSIZE);
         }
         read_poll_timeout(
-            || Ok(self.driver_write_area_size()),
+            || Ok(Self::driver_write_area_size_v2(bar)),
             |available_bytes| *available_bytes >= size_of::<H>() + size,
             Delta::from_micros(1),
             timeout,
@@ -392,7 +289,7 @@ fn allocate_command<H: FromBytes + AsBytes>(
 
         // Get the current writable area as an array of bytes.
         let (slice_1, slice_2) = {
-            let (slice_1, slice_2) = self.driver_write_area();
+            let (slice_1, slice_2) = self.driver_write_area_v2(bar);
 
             (slice_1.as_flattened_mut(), slice_2.as_flattened_mut())
         };
@@ -415,63 +312,6 @@ fn allocate_command<H: FromBytes + AsBytes>(
             contents: (slice_1, slice_2),
         })
     }
-
-    // Returns the index of the memory page the GSP will write the next message to.
-    //
-    // # Invariants
-    //
-    // - The returned value is within `0..MSGQ_NUM_PAGES`.
-    fn gsp_write_ptr(&self) -> u32 {
-        MsgqTxHeader::write_ptr(io_project!(self.0, .gspq.tx)) % MSGQ_NUM_PAGES
-    }
-
-    // Returns the index of the memory page the GSP will read the next command from.
-    //
-    // # Invariants
-    //
-    // - The returned value is within `0..MSGQ_NUM_PAGES`.
-    fn gsp_read_ptr(&self) -> u32 {
-        MsgqRxHeader::read_ptr(io_project!(self.0, .gspq.rx)) % MSGQ_NUM_PAGES
-    }
-
-    // Returns the index of the memory page the CPU can read the next message from.
-    //
-    // # Invariants
-    //
-    // - The returned value is within `0..MSGQ_NUM_PAGES`.
-    fn cpu_read_ptr(&self) -> u32 {
-        MsgqRxHeader::read_ptr(io_project!(self.0, .cpuq.rx)) % MSGQ_NUM_PAGES
-    }
-
-    // Informs the GSP that it can send `elem_count` new pages into the message queue.
-    fn advance_cpu_read_ptr(&mut self, elem_count: u32) {
-        let rx = io_project!(self.0, .cpuq.rx);
-        let rptr = MsgqRxHeader::read_ptr(rx).wrapping_add(elem_count) % MSGQ_NUM_PAGES;
-
-        // Ensure read pointer is properly ordered.
-        fence(Ordering::SeqCst);
-
-        MsgqRxHeader::set_read_ptr(rx, rptr)
-    }
-
-    // Returns the index of the memory page the CPU can write the next command to.
-    //
-    // # Invariants
-    //
-    // - The returned value is within `0..MSGQ_NUM_PAGES`.
-    fn cpu_write_ptr(&self) -> u32 {
-        MsgqTxHeader::write_ptr(io_project!(self.0, .cpuq.tx)) % MSGQ_NUM_PAGES
-    }
-
-    // Informs the GSP that it can process `elem_count` new pages from the command queue.
-    fn advance_cpu_write_ptr(&mut self, elem_count: u32) {
-        let tx = io_project!(self.0, .cpuq.tx);
-        let wptr = MsgqTxHeader::write_ptr(tx).wrapping_add(elem_count) % MSGQ_NUM_PAGES;
-        MsgqTxHeader::set_write_ptr(tx, wptr);
-
-        // Ensure all command data is visible before triggering the GSP read.
-        fence(Ordering::SeqCst);
-    }
 }
 
 // Msgq v2 internals.
@@ -489,14 +329,15 @@ fn advance_cpu_write_ptr(&mut self, elem_count: u32) {
 //     CPU RX read:            NV_PGSP_MSGQ_TAIL
 //
 // A GSP reset zeroes all four counters while the in-memory ring keeps its
-// contents, so the two ends can be out of step. Between the reset and
-// GSP-RM writing its counter back the read pointer is ahead of the write
-// pointer, which `driver_read_area_v2` reports as an empty ring.
+// contents. Neither end restarts at zero: GSP-RM writes its own two back
+// from its internal state when it resumes, and the driver writes back the
+// two it owns (`restore_cpu_ptrs_v2`). Between the reset and GSP-RM's
+// write-back the read pointer is ahead of the write pointer, which
+// `driver_read_area_v2` reports as an empty ring.
 //
 // TODO: suspend/resume reset-recovery is not implemented. A power cycle
 // loses the driver-side counters as well, so both ends have to be
-// re-established.
-#[expect(dead_code)]
+// re-established rather than restored.
 impl DmaGspMem {
     fn gsp_write_ptr_v2(bar: Bar0<'_>) -> u32 {
         *bar.read(regs::NV_PGSP_MSGQ_HEAD).address()
@@ -514,6 +355,18 @@ fn cpu_write_ptr_v2(bar: Bar0<'_>) -> u32 {
         *bar.read(regs::NV_PGSP_QUEUE_HEAD).address()
     }
 
+    /// Writes back the two counters the driver owns, after a GSP reset has zeroed all four.
+    ///
+    /// GSP-RM restores `NV_PGSP_MSGQ_HEAD` and `NV_PGSP_QUEUE_TAIL` from its own state when it
+    /// resumes, and continues counting from where it left off rather than from zero. The driver
+    /// owns the other two and has to do the same, or the two ends address different slots.
+    fn restore_cpu_ptrs_v2(bar: Bar0<'_>, write_ptr: u32, read_ptr: u32) {
+        fence(Ordering::SeqCst);
+
+        bar.write_reg(regs::NV_PGSP_MSGQ_TAIL::zeroed().with_address(read_ptr));
+        bar.write_reg(regs::NV_PGSP_QUEUE_HEAD::zeroed().with_address(write_ptr));
+    }
+
     fn advance_cpu_read_ptr_v2(bar: Bar0<'_>, count: u32) {
         let new_rptr = Self::cpu_read_ptr_v2(bar).wrapping_add(count);
 
@@ -649,6 +502,20 @@ struct GmcMessage<'a> {
     contents: (&'a [u8], &'a [u8]),
 }
 
+/// State of the msgq v2 pointer registers after a GMC dispatch handler has run.
+///
+/// Resetting the GSP falcon zeroes all four pointer registers, which leaves the read pointer
+/// where consuming the current element would have put it. A handler reports which case applies
+/// so that [`CmdqInner::receive_gmc_and_dispatch`] can tell whether the read pointer still needs
+/// advancing.
+#[derive(PartialEq, Eq)]
+pub(crate) enum QueuePointers {
+    /// The handler left the pointer registers alone.
+    Unchanged,
+    /// The handler reset the GSP, which zeroed the pointer registers.
+    Reset,
+}
+
 /// GSP command queue.
 ///
 /// Provides the ability to send commands and receive messages from the GSP using a shared memory
@@ -692,7 +559,6 @@ pub(crate) fn new(dev: &device::Device<device::Bound>) -> impl PinInit<Self, Err
                 inner <- new_mutex!(CmdqInner {
                     dev: dev.into(),
                     gsp_mem,
-                    elem_seq: 0,
                     rpc_seq: 0,
                     tx_async_seq: 0,
                     rx_event_seq: 0,
@@ -702,24 +568,6 @@ pub(crate) fn new(dev: &device::Device<device::Bound>) -> impl PinInit<Self, Err
         })
     }
 
-    /// Computes the checksum for the message pointed to by `it`.
-    ///
-    /// A message is made of several parts, so `it` is an iterator over byte slices representing
-    /// these parts.
-    fn calculate_checksum<T: Iterator<Item = u8>>(it: T) -> u32 {
-        let sum64 = it
-            .enumerate()
-            .map(|(idx, byte)| (((idx % 8) * 8) as u32, byte))
-            .fold(0, |acc, (rol, byte)| acc ^ u64::from(byte).rotate_left(rol));
-
-        ((sum64 >> 32) as u32) ^ (sum64 as u32)
-    }
-
-    /// Notifies the GSP that we have updated the command queue pointers.
-    fn notify_gsp(bar: Bar0<'_>) {
-        bar.write_reg(regs::NV_PGSP_QUEUE_HEAD::zeroed().with_address(0u32));
-    }
-
     /// Sends `command` to the GSP and waits for the reply.
     ///
     /// A message read while waiting that is not the reply goes to
@@ -753,7 +601,7 @@ pub(crate) fn send_command<M>(&self, bar: Bar0<'_>, command: M) -> Result<M::Rep
             if remaining.is_negative() {
                 break Err(ETIMEDOUT);
             }
-            match inner.receive_msg::<M::Reply>(remaining, Some(expected_seq)) {
+            match inner.receive_msg::<M::Reply>(bar, remaining, Some(expected_seq)) {
                 Ok(reply) => break Ok(reply),
                 Err(ERANGE) => continue,
                 Err(e) => break Err(e),
@@ -770,6 +618,7 @@ pub(crate) fn send_command<M>(&self, bar: Bar0<'_>, command: M) -> Result<M::Rep
     ///   written to by its [`CommandToGsp::init_variable_payload`] method.
     ///
     /// Error codes returned by the command initializers are propagated as-is.
+    #[expect(dead_code)]
     pub(crate) fn send_command_no_wait<M>(&self, bar: Bar0<'_>, command: M) -> Result
     where
         M: CommandToGsp<Reply = NoReply>,
@@ -782,12 +631,12 @@ pub(crate) fn send_command_no_wait<M>(&self, bar: Bar0<'_>, command: M) -> Resul
     ///
     /// Returns `ERANGE` if the message that arrives is not of type `M`. See
     /// [`CmdqInner::receive_msg`].
-    fn receive_msg<M: MessageFromGsp>(&self, timeout: Delta) -> Result<M>
+    fn receive_msg<M: MessageFromGsp>(&self, bar: Bar0<'_>, timeout: Delta) -> Result<M>
     where
         // This allows all error types, including `Infallible`, to be used for `M::InitError`.
         Error: From<M::InitError>,
     {
-        self.inner.lock().receive_msg(timeout, None)
+        self.inner.lock().receive_msg(bar, timeout, None)
     }
 
     /// Receives one GMC element from the GSP and passes its command id, the `max_resp_or_status`
@@ -799,10 +648,13 @@ fn receive_msg<M: MessageFromGsp>(&self, timeout: Delta) -> Result<M>
     /// See [`CmdqInner::receive_gmc_and_dispatch`] for return values, queue state, and errors.
     pub(crate) fn receive_gmc_and_dispatch<R>(
         &self,
+        bar: Bar0<'_>,
         timeout: Delta,
-        handler: impl FnOnce(u32, u32, &[u8], &[u8]) -> Option<R>,
+        handler: impl FnOnce(u32, u32, &[u8], &[u8]) -> (Option<R>, QueuePointers),
     ) -> Result<Option<R>> {
-        self.inner.lock().receive_gmc_and_dispatch(timeout, handler)
+        self.inner
+            .lock()
+            .receive_gmc_and_dispatch(bar, timeout, handler)
     }
 
     /// Sends a GMC API command to the GSP without waiting for its response.
@@ -834,7 +686,8 @@ pub(crate) fn send_gmc_no_wait(
     ///
     /// - `ETIMEDOUT` if the event does not arrive within [`Self::RECEIVE_TIMEOUT`] of the call,
     ///   however many other events are dispatched while waiting.
-    pub(crate) fn await_msg<M: MessageFromGsp>(&self) -> Result<M>
+    #[expect(dead_code)]
+    pub(crate) fn await_msg<M: MessageFromGsp>(&self, bar: Bar0<'_>) -> Result<M>
     where
         // This allows all error types, including `Infallible`, to be used for `M::InitError`.
         Error: From<M::InitError>,
@@ -845,7 +698,7 @@ pub(crate) fn await_msg<M: MessageFromGsp>(&self) -> Result<M>
             if remaining.is_negative() {
                 break Err(ETIMEDOUT);
             }
-            match self.receive_msg::<M>(remaining) {
+            match self.receive_msg::<M>(bar, remaining) {
                 Ok(msg) => break Ok(msg),
                 Err(ERANGE) => continue,
                 Err(e) => break Err(e),
@@ -861,8 +714,8 @@ pub(crate) fn await_msg<M: MessageFromGsp>(&self) -> Result<M>
     /// # Errors
     ///
     /// Propagates a receive error, in particular the `EIO` of a queue poisoned by corrupt framing.
-    pub(crate) fn drain(&self) -> Result {
-        self.inner.lock().drain()
+    pub(crate) fn drain(&self, bar: Bar0<'_>) -> Result {
+        self.inner.lock().drain(bar)
     }
 }
 
@@ -870,9 +723,6 @@ pub(crate) fn drain(&self) -> Result {
 struct CmdqInner {
     /// Device this command queue belongs to.
     dev: ARef<device::Device>,
-    /// Next transport sequence number for a queue element (the `seqNum` field). Advances once per
-    /// queue element, including each continuation record.
-    elem_seq: u32,
     /// Next RPC sequence number. The GSP echoes it in a command's reply, which lets
     /// [`CmdqInner::receive_msg`] match that reply to the awaiting command. Advances once per
     /// logical command.
@@ -883,7 +733,7 @@ struct CmdqInner {
     /// Debug-log sequence for GSP-initiated events. The GSP leaves the RPC sequence unset on
     /// those messages, so the driver numbers them itself.
     rx_event_seq: u32,
-    /// Set once a message with corrupt framing or a bad checksum is seen. Such a message has an
+    /// Set once a message with corrupt framing or a bad MCTP magic is seen. Such a message has an
     /// untrusted length, so the queue cannot be advanced past it, and every later receive fails
     /// until the queue is torn down and reset.
     ///
@@ -916,7 +766,7 @@ fn send_single_command<M>(&mut self, bar: Bar0<'_>, command: M, rpc_seq: u32) ->
         let size_in_bytes = command.size();
         let dst = self
             .gsp_mem
-            .allocate_command(size_in_bytes, Self::ALLOCATE_TIMEOUT)?;
+            .allocate_command(bar, size_in_bytes, Self::ALLOCATE_TIMEOUT)?;
 
         // Extract area for the command itself. The GSP message header and the command header
         // together are guaranteed to fit entirely into a single page, so it's ok to only look
@@ -924,7 +774,7 @@ fn send_single_command<M>(&mut self, bar: Bar0<'_>, command: M, rpc_seq: u32) ->
         let (cmd, payload_1) = M::Command::from_bytes_mut_prefix(dst.contents.0).ok_or(EIO)?;
 
         // Fill the header and command in-place.
-        let msg_element = GspMsgElement::init(self.elem_seq, rpc_seq, size_in_bytes, M::FUNCTION);
+        let msg_element = GspMsgElement::init(rpc_seq, size_in_bytes, M::FUNCTION);
         // SAFETY: `msg_header` and `cmd` are valid references, and not touched if the initializer
         // fails.
         unsafe {
@@ -941,14 +791,6 @@ fn send_single_command<M>(&mut self, bar: Bar0<'_>, command: M, rpc_seq: u32) ->
         }
         drop(sbuffer);
 
-        // Compute checksum now that the whole message is ready.
-        dst.header
-            .set_checksum(Cmdq::calculate_checksum(SBufferIter::new_reader([
-                dst.header.as_bytes(),
-                dst.contents.0,
-                dst.contents.1,
-            ])));
-
         if M::IS_ASYNC {
             dev_dbg!(
                 &self.dev,
@@ -970,9 +812,7 @@ fn send_single_command<M>(&mut self, bar: Bar0<'_>, command: M, rpc_seq: u32) ->
 
         // All set - update the write pointer and inform the GSP of the new command.
         let elem_count = dst.header.element_count();
-        self.elem_seq = self.elem_seq.wrapping_add(1);
-        self.gsp_mem.advance_cpu_write_ptr(elem_count);
-        Cmdq::notify_gsp(bar);
+        DmaGspMem::advance_cpu_write_ptr_v2(bar, elem_count);
 
         Ok(())
     }
@@ -1036,9 +876,11 @@ fn send_gmc(
         let rpc_seq = self.rpc_seq;
         self.rpc_seq = self.rpc_seq.wrapping_add(1);
 
-        let dst = self
-            .gsp_mem
-            .allocate_command::<GspGmcMsgElement>(payload.len(), Self::ALLOCATE_TIMEOUT)?;
+        let dst = self.gsp_mem.allocate_command::<GspGmcMsgElement>(
+            bar,
+            payload.len(),
+            Self::ALLOCATE_TIMEOUT,
+        )?;
 
         let msg_element = GspGmcMsgElement::init(
             command_id,
@@ -1063,8 +905,7 @@ fn send_gmc(
         );
 
         let elem_count = dst.header.element_count();
-        self.gsp_mem.advance_cpu_write_ptr(elem_count);
-        Cmdq::notify_gsp(bar);
+        DmaGspMem::advance_cpu_write_ptr_v2(bar, elem_count);
 
         Ok(())
     }
@@ -1085,14 +926,14 @@ fn send_gmc(
     /// - `ETIMEDOUT` if `timeout` has elapsed before any message becomes available.
     /// - `EIO` if the framing or the checksum is invalid, or the queue was already poisoned by an
     ///   earlier such failure. Either failure poisons the queue, so recovery requires a reset.
-    fn wait_for_msg(&self, timeout: Delta) -> Result<GspMessage<'_>> {
+    fn wait_for_msg(&self, bar: Bar0<'_>, timeout: Delta) -> Result<GspMessage<'_>> {
         if self.poisoned.get() {
             return Err(EIO);
         }
 
         // Wait for a message to arrive from the GSP.
         let (slice_1, slice_2) = read_poll_timeout(
-            || Ok(self.gsp_mem.driver_read_area()),
+            || Ok(self.gsp_mem.driver_read_area_v2(bar)),
             |driver_area| !driver_area.0.is_empty(),
             Delta::from_millis(1),
             timeout,
@@ -1126,16 +967,10 @@ fn wait_for_msg(&self, timeout: Delta) -> Result<GspMessage<'_>> {
             )
         };
 
-        // Validate checksum.
-        if Cmdq::calculate_checksum(SBufferIter::new_reader([
-            header.as_bytes(),
-            slice_1,
-            slice_2,
-        ])) != 0
-        {
+        if !header.has_valid_magic() {
             dev_err!(
                 &self.dev,
-                "GSP RPC: receive: Call {} - bad checksum\n",
+                "GSP RPC: receive: Call {} - bad MCTP magic\n",
                 header.sequence()
             );
             self.poisoned.set(true);
@@ -1206,6 +1041,7 @@ fn advance_rx_event_seq(&mut self, function: Result<MsgFunction, u32>) {
     /// Error codes returned by [`MessageFromGsp::read`] are propagated as-is.
     fn receive_msg<M: MessageFromGsp>(
         &mut self,
+        bar: Bar0<'_>,
         timeout: Delta,
         expected_seq: Option<u32>,
     ) -> Result<M>
@@ -1213,7 +1049,7 @@ fn receive_msg<M: MessageFromGsp>(
         // This allows all error types, including `Infallible`, to be used for `M::InitError`.
         Error: From<M::InitError>,
     {
-        let message = self.wait_for_msg(timeout)?;
+        let message = self.wait_for_msg(bar, timeout)?;
         let function = message.header.function();
         let seq = message.header.sequence();
         let length = message.header.length();
@@ -1247,8 +1083,7 @@ fn receive_msg<M: MessageFromGsp>(
         };
 
         // Advance the read pointer past this message.
-        self.gsp_mem
-            .advance_cpu_read_ptr(u32::try_from(length.div_ceil(GSP_PAGE_SIZE))?);
+        DmaGspMem::advance_cpu_read_ptr_v2(bar, u32::try_from(length.div_ceil(GSP_PAGE_SIZE))?);
 
         self.advance_rx_event_seq(function);
 
@@ -1310,10 +1145,10 @@ fn dispatch_event(&self, function: Result<MsgFunction, u32>, seq: u32) {
     ///
     /// Returns the receive error that stopped the drain, in particular the `EIO` of a queue
     /// poisoned by corrupt framing (see [`Self::wait_for_msg`]).
-    fn drain(&mut self) -> Result {
-        while !self.gsp_mem.driver_read_area().0.is_empty() {
+    fn drain(&mut self, bar: Bar0<'_>) -> Result {
+        while !self.gsp_mem.driver_read_area_v2(bar).0.is_empty() {
             // A message is available, so this returns without waiting.
-            let msg = self.wait_for_msg(Delta::ZERO)?;
+            let msg = self.wait_for_msg(bar, Delta::ZERO)?;
             let function = msg.header.function();
             let seq = msg.header.sequence();
             let length = msg.header.length();
@@ -1325,7 +1160,7 @@ fn drain(&mut self) -> Result {
                 EIO
             })?;
 
-            self.gsp_mem.advance_cpu_read_ptr(pages);
+            DmaGspMem::advance_cpu_read_ptr_v2(bar, pages);
             self.advance_rx_event_seq(function);
             self.dispatch_event(function, seq);
         }
@@ -1349,13 +1184,13 @@ fn drain(&mut self) -> Result {
     /// - `ETIMEDOUT` if `timeout` has elapsed before any message becomes available.
     /// - `EIO` if the framing is invalid, or the queue was already poisoned by an earlier such
     ///   failure. Either failure poisons the queue, so recovery requires a reset.
-    fn wait_for_gmc_msg(&self, timeout: Delta) -> Result<GmcMessage<'_>> {
+    fn wait_for_gmc_msg(&self, bar: Bar0<'_>, timeout: Delta) -> Result<GmcMessage<'_>> {
         if self.poisoned.get() {
             return Err(EIO);
         }
 
         let (slice_1, slice_2) = read_poll_timeout(
-            || Ok(self.gsp_mem.driver_read_area()),
+            || Ok(self.gsp_mem.driver_read_area_v2(bar)),
             |driver_area| !driver_area.0.is_empty(),
             Delta::from_millis(1),
             timeout,
@@ -1405,7 +1240,8 @@ fn wait_for_gmc_msg(&self, timeout: Delta) -> Result<GmcMessage<'_>> {
     ///
     /// The handler receives the GMC command id, the header's `max_resp_or_status` field, and the
     /// raw payload slices that follow the [`super::fw::GmcApiHeader`] (two slices because the
-    /// circular buffer may wrap). It returns `None` for an element it does not handle.
+    /// circular buffer may wrap). It returns `None` for an element it does not handle, paired
+    /// with the [`QueuePointers`] state it left behind.
     ///
     /// `max_resp_or_status` is a union: GSP-RM writes an `NV_STATUS` there when the element is a
     /// response, and the maximum response size when it is a request. Only a handler that knows
@@ -1415,7 +1251,9 @@ fn wait_for_gmc_msg(&self, timeout: Delta) -> Result<GmcMessage<'_>> {
     /// which is the form the r000 firmware uses for boot events.
     ///
     /// Returns `Ok(None)` when nothing claimed the element, either because it is not a GMC
-    /// element or because the handler declined it. The read pointer is advanced on every path.
+    /// element or because the handler declined it. The read pointer is advanced past the element
+    /// on every path except a handler reporting [`QueuePointers::Reset`], which has already
+    /// returned both pointers to zero.
     ///
     /// # Errors
     ///
@@ -1424,16 +1262,22 @@ fn wait_for_gmc_msg(&self, timeout: Delta) -> Result<GmcMessage<'_>> {
     ///   [`Self::wait_for_gmc_msg`]).
     fn receive_gmc_and_dispatch<R>(
         &mut self,
+        bar: Bar0<'_>,
         timeout: Delta,
-        handler: impl FnOnce(u32, u32, &[u8], &[u8]) -> Option<R>,
+        handler: impl FnOnce(u32, u32, &[u8], &[u8]) -> (Option<R>, QueuePointers),
     ) -> Result<Option<R>> {
-        let message = self.wait_for_gmc_msg(timeout)?;
+        let message = self.wait_for_gmc_msg(bar, timeout)?;
         let header = message.header;
         let length = header.length();
 
+        // A handler that resets the GSP zeroes both of these, and the values they hold now are
+        // the ones the driver has to put back.
+        let cpu_write_ptr = DmaGspMem::cpu_write_ptr_v2(bar);
+        let cpu_read_ptr = DmaGspMem::cpu_read_ptr_v2(bar);
+
         // The RPC and GMC elements share every field through `nvdm_header`, so `gmc` holds an
         // RPC header rather than a GMC one unless the NVDM type says otherwise.
-        let result = if header.is_gmc_api() {
+        let (result, queue_pointers) = if header.is_gmc_api() {
             let command_id = header.gmc.command_id();
 
             dev_dbg!(
@@ -1452,11 +1296,20 @@ fn receive_gmc_and_dispatch<R>(
             )
         } else {
             dev_warn!(&self.dev, "GSP GMC: dropping non-GMC queue element\n");
-            None
+            (None, QueuePointers::Unchanged)
         };
 
-        self.gsp_mem
-            .advance_cpu_read_ptr(u32::try_from(length.div_ceil(GSP_PAGE_SIZE))?);
+        let pages = u32::try_from(length.div_ceil(GSP_PAGE_SIZE))?;
+
+        match queue_pointers {
+            QueuePointers::Unchanged => DmaGspMem::advance_cpu_read_ptr_v2(bar, pages),
+            // The registers read zero now, so a read-modify-write would restart the driver's
+            // side of the ring at zero while GSP-RM carries on from where it stopped. Put the
+            // captured values back instead, with this element counted as consumed.
+            QueuePointers::Reset => {
+                DmaGspMem::restore_cpu_ptrs_v2(bar, cpu_write_ptr, cpu_read_ptr.wrapping_add(pages))
+            }
+        }
 
         Ok(result)
     }
diff --git a/drivers/gpu/nova-core/gsp/commands.rs b/drivers/gpu/nova-core/gsp/commands.rs
index d55faf1a4e04..26ea07dc4a28 100644
--- a/drivers/gpu/nova-core/gsp/commands.rs
+++ b/drivers/gpu/nova-core/gsp/commands.rs
@@ -13,10 +13,7 @@
     device,
     pci,
     prelude::*,
-    transmute::{
-        AsBytes,
-        FromBytes, //
-    }, //
+    transmute::AsBytes, //
 };
 
 use crate::{
@@ -27,7 +24,8 @@
             Cmdq,
             CommandToGsp,
             MessageFromGsp,
-            NoReply, //
+            NoReply,
+            QueuePointers, //
         },
         fw::{
             self,
@@ -52,11 +50,14 @@
 };
 
 /// The `GspSetSystemInfo` command.
+///
+/// The r000 boot path folds this into the `GSP_INIT` payload instead.
 pub(crate) struct SetSystemInfo<'a> {
     pdev: &'a pci::Device<device::Bound>,
     chipset: Chipset,
 }
 
+#[expect(dead_code)]
 impl<'a> SetSystemInfo<'a> {
     /// Creates a new `GspSetSystemInfo` command using the parameters of `pdev`.
     pub(crate) fn new(pdev: &'a pci::Device<device::Bound>, chipset: Chipset) -> Self {
@@ -82,10 +83,13 @@ struct RegistryEntry {
 }
 
 /// The `SetRegistry` command.
+///
+/// The r000 boot path folds this into the `GSP_INIT` payload instead.
 pub(crate) struct SetRegistry {
     entries: KVec<RegistryEntry>,
 }
 
+#[expect(dead_code)]
 impl SetRegistry {
     /// Creates a new `SetRegistry` command, using a set of hardcoded entries.
     pub(crate) fn new(vgpu_state: VgpuState) -> Result<Self> {
@@ -182,31 +186,6 @@ fn init_variable_payload(
     }
 }
 
-/// Message type for GSP initialization done notification.
-struct GspInitDone;
-
-// SAFETY: `GspInitDone` is a zero-sized type with no bytes, therefore it
-// trivially has no uninitialized bytes.
-unsafe impl FromBytes for GspInitDone {}
-
-impl MessageFromGsp for GspInitDone {
-    const FUNCTION: MsgFunction = MsgFunction::GspInitDone;
-    type InitError = Infallible;
-    type Message = ();
-
-    fn read(
-        _msg: &Self::Message,
-        _sbuffer: &mut SBufferIter<array::IntoIter<&[u8], 2>>,
-    ) -> Result<Self, Self::InitError> {
-        Ok(GspInitDone)
-    }
-}
-
-/// Waits for GSP initialization to complete.
-pub(crate) fn wait_gsp_init_done(cmdq: &Cmdq) -> Result {
-    cmdq.await_msg::<GspInitDone>().map(|_| ())
-}
-
 /// The `GetGspStaticInfo` command.
 pub(crate) struct GetGspStaticInfo;
 
@@ -297,7 +276,6 @@ pub(crate) fn gpu_name(&self) -> core::result::Result<&str, GpuNameError> {
 /// # Errors
 ///
 /// - `ENOMEM` if the registry list or the encoder buffer cannot be allocated.
-#[expect(dead_code)]
 pub(crate) fn build_gsp_init_payload(
     pdev: &pci::Device<device::Bound>,
     chipset: Chipset,
@@ -325,8 +303,9 @@ pub(crate) fn build_gsp_init_payload(
 ///
 /// GSP-RM interleaves load-and-execute events between the request and the reply, and those events
 /// drive the falcon loads that let it finish starting, so each one is passed to `on_boot_event`
-/// rather than skipped. The reply arrives only once GSP-RM is up, which is what makes it the
-/// signal that boot is complete.
+/// rather than skipped. `on_boot_event` returns the [`QueuePointers`] state its handler left
+/// behind, because a handler that resets the GSP also zeroes the queue's pointer registers. The
+/// reply arrives only once GSP-RM is up, which is what makes it the signal that boot is complete.
 ///
 /// `payload` is the blob from [`build_gsp_init_payload`].
 ///
@@ -338,12 +317,11 @@ pub(crate) fn build_gsp_init_payload(
 ///   [`Cmdq::RECEIVE_TIMEOUT`].
 ///
 /// Errors from `on_boot_event` and from decoding the reply are propagated as-is.
-#[expect(dead_code)]
 pub(crate) fn gsp_init(
     cmdq: &Cmdq,
     bar: Bar0<'_>,
     payload: &[u64],
-    mut on_boot_event: impl FnMut(u32, &[u8]) -> Result,
+    mut on_boot_event: impl FnMut(u32, &[u8]) -> Result<QueuePointers>,
 ) -> Result<GetGspStaticInfoReply> {
     // Qualified because `zerocopy::IntoBytes` also gives `[T]` an `as_bytes`.
     let payload = AsBytes::as_bytes(payload);
@@ -357,19 +335,25 @@ pub(crate) fn gsp_init(
 
     loop {
         let reply = cmdq.receive_gmc_and_dispatch(
+            bar,
             Cmdq::RECEIVE_TIMEOUT,
             |command_id, max_resp_or_status, payload_0, payload_1| {
                 if command_id == GMCAPI_CMD_GSP_INIT {
-                    Some(decode_gsp_init_reply(
-                        max_resp_or_status,
-                        payload_0,
-                        payload_1,
-                    ))
+                    (
+                        Some(decode_gsp_init_reply(
+                            max_resp_or_status,
+                            payload_0,
+                            payload_1,
+                        )),
+                        QueuePointers::Unchanged,
+                    )
                 } else {
                     // A boot event. Keep waiting for the reply unless handling it failed.
                     match on_boot_event(command_id, payload_0) {
-                        Ok(()) => None,
-                        Err(e) => Some(Err(e)),
+                        Ok(queue_pointers) => (None, queue_pointers),
+                        // A handler can fail after it has already reset the GSP, so the pointer
+                        // registers cannot be assumed intact on this path.
+                        Err(e) => (Some(Err(e)), QueuePointers::Reset),
                     }
                 }
             },
diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/fw.rs
index 6958ee3a2e4e..c24808e41941 100644
--- a/drivers/gpu/nova-core/gsp/fw.rs
+++ b/drivers/gpu/nova-core/gsp/fw.rs
@@ -6,20 +6,14 @@
 mod r570_144;
 
 // Alias to avoid repeating the version number with every use.
-use r570_144 as bindings;
+use r000_00 as bindings;
 
 use core::ops::Range;
 
 use kernel::{
     bitfield,
-    dma::{
-        Coherent,
-        CoherentView, //
-    },
-    io::{
-        io_read,
-        io_write, //
-    },
+    dma::Coherent,
+    io::io_write,
     prelude::*,
     ptr::{
         Alignable,
@@ -46,10 +40,7 @@
         Architecture,
         Chipset, //
     },
-    gsp::{
-        cmdq::Cmdq, //
-        GSP_PAGE_SIZE,
-    },
+    gsp::{cmdq::Cmdq, GSP_PAGE_SHIFT, GSP_PAGE_SIZE},
     mctp::{
         MctpHeader,
         NvdmHeader,
@@ -62,8 +53,10 @@
 };
 
 /// Maximum size of a single GSP message queue element in bytes.
-pub(crate) const GSP_MSG_QUEUE_ELEMENT_SIZE_MAX: usize =
-    num::u32_as_usize(bindings::GSP_MSG_QUEUE_ELEMENT_SIZE_MAX);
+///
+/// GSP-RM takes this as a runtime field of the message queue init arguments rather than as a
+/// build-time constant, so the driver chooses it and both sides read it from here.
+pub(crate) const GSP_MSG_QUEUE_ELEMENT_SIZE_MAX: usize = GSP_PAGE_SIZE * 16;
 
 /// Empty type to group methods related to heap parameters for running the GSP firmware.
 enum GspFwHeapParams {}
@@ -97,7 +90,7 @@ fn client_alloc_size() -> u64 {
     fn management_overhead(fb_size: u64) -> Result<u64> {
         let fb_size_gb = fb_size.div_ceil(u64::SZ_1G);
 
-        u64::from(bindings::GSP_FW_HEAP_PARAM_SIZE_PER_GB_FB)
+        u64::from(bindings::GSP_FW_HEAP_PARAM_SIZE_PER_GB)
             .checked_mul(fb_size_gb)
             .ok_or(EINVAL)?
             .align_up(GSP_HEAP_ALIGNMENT)
@@ -304,7 +297,6 @@ pub(crate) enum MsgFunction {
     GspInitDone = bindings::NV_VGPU_MSG_EVENT_GSP_INIT_DONE,
     GspLockdownNotice = bindings::NV_VGPU_MSG_EVENT_GSP_LOCKDOWN_NOTICE,
     GspPostNoCat = bindings::NV_VGPU_MSG_EVENT_GSP_POST_NOCAT_RECORD,
-    GspRunCpuSequencer = bindings::NV_VGPU_MSG_EVENT_GSP_RUN_CPU_SEQUENCER,
     MmuFaultQueued = bindings::NV_VGPU_MSG_EVENT_MMU_FAULT_QUEUED,
     OsErrorLog = bindings::NV_VGPU_MSG_EVENT_OS_ERROR_LOG,
     PostEvent = bindings::NV_VGPU_MSG_EVENT_POST_EVENT,
@@ -351,9 +343,6 @@ fn try_from(value: u32) -> Result<MsgFunction> {
             bindings::NV_VGPU_MSG_EVENT_GSP_INIT_DONE => Ok(MsgFunction::GspInitDone),
             bindings::NV_VGPU_MSG_EVENT_GSP_LOCKDOWN_NOTICE => Ok(MsgFunction::GspLockdownNotice),
             bindings::NV_VGPU_MSG_EVENT_GSP_POST_NOCAT_RECORD => Ok(MsgFunction::GspPostNoCat),
-            bindings::NV_VGPU_MSG_EVENT_GSP_RUN_CPU_SEQUENCER => {
-                Ok(MsgFunction::GspRunCpuSequencer)
-            }
             bindings::NV_VGPU_MSG_EVENT_MMU_FAULT_QUEUED => Ok(MsgFunction::MmuFaultQueued),
             bindings::NV_VGPU_MSG_EVENT_OS_ERROR_LOG => Ok(MsgFunction::OsErrorLog),
             bindings::NV_VGPU_MSG_EVENT_POST_EVENT => Ok(MsgFunction::PostEvent),
@@ -371,7 +360,6 @@ pub(crate) fn is_event(&self) -> bool {
         matches!(
             self,
             Self::GspInitDone
-                | Self::GspRunCpuSequencer
                 | Self::PostEvent
                 | Self::RcTriggered
                 | Self::MmuFaultQueued
@@ -390,277 +378,6 @@ fn from(value: MsgFunction) -> Self {
     }
 }
 
-/// Sequencer buffer opcode for GSP sequencer commands.
-#[derive(Copy, Clone, Debug, PartialEq)]
-#[repr(u32)]
-pub(crate) enum SeqBufOpcode {
-    // Core operation opcodes
-    CoreReset = bindings::GSP_SEQ_BUF_OPCODE_GSP_SEQ_BUF_OPCODE_CORE_RESET,
-    CoreResume = bindings::GSP_SEQ_BUF_OPCODE_GSP_SEQ_BUF_OPCODE_CORE_RESUME,
-    CoreStart = bindings::GSP_SEQ_BUF_OPCODE_GSP_SEQ_BUF_OPCODE_CORE_START,
-    CoreWaitForHalt = bindings::GSP_SEQ_BUF_OPCODE_GSP_SEQ_BUF_OPCODE_CORE_WAIT_FOR_HALT,
-
-    // Delay opcode
-    DelayUs = bindings::GSP_SEQ_BUF_OPCODE_GSP_SEQ_BUF_OPCODE_DELAY_US,
-
-    // Register operation opcodes
-    RegModify = bindings::GSP_SEQ_BUF_OPCODE_GSP_SEQ_BUF_OPCODE_REG_MODIFY,
-    RegPoll = bindings::GSP_SEQ_BUF_OPCODE_GSP_SEQ_BUF_OPCODE_REG_POLL,
-    RegStore = bindings::GSP_SEQ_BUF_OPCODE_GSP_SEQ_BUF_OPCODE_REG_STORE,
-    RegWrite = bindings::GSP_SEQ_BUF_OPCODE_GSP_SEQ_BUF_OPCODE_REG_WRITE,
-}
-
-impl TryFrom<u32> for SeqBufOpcode {
-    type Error = kernel::error::Error;
-
-    fn try_from(value: u32) -> Result<SeqBufOpcode> {
-        match value {
-            bindings::GSP_SEQ_BUF_OPCODE_GSP_SEQ_BUF_OPCODE_CORE_RESET => {
-                Ok(SeqBufOpcode::CoreReset)
-            }
-            bindings::GSP_SEQ_BUF_OPCODE_GSP_SEQ_BUF_OPCODE_CORE_RESUME => {
-                Ok(SeqBufOpcode::CoreResume)
-            }
-            bindings::GSP_SEQ_BUF_OPCODE_GSP_SEQ_BUF_OPCODE_CORE_START => {
-                Ok(SeqBufOpcode::CoreStart)
-            }
-            bindings::GSP_SEQ_BUF_OPCODE_GSP_SEQ_BUF_OPCODE_CORE_WAIT_FOR_HALT => {
-                Ok(SeqBufOpcode::CoreWaitForHalt)
-            }
-            bindings::GSP_SEQ_BUF_OPCODE_GSP_SEQ_BUF_OPCODE_DELAY_US => Ok(SeqBufOpcode::DelayUs),
-            bindings::GSP_SEQ_BUF_OPCODE_GSP_SEQ_BUF_OPCODE_REG_MODIFY => {
-                Ok(SeqBufOpcode::RegModify)
-            }
-            bindings::GSP_SEQ_BUF_OPCODE_GSP_SEQ_BUF_OPCODE_REG_POLL => Ok(SeqBufOpcode::RegPoll),
-            bindings::GSP_SEQ_BUF_OPCODE_GSP_SEQ_BUF_OPCODE_REG_STORE => Ok(SeqBufOpcode::RegStore),
-            bindings::GSP_SEQ_BUF_OPCODE_GSP_SEQ_BUF_OPCODE_REG_WRITE => Ok(SeqBufOpcode::RegWrite),
-            _ => Err(EINVAL),
-        }
-    }
-}
-
-impl From<SeqBufOpcode> for u32 {
-    fn from(value: SeqBufOpcode) -> Self {
-        // CAST: `SeqBufOpcode` is `repr(u32)` and can thus be cast losslessly.
-        value as u32
-    }
-}
-
-/// Wrapper for GSP sequencer register write payload.
-#[repr(transparent)]
-#[derive(Copy, Clone, Debug)]
-pub(crate) struct RegWritePayload(bindings::GSP_SEQ_BUF_PAYLOAD_REG_WRITE);
-
-impl RegWritePayload {
-    /// Returns the register address.
-    pub(crate) fn addr(&self) -> u32 {
-        self.0.addr
-    }
-
-    /// Returns the value to write.
-    pub(crate) fn val(&self) -> u32 {
-        self.0.val
-    }
-}
-
-// SAFETY: This struct only contains integer types for which all bit patterns are valid.
-unsafe impl FromBytes for RegWritePayload {}
-
-// SAFETY: Padding is explicit and will not contain uninitialized data.
-unsafe impl AsBytes for RegWritePayload {}
-
-/// Wrapper for GSP sequencer register modify payload.
-#[repr(transparent)]
-#[derive(Copy, Clone, Debug)]
-pub(crate) struct RegModifyPayload(bindings::GSP_SEQ_BUF_PAYLOAD_REG_MODIFY);
-
-impl RegModifyPayload {
-    /// Returns the register address.
-    pub(crate) fn addr(&self) -> u32 {
-        self.0.addr
-    }
-
-    /// Returns the mask to apply.
-    pub(crate) fn mask(&self) -> u32 {
-        self.0.mask
-    }
-
-    /// Returns the value to write.
-    pub(crate) fn val(&self) -> u32 {
-        self.0.val
-    }
-}
-
-// SAFETY: This struct only contains integer types for which all bit patterns are valid.
-unsafe impl FromBytes for RegModifyPayload {}
-
-// SAFETY: Padding is explicit and will not contain uninitialized data.
-unsafe impl AsBytes for RegModifyPayload {}
-
-/// Wrapper for GSP sequencer register poll payload.
-#[repr(transparent)]
-#[derive(Copy, Clone, Debug)]
-pub(crate) struct RegPollPayload(bindings::GSP_SEQ_BUF_PAYLOAD_REG_POLL);
-
-impl RegPollPayload {
-    /// Returns the register address.
-    pub(crate) fn addr(&self) -> u32 {
-        self.0.addr
-    }
-
-    /// Returns the mask to apply.
-    pub(crate) fn mask(&self) -> u32 {
-        self.0.mask
-    }
-
-    /// Returns the expected value.
-    pub(crate) fn val(&self) -> u32 {
-        self.0.val
-    }
-
-    /// Returns the timeout in microseconds.
-    pub(crate) fn timeout(&self) -> u32 {
-        self.0.timeout
-    }
-}
-
-// SAFETY: This struct only contains integer types for which all bit patterns are valid.
-unsafe impl FromBytes for RegPollPayload {}
-
-// SAFETY: Padding is explicit and will not contain uninitialized data.
-unsafe impl AsBytes for RegPollPayload {}
-
-/// Wrapper for GSP sequencer delay payload.
-#[repr(transparent)]
-#[derive(Copy, Clone, Debug)]
-pub(crate) struct DelayUsPayload(bindings::GSP_SEQ_BUF_PAYLOAD_DELAY_US);
-
-impl DelayUsPayload {
-    /// Returns the delay value in microseconds.
-    pub(crate) fn val(&self) -> u32 {
-        self.0.val
-    }
-}
-
-// SAFETY: This struct only contains integer types for which all bit patterns are valid.
-unsafe impl FromBytes for DelayUsPayload {}
-
-// SAFETY: Padding is explicit and will not contain uninitialized data.
-unsafe impl AsBytes for DelayUsPayload {}
-
-/// Wrapper for GSP sequencer register store payload.
-#[repr(transparent)]
-#[derive(Copy, Clone, Debug)]
-pub(crate) struct RegStorePayload(bindings::GSP_SEQ_BUF_PAYLOAD_REG_STORE);
-
-impl RegStorePayload {
-    /// Returns the register address.
-    pub(crate) fn addr(&self) -> u32 {
-        self.0.addr
-    }
-
-    /// Returns the storage index.
-    #[allow(unused)]
-    pub(crate) fn index(&self) -> u32 {
-        self.0.index
-    }
-}
-
-// SAFETY: This struct only contains integer types for which all bit patterns are valid.
-unsafe impl FromBytes for RegStorePayload {}
-
-// SAFETY: Padding is explicit and will not contain uninitialized data.
-unsafe impl AsBytes for RegStorePayload {}
-
-/// Wrapper for GSP sequencer buffer command.
-#[repr(transparent)]
-pub(crate) struct SequencerBufferCmd(bindings::GSP_SEQUENCER_BUFFER_CMD);
-
-impl SequencerBufferCmd {
-    /// Returns the opcode as a `SeqBufOpcode` enum, or error if invalid.
-    pub(crate) fn opcode(&self) -> Result<SeqBufOpcode> {
-        self.0.opCode.try_into()
-    }
-
-    /// Returns the register write payload by value.
-    ///
-    /// Returns an error if the opcode is not `SeqBufOpcode::RegWrite`.
-    pub(crate) fn reg_write_payload(&self) -> Result<RegWritePayload> {
-        if self.opcode()? != SeqBufOpcode::RegWrite {
-            return Err(EINVAL);
-        }
-        // SAFETY: Opcode is verified to be `RegWrite`, so union contains valid `RegWritePayload`.
-        Ok(RegWritePayload(unsafe { self.0.payload.regWrite }))
-    }
-
-    /// Returns the register modify payload by value.
-    ///
-    /// Returns an error if the opcode is not `SeqBufOpcode::RegModify`.
-    pub(crate) fn reg_modify_payload(&self) -> Result<RegModifyPayload> {
-        if self.opcode()? != SeqBufOpcode::RegModify {
-            return Err(EINVAL);
-        }
-        // SAFETY: Opcode is verified to be `RegModify`, so union contains valid `RegModifyPayload`.
-        Ok(RegModifyPayload(unsafe { self.0.payload.regModify }))
-    }
-
-    /// Returns the register poll payload by value.
-    ///
-    /// Returns an error if the opcode is not `SeqBufOpcode::RegPoll`.
-    pub(crate) fn reg_poll_payload(&self) -> Result<RegPollPayload> {
-        if self.opcode()? != SeqBufOpcode::RegPoll {
-            return Err(EINVAL);
-        }
-        // SAFETY: Opcode is verified to be `RegPoll`, so union contains valid `RegPollPayload`.
-        Ok(RegPollPayload(unsafe { self.0.payload.regPoll }))
-    }
-
-    /// Returns the delay payload by value.
-    ///
-    /// Returns an error if the opcode is not `SeqBufOpcode::DelayUs`.
-    pub(crate) fn delay_us_payload(&self) -> Result<DelayUsPayload> {
-        if self.opcode()? != SeqBufOpcode::DelayUs {
-            return Err(EINVAL);
-        }
-        // SAFETY: Opcode is verified to be `DelayUs`, so union contains valid `DelayUsPayload`.
-        Ok(DelayUsPayload(unsafe { self.0.payload.delayUs }))
-    }
-
-    /// Returns the register store payload by value.
-    ///
-    /// Returns an error if the opcode is not `SeqBufOpcode::RegStore`.
-    pub(crate) fn reg_store_payload(&self) -> Result<RegStorePayload> {
-        if self.opcode()? != SeqBufOpcode::RegStore {
-            return Err(EINVAL);
-        }
-        // SAFETY: Opcode is verified to be `RegStore`, so union contains valid `RegStorePayload`.
-        Ok(RegStorePayload(unsafe { self.0.payload.regStore }))
-    }
-}
-
-// SAFETY: This struct only contains integer types for which all bit patterns are valid.
-unsafe impl FromBytes for SequencerBufferCmd {}
-
-// SAFETY: Padding is explicit and will not contain uninitialized data.
-unsafe impl AsBytes for SequencerBufferCmd {}
-
-/// Wrapper for GSP run CPU sequencer RPC.
-#[repr(transparent)]
-pub(crate) struct RunCpuSequencer(bindings::rpc_run_cpu_sequencer_v17_00);
-
-impl RunCpuSequencer {
-    /// Returns the command index.
-    pub(crate) fn cmd_index(&self) -> u32 {
-        self.0.cmdIndex
-    }
-}
-
-// SAFETY: This struct only contains integer types for which all bit patterns are valid.
-unsafe impl FromBytes for RunCpuSequencer {}
-
-// SAFETY: Padding is explicit and will not contain uninitialized data.
-unsafe impl AsBytes for RunCpuSequencer {}
-
 /// Struct containing the arguments required to pass a memory buffer to the GSP
 /// for use during initialisation.
 ///
@@ -722,57 +439,15 @@ fn id8(name: &str) -> u64 {
     }
 }
 
-/// TX header for setting up a message queue with the GSP.
-#[repr(transparent)]
-pub(crate) struct MsgqTxHeader(bindings::msgqTxHeader);
-
-impl MsgqTxHeader {
-    /// Create a new TX queue header.
-    ///
-    /// # Arguments
-    ///
-    /// * `msgq_size` - Total size of the message queue structure, in bytes.
-    /// * `rx_hdr_offset` - Offset, in bytes, of the start of the RX header in the message queue
-    ///   structure.
-    /// * `msg_count` - Number of messages that can be sent, i.e. the number of memory pages
-    ///   allocated for the message queue in the message queue structure.
-    pub(crate) fn new(msgq_size: u32, rx_hdr_offset: u32, msg_count: u32) -> Self {
-        Self(bindings::msgqTxHeader {
-            version: 0,
-            size: msgq_size,
-            msgSize: num::usize_into_u32::<GSP_PAGE_SIZE>(),
-            msgCount: msg_count,
-            writePtr: 0,
-            flags: 1,
-            rxHdrOff: rx_hdr_offset,
-            entryOff: num::usize_into_u32::<GSP_PAGE_SIZE>(),
-        })
-    }
-
-    /// Returns the value of the write pointer for this queue.
-    pub(crate) fn write_ptr(this: CoherentView<'_, Self>) -> u32 {
-        io_read!(this, .0.writePtr)
-    }
-
-    /// Sets the value of the write pointer for this queue.
-    pub(crate) fn set_write_ptr(this: CoherentView<'_, Self>, val: u32) {
-        io_write!(this, .0.writePtr, val)
-    }
-}
-
-// SAFETY: Padding is explicit and does not contain uninitialized data.
-unsafe impl AsBytes for MsgqTxHeader {}
-
 /// TX header for setting up a message queue with the GSP, msgq v2 layout.
 ///
-/// Same wire size as [`MsgqTxHeader`] (32 bytes) with a different field
+/// Same wire size as the msgq v0 header (32 bytes) with a different field
 /// layout: the v0 `writePtr`, `flags`, and `rxHdrOff` fields are gone, the
 /// `version` `u32` becomes split `versionMajor`/`versionMinor` `u16`s, and
 /// the trailing space holds three reserved `u32`s.
 #[repr(transparent)]
-pub(crate) struct MsgqTxHeaderV2(r000_00::msgqTxHeader);
+pub(crate) struct MsgqTxHeaderV2(bindings::msgqTxHeader);
 
-#[expect(dead_code)]
 impl MsgqTxHeaderV2 {
     /// Creates a new v2 TX queue header.
     ///
@@ -784,7 +459,7 @@ impl MsgqTxHeaderV2 {
     /// * `entry_off` - Byte offset from the start of the queue at which the
     ///   message data array begins.
     pub(crate) fn new(msgq_size: u32, msg_size: u32, msg_count: u32, entry_off: u32) -> Self {
-        Self(r000_00::msgqTxHeader {
+        Self(bindings::msgqTxHeader {
             versionMajor: 2,
             versionMinor: 0,
             size: msgq_size,
@@ -799,31 +474,6 @@ pub(crate) fn new(msgq_size: u32, msg_size: u32, msg_count: u32, entry_off: u32)
 // SAFETY: Padding is explicit and does not contain uninitialized data.
 unsafe impl AsBytes for MsgqTxHeaderV2 {}
 
-/// RX header for setting up a message queue with the GSP.
-#[repr(transparent)]
-pub(crate) struct MsgqRxHeader(bindings::msgqRxHeader);
-
-/// Header for the message RX queue.
-impl MsgqRxHeader {
-    /// Creates a new RX queue header.
-    pub(crate) fn new() -> Self {
-        Self(Default::default())
-    }
-
-    /// Returns the value of the read pointer for this queue.
-    pub(crate) fn read_ptr(this: CoherentView<'_, Self>) -> u32 {
-        io_read!(this, .0.readPtr)
-    }
-
-    /// Sets the value of the read pointer for this queue.
-    pub(crate) fn set_read_ptr(this: CoherentView<'_, Self>, val: u32) {
-        io_write!(this, .0.readPtr, val)
-    }
-}
-
-// SAFETY: Padding is explicit and does not contain uninitialized data.
-unsafe impl AsBytes for MsgqRxHeader {}
-
 bitfield! {
     struct MsgHeaderVersion(u32) {
         31:24 major;
@@ -862,12 +512,19 @@ fn init(sequence: u32, cmd_size: usize, function: MsgFunction) -> impl Init<Self
     }
 }
 
-/// GSP Message Element.
+/// GSP Message Element (r000 MCTP/NVDM format).
 ///
-/// This is essentially a message header expected to be followed by the message data.
-#[repr(transparent)]
+/// This is the transport-layer header for messages exchanged with GSP-RM.
+/// r000 firmware uses MCTP/NVDM framing instead of the r570 `GSP_MSG_QUEUE_ELEMENT`.
+#[repr(C)]
 pub(crate) struct GspMsgElement {
-    inner: bindings::GSP_MSG_QUEUE_ELEMENT,
+    mctp_magic: u32,
+    mctp_payload_size: u32,
+    mctp_header: MctpHeader,
+    nvdm_header: NvdmHeader,
+    nvdm_payload_size: u32,
+    reserved: u32,
+    rpc: bindings::rpc_message_header_v,
 }
 
 impl GspMsgElement {
@@ -875,81 +532,76 @@ impl GspMsgElement {
     ///
     /// # Arguments
     ///
-    /// * `elem_seq` - Transport sequence number of the queue element (`seqNum`).
-    /// * `rpc_seq` - RPC sequence number, echoed by the GSP in the reply.
+    /// * `rpc_seq` - RPC sequence number, echoed by the GSP in the reply. Zero for an async
+    ///   command, which expects none.
     /// * `cmd_size` - Size of the command (not including the message element), in bytes.
     /// * `function` - Function of the message.
     pub(crate) fn init(
-        elem_seq: u32,
         rpc_seq: u32,
         cmd_size: usize,
         function: MsgFunction,
     ) -> impl Init<Self, Error> {
         type RpcMessageHeader = bindings::rpc_message_header_v;
-        type InnerGspMsgElement = bindings::GSP_MSG_QUEUE_ELEMENT;
-        let init_inner = try_init!(InnerGspMsgElement {
-            seqNum: elem_seq,
-            elemCount: size_of::<Self>()
+
+        try_init!(GspMsgElement {
+            mctp_magic: MCTP_MAGIC,
+            // Despite the name, this counts the element header as well as the payload.
+            mctp_payload_size: size_of::<Self>()
+                .checked_add(cmd_size)
+                .ok_or(EOVERFLOW)?
+                .try_into()
+                .map_err(|_| EOVERFLOW)?,
+            mctp_header: MctpHeader::single_packet(),
+            nvdm_header: NvdmHeader::new(NvdmType::RmRpc),
+            nvdm_payload_size: size_of::<RpcMessageHeader>()
                 .checked_add(cmd_size)
                 .ok_or(EOVERFLOW)?
-                .div_ceil(GSP_PAGE_SIZE)
                 .try_into()
                 .map_err(|_| EOVERFLOW)?,
+            reserved: 0,
             rpc <- RpcMessageHeader::init(rpc_seq, cmd_size, function),
-            ..Zeroable::init_zeroed()
-        });
-
-        try_init!(GspMsgElement {
-            inner <- init_inner,
         })
     }
 
-    /// Sets the checksum of this message.
-    ///
-    /// Since the header is also part of the checksum, this is usually called after the whole
-    /// message has been written to the shared memory area.
-    pub(crate) fn set_checksum(&mut self, checksum: u32) {
-        self.inner.checkSum = checksum;
-    }
-
-    /// Returns the length of the message's payload.
+    /// Returns the length of the message's payload (command data after the RPC header).
     pub(crate) fn payload_length(&self) -> usize {
-        // `rpc.length` includes the length of the RPC message header.
-        num::u32_as_usize(self.inner.rpc.length)
+        num::u32_as_usize(self.nvdm_payload_size)
             .saturating_sub(size_of::<bindings::rpc_message_header_v>())
     }
 
-    /// Returns the total length of the message, message and RPC headers included.
+    /// Returns the total length of the message, transport and RPC headers included.
     pub(crate) fn length(&self) -> usize {
-        size_of::<Self>() + self.payload_length()
+        num::u32_as_usize(self.mctp_payload_size)
+    }
+
+    /// Returns `true` if the MCTP magic field contains the expected value.
+    pub(crate) fn has_valid_magic(&self) -> bool {
+        self.mctp_magic == MCTP_MAGIC
     }
 
     // Returns the sequence number of the message.
     pub(crate) fn sequence(&self) -> u32 {
-        self.inner.rpc.sequence
+        self.rpc.sequence
     }
 
     // Returns the function of the message, if it is valid, or the invalid function number as an
     // error.
     pub(crate) fn function(&self) -> Result<MsgFunction, u32> {
-        self.inner
-            .rpc
-            .function
-            .try_into()
-            .map_err(|_| self.inner.rpc.function)
+        self.rpc.function.try_into().map_err(|_| self.rpc.function)
     }
 
     // Returns the number of elements (i.e. memory pages) used by this message.
     pub(crate) fn element_count(&self) -> u32 {
-        self.inner.elemCount
+        self.mctp_payload_size
+            .div_ceil(num::usize_into_u32::<GSP_PAGE_SIZE>())
     }
 }
 
-// SAFETY: Padding is explicit and does not contain uninitialized data.
+// SAFETY: All fields are integer types or contain only integer types, with no
+// uninitialized padding bytes.
 unsafe impl AsBytes for GspMsgElement {}
 
-// SAFETY: This struct only contains integer types for which all bit patterns
-// are valid.
+// SAFETY: All fields are integer types for which all bit patterns are valid.
 unsafe impl FromBytes for GspMsgElement {}
 
 /// Magic value that opens every MCTP-framed queue element: `"MCTP"` in ASCII.
@@ -981,17 +633,17 @@ pub(crate) struct GmcApiHeader {
 
 /// GMC command that hands GSP-RM its system information and registry keys and returns the static
 /// GPU configuration. Its reply is also what signals that GSP-RM has finished starting.
-pub(crate) const GMCAPI_CMD_GSP_INIT: u32 = r000_00::GMCAPI_COMMANDS_GMCAPI_CMD_GSP_INIT;
+pub(crate) const GMCAPI_CMD_GSP_INIT: u32 = bindings::GMCAPI_COMMANDS_GMCAPI_CMD_GSP_INIT;
 
 /// GMC command asking the driver to run the generic falcon bootloader against a descriptor the
 /// GSP supplies.
 pub(crate) const GMCAPI_CMD_EXEC_GENERIC_BOOTLOADER: u32 =
-    r000_00::GMCAPI_COMMANDS_GMCAPI_CMD_EXEC_GENERIC_BOOTLOADER;
+    bindings::GMCAPI_COMMANDS_GMCAPI_CMD_EXEC_GENERIC_BOOTLOADER;
 
 /// GMC command asking the driver to run a high-security binary the GSP has placed in the
 /// framebuffer.
 pub(crate) const GMCAPI_CMD_EXEC_HS_BINARY: u32 =
-    r000_00::GMCAPI_COMMANDS_GMCAPI_CMD_EXEC_HS_BINARY;
+    bindings::GMCAPI_COMMANDS_GMCAPI_CMD_EXEC_HS_BINARY;
 
 static_assert!(size_of::<GmcApiHeader>() == 40);
 
@@ -1026,19 +678,19 @@ pub(crate) struct GspGmcMsgElement {
 
 static_assert!(
     core::mem::offset_of!(GspGmcMsgElement, mctp_magic)
-        == core::mem::offset_of!(r000_00::GSP_MSG_QUEUE_ELEMENT, mctpMagic)
+        == core::mem::offset_of!(bindings::GSP_MSG_QUEUE_ELEMENT, mctpMagic)
 );
 static_assert!(
     core::mem::offset_of!(GspGmcMsgElement, mctp_payload_size)
-        == core::mem::offset_of!(r000_00::GSP_MSG_QUEUE_ELEMENT, mctpPayloadSize)
+        == core::mem::offset_of!(bindings::GSP_MSG_QUEUE_ELEMENT, mctpPayloadSize)
 );
 static_assert!(
     core::mem::offset_of!(GspGmcMsgElement, mctp_header)
-        == core::mem::offset_of!(r000_00::GSP_MSG_QUEUE_ELEMENT, mctpHeader)
+        == core::mem::offset_of!(bindings::GSP_MSG_QUEUE_ELEMENT, mctpHeader)
 );
 static_assert!(
     core::mem::offset_of!(GspGmcMsgElement, nvdm_header)
-        == core::mem::offset_of!(r000_00::GSP_MSG_QUEUE_ELEMENT, nvdmHeader)
+        == core::mem::offset_of!(bindings::GSP_MSG_QUEUE_ELEMENT, nvdmHeader)
 );
 
 impl GspGmcMsgElement {
@@ -1117,6 +769,20 @@ unsafe impl AsBytes for GspGmcMsgElement {}
 // SAFETY: All fields are integer types for which all bit patterns are valid.
 unsafe impl FromBytes for GspGmcMsgElement {}
 
+/// Optional bindata (ucodes) firmware info for GSP startup arguments.
+pub(crate) struct BindataArgs {
+    /// DMA address of the radix3 level 0 page table for the bindata firmware.
+    pub(crate) radix3: u64,
+    /// Size in bytes of the bindata firmware.
+    pub(crate) size: u64,
+}
+
+/// Magic value for the `GSP_ARGUMENTS_CACHED` header.
+const GSP_ARGUMENTS_MAGIC_VALUE: u32 = 0x2050_5347;
+
+/// Flag indicating the GSP stack should be placed in DMEM.
+const GSP_ARGUMENTS_FLAG_STACK_IN_DMEM: u64 = 0x02;
+
 /// Arguments for GSP startup.
 #[repr(transparent)]
 #[derive(Zeroable)]
@@ -1126,16 +792,32 @@ pub(crate) struct GspArgumentsCached {
 
 impl GspArgumentsCached {
     /// Creates the arguments for starting the GSP up using `cmdq` as its command queue.
-    pub(crate) fn new(cmdq: &Cmdq) -> impl Init<Self> + '_ {
-        let init_inner = init!(bindings::GSP_ARGUMENTS_CACHED {
-            messageQueueInitArguments <- MessageQueueInitArguments::new(cmdq),
-            bDmemStack: 1,
-            ..Zeroable::init_zeroed()
-        });
+    ///
+    /// `bindata` names the ucodes firmware, if the driver found one.
+    ///
+    /// `state_monitor` is the buffer GSP-RM maps during init to report its own state.
+    pub(crate) fn new(
+        cmdq: &Cmdq,
+        bindata: Option<&BindataArgs>,
+        state_monitor: &Coherent<[u8; GSP_PAGE_SIZE]>,
+    ) -> Self {
+        let mut args = bindings::GSP_ARGUMENTS_CACHED {
+            magic: GSP_ARGUMENTS_MAGIC_VALUE,
+            size: num::usize_into_u16::<{ size_of::<bindings::GSP_ARGUMENTS_CACHED>() }>(),
+            flags: GSP_ARGUMENTS_FLAG_STACK_IN_DMEM,
+            messageQueueInitArguments: MessageQueueInitArguments::new(cmdq),
+            ..Default::default()
+        };
+
+        if let Some(bindata) = bindata {
+            args.bindataArgs.radix3 = bindata.radix3;
+            args.bindataArgs.size = bindata.size;
+        }
 
-        init!(GspArgumentsCached {
-            inner <- init_inner,
-        })
+        args.rmStateMonitorBufferArgs.pa = state_monitor.dma_address();
+        args.rmStateMonitorBufferArgs.size = num::usize_as_u64(state_monitor.size());
+
+        Self { inner: args }
     }
 }
 
@@ -1153,12 +835,26 @@ pub(crate) struct GspArgumentsPadded {
 }
 
 impl GspArgumentsPadded {
-    pub(crate) fn new(cmdq: &Cmdq) -> impl Init<Self> + '_ {
+    pub(crate) fn new<'a>(
+        cmdq: &'a Cmdq,
+        bindata: Option<&'a BindataArgs>,
+        state_monitor: &'a Coherent<[u8; GSP_PAGE_SIZE]>,
+    ) -> impl Init<Self> + 'a {
         init!(GspArgumentsPadded {
-            inner <- GspArgumentsCached::new(cmdq),
+            inner: GspArgumentsCached::new(cmdq, bindata, state_monitor),
             ..Zeroable::init_zeroed()
         })
     }
+
+    /// Updates the optional bindata mapping before GSP-RM starts reading its arguments.
+    pub(crate) fn set_bindata(this: &Coherent<Self>, bindata: Option<&BindataArgs>) {
+        let (radix3, size) = bindata
+            .map(|bindata| (bindata.radix3, bindata.size))
+            .unwrap_or((0, 0));
+
+        io_write!(this, .inner.inner.bindataArgs.radix3, radix3);
+        io_write!(this, .inner.inner.bindataArgs.size, size);
+    }
 }
 
 // SAFETY: Padding is explicit and will not contain uninitialized data.
@@ -1173,14 +869,23 @@ unsafe impl FromBytes for GspArgumentsPadded {}
 
 impl MessageQueueInitArguments {
     /// Creates a new init arguments structure for `cmdq`.
-    fn new(cmdq: &Cmdq) -> impl Init<Self> + '_ {
-        init!(MessageQueueInitArguments {
+    fn new(cmdq: &Cmdq) -> Self {
+        MessageQueueInitArguments {
             sharedMemPhysAddr: cmdq.dma_addr,
             pageTableEntryCount: num::usize_into_u32::<{ Cmdq::NUM_PTES }>(),
             cmdQueueOffset: num::usize_as_u64(Cmdq::CMDQ_OFFSET),
             statQueueOffset: num::usize_as_u64(Cmdq::STATQ_OFFSET),
-            ..Zeroable::init_zeroed()
-        })
+
+            queueElementHdrSize: num::usize_into_u32::<
+                { size_of::<GspMsgElement>() - size_of::<bindings::rpc_message_header_v>() },
+            >(),
+            queueElementSizeMin: num::usize_into_u32::<GSP_PAGE_SIZE>(),
+            queueElementSizeMax: num::usize_into_u32::<GSP_MSG_QUEUE_ELEMENT_SIZE_MAX>(),
+            queueHeaderAlign: 4,
+            queueElementAlign: num::usize_into_u32::<GSP_PAGE_SHIFT>(),
+
+            ..Default::default()
+        }
     }
 }
 
@@ -1203,7 +908,9 @@ fn new(target: GspDmaTarget, wpr_meta_addr: u64) -> impl Init<Self> {
             bIsGspRmBoot: 1,
             wprCarveoutOffset: 0,
             wprCarveoutSize: 0,
-            __bindgen_padding_0: Default::default(),
+            bInstInSysMode: 0,
+            bIcuEnabled: 0,
+            bScrubCbcSr: 0,
         });
 
         params
@@ -1216,8 +923,8 @@ impl GspRmParams {
     fn new(target: GspDmaTarget, libos_addr: u64) -> impl Init<Self> {
         let params = init!(Self {
             target: target as u32,
+            reserved: 0,
             bootArgsOffset: libos_addr,
-            __bindgen_padding_0: Default::default(),
         });
 
         params
@@ -1226,6 +933,9 @@ fn new(target: GspDmaTarget, libos_addr: u64) -> impl Init<Self> {
 
 pub(crate) type GspFmcBootParams = bindings::GSP_FMC_BOOT_PARAMS;
 
+/// Magic value opening the ABI-stable `GSP_FMC_BOOT_PARAMS` header: `"FMC "` in ASCII.
+const GSP_FMC_BOOT_PARAMS_MAGIC: u32 = 0x2043_4d46;
+
 // SAFETY: Padding is explicit and will not contain uninitialized data.
 unsafe impl AsBytes for GspFmcBootParams {}
 // SAFETY: This struct only contains integer types for which all bit patterns are valid.
@@ -1234,6 +944,8 @@ unsafe impl FromBytes for GspFmcBootParams {}
 impl GspFmcBootParams {
     pub(crate) fn new(wpr_meta_addr: u64, libos_addr: u64) -> impl Init<Self> {
         let init = init!(Self {
+            magic: GSP_FMC_BOOT_PARAMS_MAGIC,
+            size: num::usize_into_u16::<{ size_of::<Self>() }>(),
             // Blackwell FSP obtains WPR info from other sources, so
             // wprCarveoutOffset and wprCarveoutSize are left zero.
             bootGspRmParams <- GspAcrBootGspRmParams::new(GspDmaTarget::CoherentSystem,
diff --git a/drivers/gpu/nova-core/gsp/hal.rs b/drivers/gpu/nova-core/gsp/hal.rs
index 5850fa0fe0e9..ba98347cbbef 100644
--- a/drivers/gpu/nova-core/gsp/hal.rs
+++ b/drivers/gpu/nova-core/gsp/hal.rs
@@ -41,19 +41,6 @@ fn boot(
         ctx: &mut GspBootContext<'_, '_>,
         gsp_fw: &GspFirmware,
     ) -> Result<Option<crate::gsp::UnloadBundle>>;
-
-    /// Performs HAL-specific post-GSP boot tasks.
-    ///
-    /// This method is called by the GSP boot code after the GSP is confirmed to be running, and
-    /// after the initialization commands have been pushed onto its queue.
-    fn post_boot(
-        &self,
-        _gsp: &Gsp,
-        _ctx: &mut GspBootContext<'_, '_>,
-        _gsp_fw: &GspFirmware,
-    ) -> Result {
-        Ok(())
-    }
 }
 
 /// Returns the names of the firmware files required to boot the GSP of `chipset`, in addition to
@@ -75,6 +62,15 @@ pub(crate) const fn boot_firmware_files(chipset: Chipset) -> &'static [&'static
     }
 }
 
+/// Returns `true` if GSP-RM on `chipset` loads its images through the generic falcon bootloader.
+///
+/// Turing and GA100 raise `GMCAPI_CMD_EXEC_GENERIC_BOOTLOADER` during boot and need the
+/// `gen_bootloader.tlv` image to service it. GA102 and later raise `GMCAPI_CMD_EXEC_HS_BINARY`
+/// instead, and [`boot_firmware_files`] ships them no such image.
+pub(super) const fn uses_generic_bootloader(chipset: Chipset) -> bool {
+    matches!(chipset.arch(), Architecture::Turing) || matches!(chipset, Chipset::GA100)
+}
+
 /// Returns the GSP HAL to be used for `chipset`.
 pub(super) fn gsp_hal(chipset: Chipset) -> &'static dyn GspHal {
     match chipset.arch() {
diff --git a/drivers/gpu/nova-core/gsp/hal/tu102.rs b/drivers/gpu/nova-core/gsp/hal/tu102.rs
index 68a48c882c0f..7d685fa0eb30 100644
--- a/drivers/gpu/nova-core/gsp/hal/tu102.rs
+++ b/drivers/gpu/nova-core/gsp/hal/tu102.rs
@@ -40,7 +40,6 @@
             UnloadBundle, //
         },
         regs,
-        sequencer::GspSequencer,
         Gsp,
         GspBootContext,
         GspFwWprMeta, //
@@ -316,17 +315,6 @@ fn boot(
 
         Ok(unload_guard.dismiss())
     }
-
-    fn post_boot(
-        &self,
-        gsp: &Gsp,
-        ctx: &mut GspBootContext<'_, '_>,
-        gsp_fw: &GspFirmware,
-    ) -> Result {
-        GspSequencer::run(&gsp.cmdq, ctx, &gsp.libos, gsp_fw.bootloader.app_version)?;
-
-        Ok(())
-    }
 }
 
 /// The TU102 HAL requires the use of the FWSEC bootloader.
diff --git a/drivers/gpu/nova-core/gsp/sequencer.rs b/drivers/gpu/nova-core/gsp/sequencer.rs
deleted file mode 100644
index e2f1da129d8f..000000000000
--- a/drivers/gpu/nova-core/gsp/sequencer.rs
+++ /dev/null
@@ -1,379 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-
-//! GSP Sequencer implementation for Pre-hopper GSP boot sequence.
-
-use core::array;
-
-use kernel::{
-    device,
-    dma::Coherent,
-    io::{
-        poll::read_poll_timeout,
-        Io, //
-    },
-    prelude::*,
-    time::{
-        delay::fsleep,
-        Delta, //
-    },
-    transmute::FromBytes, //
-};
-
-use crate::{
-    driver::Bar0,
-    falcon::{
-        gsp::Gsp,
-        sec2::Sec2,
-        Falcon, //
-    },
-    gsp::{
-        cmdq::{
-            Cmdq,
-            MessageFromGsp, //
-        },
-        fw,
-        GspBootContext,
-        LibosMemoryRegionInitArgument, //
-    },
-    num::FromSafeCast,
-    sbuffer::SBufferIter,
-};
-
-/// GSP Sequencer information containing the command sequence and data.
-struct GspSequence {
-    /// Current command index for error reporting.
-    cmd_index: u32,
-    /// Command data buffer containing the sequence of commands.
-    cmd_data: KVec<u8>,
-}
-
-impl MessageFromGsp for GspSequence {
-    const FUNCTION: fw::MsgFunction = fw::MsgFunction::GspRunCpuSequencer;
-    type InitError = Error;
-    type Message = fw::RunCpuSequencer;
-
-    fn read(
-        msg: &Self::Message,
-        sbuffer: &mut SBufferIter<array::IntoIter<&[u8], 2>>,
-    ) -> Result<Self, Self::InitError> {
-        let cmd_data = sbuffer.flush_into_kvec(GFP_KERNEL)?;
-        Ok(GspSequence {
-            cmd_index: msg.cmd_index(),
-            cmd_data,
-        })
-    }
-}
-
-const CMD_SIZE: usize = size_of::<fw::SequencerBufferCmd>();
-
-/// GSP Sequencer Command types with payload data.
-/// Commands have an opcode and an opcode-dependent struct.
-#[allow(clippy::enum_variant_names)]
-#[derive(Debug)]
-pub(crate) enum GspSeqCmd {
-    RegWrite(fw::RegWritePayload),
-    RegModify(fw::RegModifyPayload),
-    RegPoll(fw::RegPollPayload),
-    DelayUs(fw::DelayUsPayload),
-    RegStore(fw::RegStorePayload),
-    CoreReset,
-    CoreStart,
-    CoreWaitForHalt,
-    CoreResume,
-}
-
-impl GspSeqCmd {
-    /// Creates a new `GspSeqCmd` from raw data returning the command and its size in bytes.
-    pub(crate) fn new(data: &[u8], dev: &device::Device) -> Result<(Self, usize)> {
-        let fw_cmd = fw::SequencerBufferCmd::from_bytes(data).ok_or(EINVAL)?;
-        let opcode_size = core::mem::size_of::<u32>();
-
-        let (cmd, size) = match fw_cmd.opcode()? {
-            fw::SeqBufOpcode::RegWrite => {
-                let payload = fw_cmd.reg_write_payload()?;
-                let size = opcode_size + size_of_val(&payload);
-                (GspSeqCmd::RegWrite(payload), size)
-            }
-            fw::SeqBufOpcode::RegModify => {
-                let payload = fw_cmd.reg_modify_payload()?;
-                let size = opcode_size + size_of_val(&payload);
-                (GspSeqCmd::RegModify(payload), size)
-            }
-            fw::SeqBufOpcode::RegPoll => {
-                let payload = fw_cmd.reg_poll_payload()?;
-                let size = opcode_size + size_of_val(&payload);
-                (GspSeqCmd::RegPoll(payload), size)
-            }
-            fw::SeqBufOpcode::DelayUs => {
-                let payload = fw_cmd.delay_us_payload()?;
-                let size = opcode_size + size_of_val(&payload);
-                (GspSeqCmd::DelayUs(payload), size)
-            }
-            fw::SeqBufOpcode::RegStore => {
-                let payload = fw_cmd.reg_store_payload()?;
-                let size = opcode_size + size_of_val(&payload);
-                (GspSeqCmd::RegStore(payload), size)
-            }
-            fw::SeqBufOpcode::CoreReset => (GspSeqCmd::CoreReset, opcode_size),
-            fw::SeqBufOpcode::CoreStart => (GspSeqCmd::CoreStart, opcode_size),
-            fw::SeqBufOpcode::CoreWaitForHalt => (GspSeqCmd::CoreWaitForHalt, opcode_size),
-            fw::SeqBufOpcode::CoreResume => (GspSeqCmd::CoreResume, opcode_size),
-        };
-
-        if data.len() < size {
-            dev_err!(dev, "Data is not enough for command\n");
-            return Err(EINVAL);
-        }
-
-        Ok((cmd, size))
-    }
-}
-
-/// GSP Sequencer for executing firmware commands during boot.
-pub(crate) struct GspSequencer<'a> {
-    /// `Bar0` for register access.
-    bar: Bar0<'a>,
-    /// SEC2 falcon for core operations.
-    sec2_falcon: &'a Falcon<'a, Sec2>,
-    /// GSP falcon for core operations.
-    gsp_falcon: &'a Falcon<'a, Gsp>,
-    /// LibOS memory region init arguments.
-    libos: &'a Coherent<[LibosMemoryRegionInitArgument]>,
-    /// Bootloader application version.
-    bootloader_app_version: u32,
-    /// Device for logging.
-    dev: &'a device::Device,
-}
-
-impl fw::RegWritePayload {
-    fn run(&self, sequencer: &GspSequencer<'_>) -> Result {
-        let addr = usize::from_safe_cast(self.addr());
-
-        sequencer.bar.try_write32(self.val(), addr)
-    }
-}
-
-impl fw::RegModifyPayload {
-    fn run(&self, sequencer: &GspSequencer<'_>) -> Result {
-        let addr = usize::from_safe_cast(self.addr());
-
-        sequencer.bar.try_read32(addr).and_then(|val| {
-            sequencer
-                .bar
-                .try_write32((val & !self.mask()) | self.val(), addr)
-        })
-    }
-}
-
-impl fw::RegPollPayload {
-    fn run(&self, sequencer: &GspSequencer<'_>) -> Result {
-        let addr = usize::from_safe_cast(self.addr());
-
-        // Default timeout to 4 seconds.
-        let timeout_us = if self.timeout() == 0 {
-            4_000_000
-        } else {
-            i64::from(self.timeout())
-        };
-
-        // First read.
-        sequencer.bar.try_read32(addr)?;
-
-        // Poll the requested register with requested timeout.
-        read_poll_timeout(
-            || sequencer.bar.try_read32(addr),
-            |current| (current & self.mask()) == self.val(),
-            Delta::ZERO,
-            Delta::from_micros(timeout_us),
-        )
-        .map(|_| ())
-    }
-}
-
-impl fw::DelayUsPayload {
-    fn run(&self, _sequencer: &GspSequencer<'_>) -> Result {
-        fsleep(Delta::from_micros(i64::from(self.val())));
-        Ok(())
-    }
-}
-
-impl fw::RegStorePayload {
-    fn run(&self, sequencer: &GspSequencer<'_>) -> Result {
-        let addr = usize::from_safe_cast(self.addr());
-
-        sequencer.bar.try_read32(addr).map(|_| ())
-    }
-}
-
-impl GspSeqCmd {
-    fn run(&self, seq: &GspSequencer<'_>) -> Result {
-        match self {
-            GspSeqCmd::RegWrite(cmd) => cmd.run(seq),
-            GspSeqCmd::RegModify(cmd) => cmd.run(seq),
-            GspSeqCmd::RegPoll(cmd) => cmd.run(seq),
-            GspSeqCmd::DelayUs(cmd) => cmd.run(seq),
-            GspSeqCmd::RegStore(cmd) => cmd.run(seq),
-            GspSeqCmd::CoreReset => {
-                seq.gsp_falcon.reset()?;
-                seq.gsp_falcon.dma_reset();
-                Ok(())
-            }
-            GspSeqCmd::CoreStart => {
-                seq.gsp_falcon.start()?;
-                Ok(())
-            }
-            GspSeqCmd::CoreWaitForHalt => {
-                seq.gsp_falcon.wait_till_halted()?;
-                Ok(())
-            }
-            GspSeqCmd::CoreResume => {
-                // At this point, 'SEC2-RTOS' has been loaded into SEC2 by the sequencer
-                // but neither SEC2-RTOS nor GSP-RM is running yet. This part of the
-                // sequencer will start both.
-
-                // Reset the GSP to prepare it for resuming.
-                seq.gsp_falcon.reset()?;
-
-                let libos_dma_address = seq.libos.dma_address();
-
-                // Write the libOS DMA address to GSP mailboxes.
-                seq.gsp_falcon.write_mailboxes(
-                    Some(libos_dma_address as u32),
-                    Some((libos_dma_address >> 32) as u32),
-                );
-
-                // Start the SEC2 falcon which will trigger GSP-RM to resume on the GSP.
-                seq.sec2_falcon.start()?;
-
-                // Poll until GSP-RM reload/resume has completed (up to 2 seconds).
-                seq.gsp_falcon.check_reload_completed(Delta::from_secs(2))?;
-
-                // Verify SEC2 completed successfully by checking its mailbox for errors.
-                let mbox0 = seq.sec2_falcon.read_mailbox0();
-                if mbox0 != 0 {
-                    dev_err!(seq.dev, "Sequencer: sec2 errors: {:?}\n", mbox0);
-                    return Err(EIO);
-                }
-
-                // Configure GSP with the bootloader version.
-                seq.gsp_falcon.write_os_version(seq.bootloader_app_version);
-
-                // Verify the GSP's RISC-V core is active indicating successful GSP boot.
-                if !seq.gsp_falcon.is_riscv_active() {
-                    dev_err!(seq.dev, "Sequencer: RISC-V core is not active\n");
-                    return Err(EIO);
-                }
-                Ok(())
-            }
-        }
-    }
-}
-
-/// Iterator over GSP sequencer commands.
-struct GspSeqIter<'a> {
-    /// Command data buffer.
-    cmd_data: &'a [u8],
-    /// Current position in the buffer.
-    current_offset: usize,
-    /// Total number of commands to process.
-    total_cmds: u32,
-    /// Number of commands processed so far.
-    cmds_processed: u32,
-    /// Device for logging.
-    dev: &'a device::Device,
-}
-
-impl<'a> GspSeqIter<'a> {
-    fn new(seq: &'a GspSequence, dev: &'a device::Device) -> Self {
-        Self {
-            cmd_data: &seq.cmd_data,
-            current_offset: 0,
-            total_cmds: seq.cmd_index,
-            cmds_processed: 0,
-            dev,
-        }
-    }
-}
-
-impl<'a> Iterator for GspSeqIter<'a> {
-    type Item = Result<GspSeqCmd>;
-
-    fn next(&mut self) -> Option<Self::Item> {
-        // Stop if we've processed all commands or reached the end of data.
-        if self.cmds_processed >= self.total_cmds || self.current_offset >= self.cmd_data.len() {
-            return None;
-        }
-
-        // Check if we have enough data for opcode.
-        if self.current_offset + core::mem::size_of::<u32>() > self.cmd_data.len() {
-            return Some(Err(EIO));
-        }
-
-        let offset = self.current_offset;
-
-        // Handle command creation based on available data,
-        // zero-pad if necessary (since last command may not be full size).
-        let mut buffer = [0u8; CMD_SIZE];
-        let copy_len = if offset + CMD_SIZE <= self.cmd_data.len() {
-            CMD_SIZE
-        } else {
-            self.cmd_data.len() - offset
-        };
-        buffer[..copy_len].copy_from_slice(&self.cmd_data[offset..offset + copy_len]);
-        let cmd_result = GspSeqCmd::new(&buffer, self.dev);
-
-        cmd_result.map_or_else(
-            |_err| {
-                dev_err!(self.dev, "Error parsing command at offset {}\n", offset);
-                None
-            },
-            |(cmd, size)| {
-                self.current_offset += size;
-                self.cmds_processed += 1;
-                Some(Ok(cmd))
-            },
-        )
-    }
-}
-
-impl<'a> GspSequencer<'a> {
-    pub(crate) fn run(
-        cmdq: &Cmdq,
-        ctx: &'a GspBootContext<'_, '_>,
-        libos: &'a Coherent<[LibosMemoryRegionInitArgument]>,
-        bootloader_app_version: u32,
-    ) -> Result {
-        let seq_info = cmdq.await_msg::<GspSequence>()?;
-
-        let sequencer = GspSequencer {
-            bar: ctx.bar,
-            sec2_falcon: ctx.sec2_falcon,
-            gsp_falcon: ctx.gsp_falcon,
-            libos,
-            bootloader_app_version,
-            dev: ctx.dev(),
-        };
-
-        dev_dbg!(sequencer.dev, "Running CPU Sequencer commands\n");
-
-        for cmd_result in GspSeqIter::new(&seq_info, sequencer.dev) {
-            match cmd_result {
-                Ok(cmd) => cmd.run(&sequencer)?,
-                Err(e) => {
-                    dev_err!(
-                        sequencer.dev,
-                        "Error running command at index {}\n",
-                        seq_info.cmd_index
-                    );
-                    return Err(e);
-                }
-            }
-        }
-
-        dev_dbg!(
-            sequencer.dev,
-            "CPU Sequencer commands completed successfully\n"
-        );
-        Ok(())
-    }
-}
diff --git a/drivers/gpu/nova-core/irq/gsp.rs b/drivers/gpu/nova-core/irq/gsp.rs
index ee7d13b14a88..adc4866bf490 100644
--- a/drivers/gpu/nova-core/irq/gsp.rs
+++ b/drivers/gpu/nova-core/irq/gsp.rs
@@ -178,7 +178,7 @@ fn handle(&self) -> irq::ThreadedIrqReturn {
 
     /// IRQ thread: drains and dispatches the GSP-to-CPU message queue.
     fn handle_threaded(&self) -> irq::IrqReturn {
-        if let Err(e) = self.cmdq.drain() {
+        if let Err(e) = self.cmdq.drain(self.bar) {
             // A queue that fails to drain cannot advance past the message that failed, so every
             // later notification would repeat this failure. Disable the source instead.
             self.tree
diff --git a/drivers/gpu/nova-core/mctp.rs b/drivers/gpu/nova-core/mctp.rs
index 0ae88bef2a05..3e94b7f3a6b4 100644
--- a/drivers/gpu/nova-core/mctp.rs
+++ b/drivers/gpu/nova-core/mctp.rs
@@ -28,6 +28,8 @@ pub(crate) enum NvdmType with TryFrom<Bounded<u32, 8>> {
         Cot = 0x14,
         /// FSP command response.
         FspResponse = 0x15,
+        /// GSP-RM RPC message.
+        RmRpc = 0x25,
         /// GMC API message (GSP command queue).
         GmcApi = 0x26,
     }
-- 
2.55.0

