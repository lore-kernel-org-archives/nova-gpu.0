Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010005.outbound.protection.outlook.com [52.101.46.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC1473B1ED0
	for <nova-gpu@lists.linux.dev>; Fri, 18 Sep 2026 01:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789693765; cv=fail; b=rO8IBVbSFeJLjIVZ/oB4w/oRpgA+o+WP8+zV16KRgHI2gu1PwE82x045ncmTu/6/zdOmqb+fHANgAcwD2zgEgu5tcXQ1qUOZIyLD48vRLJktpe721GrbojN1NOsR3QVjEi81l9lzCyWtYUc4yRu+fTjrIDKS+HVLnKqHguGDaXw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789693765; c=relaxed/simple;
	bh=DREEy/on+OJe0TnLuxXglEh88FxnJzYm8wrKYF6vzUY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jO4Mj78Vy4N+9b8TU+iReN6ZPwG4In93TsYZl86kX+zFnEmskmarmNOZu0LKCFFyJjZGS5qywrhTi0i81ofquoncr4dGKCngq4VMJy5mFU2erT1A4Ak/5Y6IyZV5xEBi2aGkhiOz2BmEaOjl08qATx6nAj8iZmTuBAxNG2qmyP0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=sVzVI1Pw; arc=fail smtp.client-ip=52.101.46.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="sVzVI1Pw"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Sj9KwpgGorfvr/UOitzT86Sm/j/f6ZoclT41CF9xzgJsWAxeU4VpuTmHnFNdXfVxzHIcfmmDBhSgrut8l0F8hgWU22CGUZXhDwYCQvn84VYgFls0hbuldICTPR7ABvK1H3TPtFxzwNxaVukSyLAj1D427Qc0jEO4adb8b8scvPv0h/ibiDoqNc3KuDNb/LQ4HKc2GJ9UsU+Eh3IS6QFrqk+dFovkZLTfMqVJ5C+iO+8JHJIPYiGcKkNoTp49q0BpbMwnIlws9Kd86082Xl+SSDyKIJwG8Nv1vrPq3yPt/uU0AmkPoRpoOrBlSaEbBWn8kxDfjDdQmDLqA78GLNSrpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LttdR4n74DPhtvK/gD06cuoNzkUX+FMiJENcKm1/0jg=;
 b=mT7F1zwBdfC6pkomlqCTODz67KMuk3XPC+i8ZgK2UgihTGNMvcwOpNV9oJs8mTMOj9/LpLzuUPkIvFjLrQRXUKNAGKwsOUaxdo7tERP10P2hXe3Z7f8mEiSuG1rWzZkr2QBKQxkvveiW1ql4Mp+z74wRTsfVZZo+J0bBmxN+0WDHNs8ihMWucAxoWqJH6BBZ5eQ3j8SVB0eeubFUyBSXHlT+Rm4zrQA4qzuwn+xKPskCmo8AvSwg9khOpELN6TbWRQ81Kfq6OFU1BjSHNSOIqHeIkGKgpWFjsUT8cTQ0s/0KwrNn8NvRshNtRZxcKeviXuhUl0SZEyDkfT+0Znthwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LttdR4n74DPhtvK/gD06cuoNzkUX+FMiJENcKm1/0jg=;
 b=sVzVI1PwJNpzdQaAtdvYci6h7UrsHKJMhXawMBCIpM/PPZBW2464dY7nSc//iMVSHvNR2aGUAfailM6QG65g/vM6rkdY77dI9BKiesuUGaoIckq5t2p/NlPtHN0YfotXpyk+YjSUmbmLZm7CzQGfdqy3RSOfPsgPDoD0gTCQIYfgSh/bm+qpMC2v1AaeItpnq8Pf0kj0LqvuDUcM3YzYtDTP8WQ3hOfwj+6bNyxHcsZzEGMOMLzBDaLSr4mvZNKic63xYL8tV6DfkUT1ttydaTihIitExf0z3xUbX9yS9iJIdlEWwy2v+VaTUPYlpKRcvSB5N3Wdj77UsyWt+yrT1Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 IA0PR12MB8349.namprd12.prod.outlook.com (2603:10b6:208:407::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.13; Fri, 18 Sep
 2026 01:08:27 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%4]) with mapi id 15.21.0406.007; Fri, 18 Sep 2026
 01:08:27 +0000
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
Subject: [PATCH v3 27/33] gpu: nova-core: switch to the r000 GSP firmware
Date: Thu, 17 Sep 2026 18:07:13 -0700
Message-ID: <20260918010719.1176945-28-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260918010719.1176945-1-jhubbard@nvidia.com>
References: <20260918010719.1176945-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0123.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::8) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|IA0PR12MB8349:EE_
X-MS-Office365-Filtering-Correlation-Id: 22fd6370-9b25-415c-9a0b-08df15214708
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|7416014|366016|18002099003|22082099003|56012099006|3023799007|11063799006|5023799004|10067099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	eWWmVHegeNGrHaPvpXYTZ7VgdzjEF2adcIZxS5VMNbTEwHmYVUWsGrCRHuDSsgmabiVVGjOyvSz8zV98L1VVwxCT3HOmff8VeoZm+nzZzDFQwCwuyTofiD0Ca3fQZCb19lra/2PPDodGnSKThiYk91b0EIYK4Myt+a4E/aE5nO2no04vAgvRVp0LyEhtPZ8Xpqv017hXMkkaurWALG/ExHhcg9soeWyDeU2F0l6oc68A9bE6grC0gjyGB1xllKNXTKjQgO2cFEQicd3RJJIkSM3Fevn11z4/hNFoas2RcTtTlQLpFEDCmiPHWtssgERzmhfJp75Ylu1ZGvOfV9MlnztkkvNSjkgm2oVnqZxQhP4tfRktqPb6sXpSW6cj1GyHk2DIjFfLNebGkc7nAiLTXIUyrmM5D6/c/mBXc7ALPr+8ryn+eoDO/z8DMK/ErDyUGY7wXwb7hLGLzXgbyJOUBWsYbiRjqmZ5p2zM9mLf3hmJ602MmN71gOdRNGnH4CXSFSEY1QFG2BZLVvfnAstyFPbPuwrGafrh2GfIJdKM4Y219OGZ0C90zkPbbFNEkZVB9l2DI0nKlx+80kj35gQAogpG6L7wwz+ieQqNh6VCDT0RgwIMWopRtGVSPqT0aFKBGz1lSaRDvR2i+7n2AyCz4afaqNCX3lr4qb/XfCy7r48=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(7416014)(366016)(18002099003)(22082099003)(56012099006)(3023799007)(11063799006)(5023799004)(10067099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?jGRi2tSP2qa6ElLt2Tpc1qOX5tVukllvbACSPTUOKxL6wBFWr2q5PwLHTOT3?=
 =?us-ascii?Q?/QlVDFlSbR8n1fCKIAgQq+j1pFm+K+8X8Prs1Tk9lCS736VVRtlGfyln6BvN?=
 =?us-ascii?Q?ZQ0smg2wXO5yG/dVExzjs93HoczGUDXqbQTkRqBRyhR3uWYxo3p0crqnJkS/?=
 =?us-ascii?Q?eDCQWMLz2WPNl7R8PC/j6+TFiYj/h1OD/LrS4EudKhMPRGNTW1br2Bwx1Kh/?=
 =?us-ascii?Q?p8qkuhq3ShnSqJBDmI+eg004MnlsSPvuaItxEd+6CkomzqyYJz3v2vpWq82F?=
 =?us-ascii?Q?9QE+/VE0GoIIsBRKCFeO9AP54rQ88cinsvHDuo+xN/8QKmU18QdonPj16New?=
 =?us-ascii?Q?44J8PBUShNlfjooynwe2egivarWX8OZ2k8L3a3h7WA+QdCtl1cRQa1NCqV7F?=
 =?us-ascii?Q?9pB8hdhbeViqMgKoxhTSF2qBCMbrhClMpAib+gzPKNFGT/+j60KAFmBqY9Gb?=
 =?us-ascii?Q?fbHwbGqD98FcHKJpzdocMYhTAi3LNg6cVlk2ic5mAuXYgJ8kemqnouQLBeow?=
 =?us-ascii?Q?xW6+50CuZD8NAqB3LO0y3Oi3eUAaIPRXGFVLKQWdljePgRNSptvsBX6pW47M?=
 =?us-ascii?Q?d7QoSJMFzxYVX2juRKFvPUGBoSWz+2U+i4RfB/8hN2FUHCwaaynQU4R4VHmK?=
 =?us-ascii?Q?Nujf2eoLYaMkZyNldzXaa0XAMYVr8xflbe+E5xhzWc8ptd1SQlSbcoHGCg5T?=
 =?us-ascii?Q?VXtZCr6u33nbThkv9lloPddZVOGoMJOszwpcLuL5ECV3fnh2iEdOOVlgF6Y+?=
 =?us-ascii?Q?bRbFEvQGMkh9oK0NUgh+XxsBe7h44R3jeSvuWYMOlrcjKPzzGs4Oj7X5xiT6?=
 =?us-ascii?Q?VPv9PN128iv3WVvRZhSoJqVhey/dp8LSKRS081Gb/prntAOENyW1pKsRJA9z?=
 =?us-ascii?Q?TcE1H4598QBb0GbLgYWVjmRH14i8rf0IioVM6rCzlJ6lxAbvTDbO1wC44b6g?=
 =?us-ascii?Q?X/g4HNJTK23d4CQxSUIvkIRSbB6AsH8hfypdglZAXunTntb+sLVC4HfT0Ihg?=
 =?us-ascii?Q?ZPK/cgXgL7LZfmbyJPhuMR8ly4pJP/AdJYuXJHjTFCLHi33cIiEojyKbpxin?=
 =?us-ascii?Q?pyFZ1EFombu57R1E/ugeB+wymDTOeD3gmKLfqNRk6wcuy2YPLGiaCmu+Gb1Q?=
 =?us-ascii?Q?BJZjoSKV82+LgJoA+smfZGV18EUD4NEtWQmi6yWwSjHttVONqda3Ga7qOToy?=
 =?us-ascii?Q?jWacMF8hR3whzdz7dtWULRxvF/1ERkk87oVL4jJ24GroAP4115sFfOLAT0VR?=
 =?us-ascii?Q?3FTQ10Lemr4WpjzsSV8Hckzf74pWbCDgDpnPKffCFw0kOS+/YPY32lXwUPJS?=
 =?us-ascii?Q?01WqdzopzJTB70SGm1ZBDi6uxWZKZqY5dKoAbTO3uKriJQt8L+WubkjiQTRz?=
 =?us-ascii?Q?LM2uf2zMLKbHtkwLjy74h5c079xN3Z2P2fmyAiUDw5gus5vzlgnVNpioiKUU?=
 =?us-ascii?Q?+4Qnctkzo3+soBa8gnJoQHqVaRNOm0+hFMqzI5+3n3rEPCfZAE8iIvj83hef?=
 =?us-ascii?Q?Tf+U784VivBzCNumNGI38oXyzFh7q/fVMh8GLIBfuuck1h7RjtVx7BoU//Vr?=
 =?us-ascii?Q?+qXtjWp6gHeXnZHdNv4mzpzvxY2941tE9lSgELkd3HGPhUm6C1yOhZBuNkKj?=
 =?us-ascii?Q?2sh1Y402D2H6jf/LotPC4zhMtzeguuHOH6RkAmieJPZHrbstRkt4PsxYPeHR?=
 =?us-ascii?Q?WipCe2fb7BISifsoZHABkGYdwY96T6jGBb/sGQXsbYgI9eAseoj0ZpH6uHsg?=
 =?us-ascii?Q?JlunOb+hgA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 22fd6370-9b25-415c-9a0b-08df15214708
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2026 01:07:58.1824
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4hiPiqo5do7wSj2dkLXrCErQaX8jP7lJZm0F4nJIWB+q5zREtGffsAl+h7+Xx74IVHOeAOxFXndC0WkG4jxRcQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8349

The r000 firmware changes five things about how GSP-RM and the driver
exchange messages:

* A queue element opens with the MCTP and NVDM transport headers and
  carries no checksum.

* Msgq v2 keeps the four queue pointers in BAR0 registers, and the write
  to the command queue head register is also the doorbell.

* The load-and-execute boot steps arrive as GMC events rather than as
  RPC events.

* One GSP_INIT request replaces the system-info, registry and
  static-info commands, and its reply replaces the init-done event.

* GSP-RM suspends on a GSP_SUSPEND command and never answers it, where
  r570 answered an UnloadingGuestDriver RPC.

It also requires two more buffers from the driver at boot, the ucodes
image and a page in which GSP-RM reports its own state, and it reserves
more framebuffer for itself: a larger region for the PMU, the GPU's
power management unit, on GB100, and a larger heap outside the WPR, the
write-protected region, on GB20x.

Only one firmware runs at a time, so a driver that had made some of
these changes but not the others would not boot. Switch all of them
together, and change the driver's bindings alias so that it names the
r000 module.

Give the queue its own copies of the four pointers, as Open RM's msgq
library does. A GSP reset zeroes the pointer registers, so the driver
writes its two pointers out from its copies, and it keeps the last value
that it read of each GSP pointer and uses that value until GSP-RM writes
the register again. The pointers count elements without wrapping at the
ring size. A ring is empty when its two pointers are equal and full when
they differ by the ring size, so the ring no longer keeps one slot
empty.

Load the ucodes image at boot and give GSP-RM its location in the boot
arguments. GSP-RM reads the image only while it starts, so the image is
freed when the boot sequence returns. The TU102 HAL loads the generic
falcon bootloader for the load-and-execute handler on the chipsets that
boot through it.

Suspend GSP-RM with the GSP_SUSPEND request in place of the unload RPC.
GSP-RM posts messages while it suspends, and the shutdown path runs
after the GSP event interrupt is freed, so drain the queue while polling
for the suspend.

Three things then have no caller:

* The CPU sequencer, which ran the register scripts that r570's GSP-RM
  sent as RPC events.

* The wait for the init-done event.

* The four RPC commands that GSP_INIT and GSP_SUSPEND replace.

Remove all three. Mark the RPC send-and-wait paths dead rather than
removing them: no caller waits for an RPC reply any more, but the RPC
commands that the driver sends once GSP-RM is up, which later series
add, use them unchanged.

Assisted-by: LLM
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 Documentation/gpu/nova/core/interrupts.rst |  11 +-
 drivers/gpu/nova-core/fb/hal/gb100.rs      |  24 +-
 drivers/gpu/nova-core/fb/hal/gb202.rs      |   6 +-
 drivers/gpu/nova-core/firmware/bindata.rs  |   1 -
 drivers/gpu/nova-core/gsp.rs               |   9 +-
 drivers/gpu/nova-core/gsp/boot.rs          |  47 +-
 drivers/gpu/nova-core/gsp/cmdq.rs          | 247 ++++-----
 drivers/gpu/nova-core/gsp/commands.rs      | 253 +---------
 drivers/gpu/nova-core/gsp/fw.rs            | 559 ++++++---------------
 drivers/gpu/nova-core/gsp/fw/commands.rs   | 198 +-------
 drivers/gpu/nova-core/gsp/hal.rs           |  14 -
 drivers/gpu/nova-core/gsp/hal/tu102.rs     |  12 -
 drivers/gpu/nova-core/gsp/sequencer.rs     | 379 --------------
 drivers/gpu/nova-core/sbuffer.rs           |   1 +
 14 files changed, 324 insertions(+), 1437 deletions(-)
 delete mode 100644 drivers/gpu/nova-core/gsp/sequencer.rs

diff --git a/Documentation/gpu/nova/core/interrupts.rst b/Documentation/gpu/nova/core/interrupts.rst
index 280dcf97688a..fdcd789cf4f9 100644
--- a/Documentation/gpu/nova/core/interrupts.rst
+++ b/Documentation/gpu/nova/core/interrupts.rst
@@ -450,7 +450,7 @@ thread to drain the queue::
 A halt and a posted message can be pending together, so the top half services
 every cause that the status reports.
 
-A drain fails when a message's framing or checksum is bad, which poisons the
+A drain fails when an element's framing is bad, and the bad framing poisons the
 queue (see "Draining the GSP-to-CPU queue"). Every later event would fail the
 same way, so the IRQ thread disables vector 155 and logs the failure, which
 leaves the queue unserviced until the device is reset.
@@ -582,11 +582,10 @@ The read pointer advances past every message, whether it matched, was an event,
 or matched but failed to decode, so a message is never left at the queue head
 for the next receive to parse again.
 
-Corrupt framing is the exception. A message's length is inside the region that
-the checksum covers, so once the framing or the checksum fails there is no
-trustworthy length with which to skip the message. Such a failure poisons the
-queue: nova-core logs it once, and every later receive fails with ``EIO`` until
-the device is reset.
+Corrupt framing is the exception. An element that fails framing validation has
+no trustworthy length, so the read pointer cannot advance past it. Such a
+failure poisons the queue: nova-core logs it once, and every later receive
+fails with ``EIO`` until the device is reset.
 
 The polling path and the IRQ thread both read the queue under the command-queue
 mutex. Replies and events share one queue and one read pointer, so one lock is
diff --git a/drivers/gpu/nova-core/fb/hal/gb100.rs b/drivers/gpu/nova-core/fb/hal/gb100.rs
index 9fa094939600..33a00fc12aaa 100644
--- a/drivers/gpu/nova-core/fb/hal/gb100.rs
+++ b/drivers/gpu/nova-core/fb/hal/gb100.rs
@@ -79,10 +79,28 @@ fn write_sysmem_flush_page_gb100(hshub0: Mmio<'_, regs::Hshub0Registers>, addr:
     hshub0.write_reg(regs::NV_PFB_HSHUB_EG_PCIE_FLUSH_SYSMEM_ADDR_LO::zeroed().with_adr(addr_lo));
 }
 
-// This PMU reservation size is r570-specific.
+/// PMU backing store.
+const PMU_BACKING_STORE_SIZE: usize = 9 * SZ_1M;
+
+/// PMU surfaces, `kpmuReservedMemorySurfacesSizeGet` in Open RM.
+const PMU_SURFACES_SIZE: usize = SZ_16M + SZ_256K;
+
+/// Miscellaneous PMU memory.
+const PMU_MISC_SIZE: usize = SZ_4K;
+
+/// Alignment of the PMU reserved region, `KPMU_RESERVED_MEMORY_ALIGNMENT` in Open RM.
+const PMU_RESERVED_MEMORY_ALIGNMENT: Alignment = Alignment::new::<SZ_128K>();
+
+/// PMU region above FRTS: the backing store, the surfaces and the miscellaneous memory, aligned to
+/// [`PMU_RESERVED_MEMORY_ALIGNMENT`].
+const PMU_RESERVED_SIZE: usize = const_align_up(
+    PMU_BACKING_STORE_SIZE + PMU_SURFACES_SIZE + PMU_MISC_SIZE,
+    PMU_RESERVED_MEMORY_ALIGNMENT,
+)
+.unwrap();
+
 pub(super) const fn pmu_reserved_size_gb100() -> u32 {
-    usize_into_u32::<{ const_align_up(SZ_8M + SZ_16M + SZ_4K, Alignment::new::<SZ_128K>()).unwrap() }>(
-    )
+    usize_into_u32::<PMU_RESERVED_SIZE>()
 }
 
 impl FbHal for Gb100 {
diff --git a/drivers/gpu/nova-core/fb/hal/gb202.rs b/drivers/gpu/nova-core/fb/hal/gb202.rs
index 4341ecf36188..345179063b30 100644
--- a/drivers/gpu/nova-core/fb/hal/gb202.rs
+++ b/drivers/gpu/nova-core/fb/hal/gb202.rs
@@ -72,9 +72,9 @@ fn pmu_reserved_size(&self) -> u32 {
     }
 
     fn non_wpr_heap_size(&self) -> u64 {
-        // Non-WPR heap for GB20x (see Open RM: kgspGetNonWprHeapSize, GB202+).
-        // This size is r570-specific.
-        u64::SZ_2M + u64::SZ_128K
+        // Non-WPR heap for GB20x (see Open RM: kgspGetNonWprHeapSize, GB202+). This size is
+        // r000-specific.
+        3 * u64::SZ_1M
     }
 
     fn frts_size(&self) -> u64 {
diff --git a/drivers/gpu/nova-core/firmware/bindata.rs b/drivers/gpu/nova-core/firmware/bindata.rs
index 410cb741273c..12a8e74cc11c 100644
--- a/drivers/gpu/nova-core/firmware/bindata.rs
+++ b/drivers/gpu/nova-core/firmware/bindata.rs
@@ -26,7 +26,6 @@ pub(crate) struct UcodesImage<'a> {
     radix3: Pin<KBox<Radix3<'a>>>,
 }
 
-#[expect(dead_code)]
 impl<'a> UcodesImage<'a> {
     /// Loads the ucodes image that the `ucodes` metadata file names, and maps it for `dev`.
     ///
diff --git a/drivers/gpu/nova-core/gsp.rs b/drivers/gpu/nova-core/gsp.rs
index a8aec431b0b1..85967119cd7e 100644
--- a/drivers/gpu/nova-core/gsp.rs
+++ b/drivers/gpu/nova-core/gsp.rs
@@ -26,7 +26,6 @@
 mod fw;
 mod nvkv;
 mod regs;
-mod sequencer;
 
 pub(crate) use fw::{
     GspFmcBootParams,
@@ -251,8 +250,12 @@ pub(crate) fn new(
 
             Ok(try_pin_init!(Self {
                 cmdq <- Cmdq::new(dev, bar),
-                rmargs: Coherent::init(dev, GFP_KERNEL, GspArgumentsPadded::new(&cmdq))?,
                 rm_state_monitor: Coherent::zeroed(dev, GFP_KERNEL)?,
+                rmargs: Coherent::init(
+                    dev,
+                    GFP_KERNEL,
+                    GspArgumentsPadded::new(&cmdq, rm_state_monitor),
+                )?,
                 libos: {
                     let mut libos = CoherentBox::zeroed_slice(
                         dev,
@@ -295,6 +298,6 @@ pub(crate) fn new(
 pub(crate) struct BootResult<'a> {
     /// The unload bundle for [`Gsp::unload`], if one could be built.
     pub(crate) unload_bundle: Option<UnloadBundle<'a>>,
-    /// The static GPU configuration, as GSP-RM reported it at the end of boot.
+    /// The static GPU configuration, as decoded from the `GSP_INIT` reply.
     pub(crate) static_info: commands::GspStaticInfo,
 }
diff --git a/drivers/gpu/nova-core/gsp/boot.rs b/drivers/gpu/nova-core/gsp/boot.rs
index 86a122438d44..5da3d134eec7 100644
--- a/drivers/gpu/nova-core/gsp/boot.rs
+++ b/drivers/gpu/nova-core/gsp/boot.rs
@@ -31,6 +31,7 @@
         FLCN_ERR_BINARY_NOT_STARTED, //
     },
     firmware::{
+        bindata::UcodesImage,
         gen_bootloader::{
             BootloaderDmemDescV2,
             GenericBootloader, //
@@ -41,6 +42,7 @@
         cmdq::Cmdq,
         commands,
         fw::{
+            GspArgumentsPadded,
             GMCAPI_CMD_EXEC_GENERIC_BOOTLOADER,
             GMCAPI_CMD_EXEC_HS_BINARY, //
         }, //
@@ -153,7 +155,6 @@ fn core_resume(&self) -> Result {
     /// - `EINVAL` if `command_id` is not a load-and-execute command.
     ///
     /// Errors from the handlers and from [`Self::core_resume`] are propagated as-is.
-    #[expect(dead_code)]
     fn dispatch_gmc_boot_event(
         &self,
         command_id: u32,
@@ -347,6 +348,10 @@ impl<'gsp> super::Gsp<'gsp> {
     ///
     /// Returns, with the GSP running, the static configuration that GSP-RM reported and the
     /// unload bundle for [`Self::unload`].
+    ///
+    /// # Errors
+    ///
+    /// - `ENOENT` if the ucodes image is not installed.
     pub(crate) fn boot(
         self: Pin<&mut Self>,
         mut ctx: super::GspBootContext<'_, 'gsp>,
@@ -359,10 +364,12 @@ pub(crate) fn boot(
 
         let gsp_fw = KBox::pin_init(GspFirmware::new(dev, chipset), GFP_KERNEL)?;
 
-        self.cmdq
-            .send_command_no_wait(commands::SetSystemInfo::new(pdev, chipset))?;
-        self.cmdq
-            .send_command_no_wait(commands::SetRegistry::new(ctx.vgpu.state())?)?;
+        let generic_bootloader = hal.generic_bootloader(dev, chipset, gsp_falcon.imem_size())?;
+
+        // GSP-RM reads the ucodes image through the image's page table only while it starts up, so
+        // the image is freed when the boot sequence returns.
+        let ucodes = UcodesImage::new(dev, chipset)?;
+        GspArgumentsPadded::set_bindata(&self.rmargs, &ucodes);
 
         // Perform the chipset-specific boot sequence, and retrieve the unload bundle.
         let unload_bundle = hal.boot(&self, &mut ctx, &gsp_fw)?.or_else(|| {
@@ -393,12 +400,20 @@ pub(crate) fn boot(
 
         dev_dbg!(pdev, "RISC-V active? {}\n", gsp_falcon.is_riscv_active(),);
 
-        hal.post_boot(&self, ctx, &gsp_fw)?;
-
-        // Wait until GSP is fully initialized.
-        commands::wait_gsp_init_done(&self.cmdq)?;
+        let init_payload = commands::build_gsp_init_payload(pdev, chipset, ctx.vgpu.state())?;
+        let load_exec = LoadExecContext {
+            bootloader: generic_bootloader.as_ref(),
+            gsp_falcon,
+            sec2_falcon: ctx.sec2_falcon,
+            dev,
+            bootloader_app_version: gsp_fw.bootloader.app_version,
+            libos_dma_handle: self.libos.dma_address(),
+        };
 
-        let static_info = self.cmdq.send_command(commands::GetGspStaticInfo)?;
+        let static_info =
+            commands::gsp_init(&self.cmdq, &init_payload, |header, payload_0, payload_1| {
+                load_exec.dispatch_gmc_boot_event(header.gmc.command_id(), payload_0, payload_1)
+            })?;
 
         Ok(super::BootResult {
             unload_bundle: unload_guard.dismiss().1,
@@ -412,12 +427,16 @@ fn shutdown_gsp(
         gsp_falcon: &Falcon<'_, Gsp>,
         mode: commands::PowerStateLevel,
     ) -> Result {
-        // Command to shut the GSP down.
-        cmdq.send_command(commands::UnloadingGuestDriver::new(mode))?;
+        commands::gsp_suspend(cmdq, mode)?;
 
-        // Wait until GSP signals it is suspended.
+        // GSP-RM posts messages while it suspends, and the GSP event interrupt is already freed,
+        // so this poll drains them.
         read_poll_timeout(
-            || Ok(gsp_falcon.is_processor_suspended()),
+            || {
+                cmdq.drain()?;
+
+                Ok(gsp_falcon.is_processor_suspended())
+            },
             |suspended| *suspended,
             Delta::from_millis(10),
             Delta::from_secs(5),
diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gsp/cmdq.rs
index f64a97736ed7..93c31b49903a 100644
--- a/drivers/gpu/nova-core/gsp/cmdq.rs
+++ b/drivers/gpu/nova-core/gsp/cmdq.rs
@@ -26,9 +26,7 @@
     sync::{
         barrier::{
             dma_mb,
-            Full,
-            Read,
-            Write, //
+            Full, //
         },
         Mutex, //
     },
@@ -57,7 +55,6 @@
             GspGmcMsgElement,
             GspMsgElement,
             MsgFunction,
-            MsgqRxHeader,
             MsgqTxHeader,
             QueueElementHeader,
             GSP_MSG_QUEUE_ELEMENT_SIZE_MAX, //
@@ -185,17 +182,13 @@ struct MsgqData {
 ///
 /// Contains the data for a message queue, that either the driver or GSP writes to.
 ///
-/// Note that while the write pointer of `tx` corresponds to the `msgq` of the same instance, the
-/// read pointer of `rx` actually refers to the `Msgq` owned by the other side.
-/// This design ensures that only the driver or GSP ever writes to a given instance of this struct.
+/// The queue pointers are in BAR0 registers, so `tx` carries the queue's geometry alone. `msgq`
+/// is aligned to [`GSP_PAGE_SIZE`], and the bytes between the two are zero padding.
 #[repr(C)]
-// There is no struct defined for this in the open-gpu-kernel-source headers.
-// Instead it is defined by code in `GspMsgQueuesInit()`.
+// The firmware headers declare no struct for this layout.
 struct Msgq {
-    /// Header for sending messages, including the write pointer.
+    /// The msgq TX header, which describes the queue to the GSP.
     tx: MsgqTxHeader,
-    /// Header for receiving messages, including the read pointer.
-    rx: MsgqRxHeader,
     /// The message queue proper.
     msgq: MsgqData,
 }
@@ -205,15 +198,11 @@ struct Msgq {
 struct GspMem {
     /// Self-mapping page table entries.
     ptes: PteArray<{ Self::PTE_ARRAY_SIZE }>,
-    /// CPU queue: the driver writes commands here, and the GSP reads them. It also contains the
-    /// write and read pointers that the CPU updates. This means that the read pointer here is an
-    /// index into the GSP queue.
+    /// CPU queue: the driver writes commands here, and the GSP reads them.
     ///
     /// This member is read-only for the GSP.
     cpuq: Msgq,
-    /// GSP queue: the GSP writes messages here, and the driver reads them. It also contains the
-    /// write and read pointers that the GSP updates. This means that the read pointer here is an
-    /// index into the CPU queue.
+    /// GSP queue: the GSP writes messages here, and the driver reads them.
     ///
     /// This member is read-only for the driver.
     gspq: Msgq,
@@ -242,27 +231,50 @@ unsafe impl FromBytes for GspMem {}
 ///   pointer and the GSP read pointer. This region is returned by [`Self::driver_write_area`].
 /// * The driver owns (i.e. can read from) the part of the GSP message queue between the CPU read
 ///   pointer and the GSP write pointer. This region is returned by [`Self::driver_read_area`].
+///
+/// Each pointer counts elements without wrapping at the ring size: a ring is empty when its two
+/// pointers are equal and full when they differ by the ring size. A GSP reset zeroes all four
+/// pointer registers, so the driver keeps its own two pointers here and writes them out. It also
+/// keeps the last value that it read of each GSP pointer, and uses that value while the register
+/// reads as zero.
 struct DmaGspMem<'a> {
     /// The queues, mapped for the GSP.
     mem: Coherent<'a, GspMem>,
-    /// MMIO mapping of PCI BAR0, for the doorbell register.
+    /// MMIO mapping of PCI BAR0, for the queue pointer registers.
     bar: Bar0<'a>,
+    /// Number of elements that the driver has written to the command queue, published to the GSP
+    /// through `NV_PGSP_QUEUE_HEAD`.
+    cpu_write_ptr: u32,
+    /// Number of elements that the driver has consumed from the message queue, published to the
+    /// GSP through `NV_PGSP_MSGQ_TAIL`.
+    cpu_read_ptr: u32,
+    /// The GSP's count of consumed commands, as last read from `NV_PGSP_QUEUE_TAIL`.
+    last_gsp_read_ptr: Cell<u32>,
+    /// The GSP's count of posted messages, as last read from `NV_PGSP_MSGQ_HEAD`.
+    last_gsp_write_ptr: Cell<u32>,
 }
 
 impl<'a> DmaGspMem<'a> {
     /// Allocate a new instance and map it for `dev`.
     fn new(dev: &'a device::Device<device::Bound>, bar: Bar0<'a>) -> Result<Self> {
         const MSGQ_SIZE: u32 = num::usize_into_u32::<{ size_of::<Msgq>() }>();
-        const RX_HDR_OFF: u32 = num::usize_into_u32::<{ mem::offset_of!(Msgq, rx) }>();
+        const MSG_SIZE: u32 = num::usize_into_u32::<GSP_PAGE_SIZE>();
+        const ENTRY_OFF: u32 = num::usize_into_u32::<{ mem::offset_of!(Msgq, msgq) }>();
 
         let mut gsp_mem = CoherentBox::<'_, GspMem>::zeroed(dev, GFP_KERNEL)?;
-        gsp_mem.cpuq.tx = MsgqTxHeader::new(MSGQ_SIZE, RX_HDR_OFF, MSGQ_NUM_PAGES);
-        gsp_mem.cpuq.rx = MsgqRxHeader::new();
+        gsp_mem.cpuq.tx = MsgqTxHeader::new(MSGQ_SIZE, MSG_SIZE, MSGQ_NUM_PAGES, ENTRY_OFF);
 
         let gsp_mem: Coherent<'_, _> = gsp_mem.into();
         PteArray::init(io_project!(gsp_mem, .ptes), gsp_mem.dma_address())?;
 
-        Ok(Self { mem: gsp_mem, bar })
+        Ok(Self {
+            mem: gsp_mem,
+            bar,
+            cpu_write_ptr: 0,
+            cpu_read_ptr: 0,
+            last_gsp_read_ptr: Cell::new(0),
+            last_gsp_write_ptr: Cell::new(0),
+        })
     }
 
     /// Returns the region of the CPU message queue that the driver may write to.
@@ -271,7 +283,7 @@ fn new(dev: &'a device::Device<device::Bound>, bar: Bar0<'a>) -> Result<Self> {
     /// region crosses the end of the ring.
     fn driver_write_area(&mut self) -> (&mut [[u8; GSP_PAGE_SIZE]], &mut [[u8; GSP_PAGE_SIZE]]) {
         let avail = num::u32_as_usize(self.free_slots());
-        let w_slot = num::u32_as_usize(self.cpu_write_ptr());
+        let w_slot = num::u32_as_usize(self.cpu_write_ptr % MSGQ_NUM_PAGES);
 
         // Pointer to the first entry of the CPU message queue.
         let data = ptr::project!(mut self.mem.as_mut_ptr(), .cpuq.msgq.data[build: 0]);
@@ -292,14 +304,12 @@ fn new(dev: &'a device::Device<device::Bound>, bar: Bar0<'a>) -> Result<Self> {
         (&mut after_w[..in_after], &mut before_w[..in_before])
     }
 
-    /// Returns the number of command queue slots that the driver may still write.
+    /// Returns the number of command queue slots that the driver may still write: the ring size
+    /// minus the elements that the GSP has not consumed.
     fn free_slots(&self) -> u32 {
-        let tx = self.cpu_write_ptr();
-        let rx = self.gsp_read_ptr();
+        let used = self.cpu_write_ptr.wrapping_sub(self.gsp_read_ptr());
 
-        // One slot always stays empty, so that a full ring and an empty ring differ in their
-        // pointers. `tx` is below `MSGQ_NUM_PAGES`, so the subtraction does not underflow.
-        (rx + MSGQ_NUM_PAGES - tx - 1) % MSGQ_NUM_PAGES
+        MSGQ_NUM_PAGES.saturating_sub(used)
     }
 
     /// Returns the number of bytes that the driver can still write to the command queue.
@@ -310,10 +320,8 @@ fn driver_write_area_size(&self) -> usize {
     /// Returns the region of the GSP message queue that the driver may read, as two slices
     /// because the ring wraps.
     fn driver_read_area(&self) -> (&[[u8; GSP_PAGE_SIZE]], &[[u8; GSP_PAGE_SIZE]]) {
-        let tx = self.gsp_write_ptr();
-        let rx = self.cpu_read_ptr();
-        let avail = num::u32_as_usize((tx + MSGQ_NUM_PAGES - rx) % MSGQ_NUM_PAGES);
-        let r_slot = num::u32_as_usize(rx);
+        let avail = num::u32_as_usize(self.gsp_write_ptr().wrapping_sub(self.cpu_read_ptr));
+        let r_slot = num::u32_as_usize(self.cpu_read_ptr % MSGQ_NUM_PAGES);
 
         // Pointer to the first entry of the GSP message queue.
         let data = ptr::project!(self.mem.as_ptr(), .gspq.msgq.data[build: 0]);
@@ -381,75 +389,63 @@ fn allocate_command<H: FromBytes + AsBytes>(
         })
     }
 
-    // Returns the index of the memory page the GSP will write the next message to.
-    //
-    // # Invariants
-    //
-    // - The returned value is within `0..MSGQ_NUM_PAGES`.
+    /// Returns the GSP's count of posted messages.
     fn gsp_write_ptr(&self) -> u32 {
-        let ptr = MsgqTxHeader::write_ptr(io_project!(self.mem, .gspq.tx)) % MSGQ_NUM_PAGES;
-
-        // ORDERING: LOAD->LOAD ordering needed to order `gsp_write_ptr` read before data read.
-        dma_mb(Read);
+        // ORDERING: `readl` ends in a read barrier, which orders this read before the data reads
+        // that follow it.
+        let ptr = *self.bar.read(regs::NV_PGSP_MSGQ_HEAD).address();
+
+        // A zeroed register is a GSP reset, not a count. No new element is readable until GSP-RM
+        // posts a message and writes the register back.
+        if ptr.wrapping_sub(self.cpu_read_ptr) > MSGQ_NUM_PAGES {
+            return self.last_gsp_write_ptr.get();
+        }
+        self.last_gsp_write_ptr.set(ptr);
 
         ptr
     }
 
-    // Returns the index of the memory page the GSP will read the next command from.
-    //
-    // # Invariants
-    //
-    // - The returned value is within `0..MSGQ_NUM_PAGES`.
+    /// Returns the GSP's count of consumed commands.
     fn gsp_read_ptr(&self) -> u32 {
-        let ptr = MsgqRxHeader::read_ptr(io_project!(self.mem, .gspq.rx)) % MSGQ_NUM_PAGES;
+        let ptr = *self.bar.read(regs::NV_PGSP_QUEUE_TAIL).address();
 
-        // ORDERING: LOAD->STORE ordering needed to order `gsp_read_ptr` read before data write.
+        // ORDERING: the data writes that follow must not pass this read. `readl` orders only the
+        // reads that follow it, so the writes need a full barrier.
         dma_mb(Full);
 
-        ptr
-    }
+        // A zeroed register is a GSP reset, not a count. This returns the last count that it read
+        // until GSP-RM consumes a command and writes the register back. That count undercounts the
+        // free space at worst.
+        if self.cpu_write_ptr.wrapping_sub(ptr) > MSGQ_NUM_PAGES {
+            return self.last_gsp_read_ptr.get();
+        }
+        self.last_gsp_read_ptr.set(ptr);
 
-    // Returns the index of the memory page the CPU can read the next message from.
-    //
-    // # Invariants
-    //
-    // - The returned value is within `0..MSGQ_NUM_PAGES`.
-    fn cpu_read_ptr(&self) -> u32 {
-        MsgqRxHeader::read_ptr(io_project!(self.mem, .cpuq.rx)) % MSGQ_NUM_PAGES
+        ptr
     }
 
-    // Informs the GSP that it can send `elem_count` new pages into the message queue.
+    /// Releases `elem_count` more elements of the message queue to the GSP.
     fn advance_cpu_read_ptr(&mut self, elem_count: u32) {
-        // ORDERING: LOAD->STORE ordering needed to order `cpu_read_ptr` write after data read.
-        dma_mb(Full);
+        self.cpu_read_ptr = self.cpu_read_ptr.wrapping_add(elem_count);
 
-        let rx = io_project!(self.mem, .cpuq.rx);
-        let rptr = MsgqRxHeader::read_ptr(rx).wrapping_add(elem_count) % MSGQ_NUM_PAGES;
-        MsgqRxHeader::set_read_ptr(rx, rptr)
-    }
+        // ORDERING: the data reads must complete before this write releases the slots to the GSP.
+        // `writel` orders only the writes before it, so the reads need a full barrier.
+        dma_mb(Full);
 
-    // Returns the index of the memory page the CPU can write the next command to.
-    //
-    // # Invariants
-    //
-    // - The returned value is within `0..MSGQ_NUM_PAGES`.
-    fn cpu_write_ptr(&self) -> u32 {
-        MsgqTxHeader::write_ptr(io_project!(self.mem, .cpuq.tx)) % MSGQ_NUM_PAGES
+        self.bar
+            .write_reg(regs::NV_PGSP_MSGQ_TAIL::zeroed().with_address(self.cpu_read_ptr));
     }
 
-    // Publishes `elem_count` more pages of the command queue to the GSP and rings the doorbell.
+    /// Publishes `elem_count` more elements of the command queue to the GSP.
+    ///
+    /// The write to `NV_PGSP_QUEUE_HEAD` that publishes them also interrupts the GSP.
     fn advance_cpu_write_ptr(&mut self, elem_count: u32) {
-        // ORDERING: STORE->STORE ordering needed to order `cpu_write_ptr` write after data write.
-        dma_mb(Write);
+        self.cpu_write_ptr = self.cpu_write_ptr.wrapping_add(elem_count);
 
-        let tx = io_project!(self.mem, .cpuq.tx);
-        let wptr = MsgqTxHeader::write_ptr(tx).wrapping_add(elem_count) % MSGQ_NUM_PAGES;
-        MsgqTxHeader::set_write_ptr(tx, wptr);
-
-        // A write to the head register interrupts the GSP. The pointer itself is in the
-        // shared-memory header, so the value written does not matter.
+        // ORDERING: `writel` begins with a write barrier, which orders the data writes before this
+        // register write.
         self.bar
-            .write_reg(regs::NV_PGSP_QUEUE_HEAD::zeroed().with_address(0u32));
+            .write_reg(regs::NV_PGSP_QUEUE_HEAD::zeroed().with_address(self.cpu_write_ptr));
     }
 }
 
@@ -566,19 +562,6 @@ pub(crate) fn new(
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
     /// Sends `command` to the GSP and waits for the reply.
     ///
     /// Events that arrive before the reply are logged and consumed.
@@ -595,6 +578,7 @@ fn calculate_checksum<T: Iterator<Item = u8>>(it: T) -> u32 {
     ///   written to by its [`CommandToGsp::init_variable_payload`] method.
     ///
     /// Error codes returned by the command and reply initializers are propagated as-is.
+    #[expect(dead_code)]
     pub(crate) fn send_command<M>(&self, command: M) -> Result<M::Reply>
     where
         M: CommandToGsp,
@@ -617,6 +601,7 @@ pub(crate) fn send_command<M>(&self, command: M) -> Result<M::Reply>
     ///   written to by its [`CommandToGsp::init_variable_payload`] method.
     ///
     /// Error codes returned by the command initializers are propagated as-is.
+    #[expect(dead_code)]
     pub(crate) fn send_command_no_wait<M>(&self, command: M) -> Result
     where
         M: CommandToGsp<Reply = NoReply>,
@@ -669,9 +654,10 @@ pub(crate) fn send_gmc_no_wait(
     ///
     /// - `ETIMEDOUT` if the event does not arrive within [`Self::RECEIVE_TIMEOUT`] of the call,
     ///   however many other events arrive while waiting.
-    /// - `EIO` if the queue is poisoned, or if a message fails framing or checksum validation.
+    /// - `EIO` if the queue is poisoned, or if a message fails framing validation.
     ///
     /// Error codes returned by [`MessageFromGsp::read`] are propagated as-is.
+    #[expect(dead_code)]
     pub(crate) fn await_msg<M: MessageFromGsp>(&self) -> Result<M>
     where
         // This allows all error types, including `Infallible`, to be used for `M::InitError`.
@@ -689,7 +675,7 @@ pub(crate) fn await_msg<M: MessageFromGsp>(&self) -> Result<M>
     ///
     /// # Errors
     ///
-    /// `EIO` if the queue is poisoned, or if a message fails framing or checksum validation.
+    /// `EIO` if the queue is poisoned, or if a message fails framing validation.
     pub(crate) fn drain(&self) -> Result {
         self.inner.lock().drain()
     }
@@ -701,7 +687,7 @@ struct CmdqInner<'a> {
     dev: &'a device::Device,
     /// Current command sequence number.
     seq: u32,
-    /// Set once a message fails framing or checksum validation. Every later receive fails, since
+    /// Set once a message fails framing validation. Every later receive fails, since
     /// the bad message cannot be skipped. See "Draining the GSP-to-CPU queue" in
     /// `Documentation/gpu/nova/core/interrupts.rst`.
     ///
@@ -742,7 +728,7 @@ fn send_single_command<M>(&mut self, command: M) -> Result
         let (cmd, payload_1) = M::Command::from_bytes_mut_prefix(dst.contents.0).ok_or(EIO)?;
 
         // Fill the header and command in-place.
-        let msg_element = GspMsgElement::init(self.seq, size_in_bytes, M::FUNCTION);
+        let msg_element = GspMsgElement::init(size_in_bytes, M::FUNCTION);
         // SAFETY: `msg_header` and `cmd` are valid references, and not touched if the initializer
         // fails.
         unsafe {
@@ -759,14 +745,6 @@ fn send_single_command<M>(&mut self, command: M) -> Result
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
         dev_dbg!(
             &self.dev,
             "GSP RPC: send: seq# {}, function={:?}, length=0x{:x}\n",
@@ -863,22 +841,19 @@ fn send_gmc(&mut self, command_id: u32, payload: &[u8], max_response_size: u32)
         Ok(())
     }
 
-    /// Wait for a message to become available on the message queue.
+    /// Waits for a message to become available on the message queue.
     ///
-    /// This works purely at the transport layer and does not interpret or validate the message
-    /// beyond the advertised length in its [`GspMsgElement`].
+    /// This validates the queue element header and the lengths that it declares, and does not
+    /// interpret the RPC header that follows it.
     ///
-    /// This method returns:
-    ///
-    /// - A reference to the [`GspMsgElement`] of the message,
-    /// - Two byte slices with the contents of the message. The second slice is empty unless the
-    ///   message loops across the message queue.
+    /// Returns the message's [`GspMsgElement`] and its contents as two byte slices, the second of
+    /// which is empty unless the message wraps around the end of the message queue.
     ///
     /// # Errors
     ///
     /// - `ETIMEDOUT` if `timeout` has elapsed before any message becomes available.
-    /// - `EIO` if the queue is already poisoned, or if the framing or the checksum is invalid,
-    ///   which poisons it (see [`Self::poisoned`]).
+    /// - `EIO` if the queue is already poisoned, or if the framing is invalid, which poisons it
+    ///   (see [`Self::poisoned`]).
     fn wait_for_msg(&self, timeout: Delta) -> Result<GspMessage<'_>> {
         if self.poisoned.get() {
             return Err(EIO);
@@ -901,6 +876,13 @@ fn wait_for_msg(&self, timeout: Delta) -> Result<GspMessage<'_>> {
             )));
         };
 
+        if header.validate_framing().is_err() {
+            return Err(self.poison(fmt!(
+                "RPC element has a bad queue element header, declared length {}",
+                header.length()
+            )));
+        }
+
         dev_dbg!(
             &self.dev,
             "GSP RPC: receive: seq# {}, function={:?}, length=0x{:x}\n",
@@ -909,28 +891,19 @@ fn wait_for_msg(&self, timeout: Delta) -> Result<GspMessage<'_>> {
             header.length(),
         );
 
-        let (slice_1, slice_2) = self.payload_slices(slice_1, slice_2, header.payload_length())?;
-
-        // Validate checksum.
-        if Cmdq::calculate_checksum(SBufferIter::new_reader([
-            header.as_bytes(),
-            slice_1,
-            slice_2,
-        ])) != 0
-        {
+        let Some(payload_length) = header.payload_length() else {
             return Err(self.poison(fmt!(
-                "message with sequence {} has a bad checksum",
+                "RPC message seq# {} declares a message shorter than the RPC header",
                 header.sequence()
             )));
-        }
+        };
 
-        Ok(GspMessage {
-            header,
-            contents: (slice_1, slice_2),
-        })
+        let contents = self.payload_slices(slice_1, slice_2, payload_length)?;
+
+        Ok(GspMessage { header, contents })
     }
 
-    /// Receive a message from the GSP.
+    /// Receives a message from the GSP.
     ///
     /// A message whose function code is `M::FUNCTION` is decoded and returned. Any other message
     /// is logged as an event.
@@ -940,7 +913,7 @@ fn wait_for_msg(&self, timeout: Delta) -> Result<GspMessage<'_>> {
     /// # Errors
     ///
     /// - `ETIMEDOUT` if `timeout` has elapsed before any message becomes available.
-    /// - `EIO` if the queue is poisoned or the message fails framing or checksum validation (see
+    /// - `EIO` if the queue is poisoned or the message fails framing validation (see
     ///   [`Self::wait_for_msg`]), or if the matched message is too short for `M::Message`.
     /// - `ENOMSG` if the message was not the awaited reply.
     ///
@@ -1000,7 +973,7 @@ fn receive_msg<M: MessageFromGsp>(&mut self, timeout: Delta) -> Result<M>
     ///
     /// - `ETIMEDOUT` if no message of type `M` arrives before the deadline, however many other
     ///   messages arrive while waiting.
-    /// - `EIO` if the queue is poisoned or a message fails framing or checksum validation (see
+    /// - `EIO` if the queue is poisoned or a message fails framing validation (see
     ///   [`Self::wait_for_msg`]).
     ///
     /// Error codes returned by [`MessageFromGsp::read`] are propagated as-is.
@@ -1057,7 +1030,7 @@ fn log_event(&self, function: Result<MsgFunction, u32>, seq: u32) {
     ///
     /// # Errors
     ///
-    /// `EIO` if the queue is poisoned, a message fails framing or checksum validation, or a
+    /// `EIO` if the queue is poisoned, a message fails framing validation, or a
     /// message's page count overflows a `u32`.
     fn drain(&mut self) -> Result {
         while !self.gsp_mem.driver_read_area().0.is_empty() {
diff --git a/drivers/gpu/nova-core/gsp/commands.rs b/drivers/gpu/nova-core/gsp/commands.rs
index 00ff3271a46e..24f80c449c13 100644
--- a/drivers/gpu/nova-core/gsp/commands.rs
+++ b/drivers/gpu/nova-core/gsp/commands.rs
@@ -2,8 +2,6 @@
 // SPDX-FileCopyrightText: Copyright (c) 2025-2026 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
 
 use core::{
-    array,
-    convert::Infallible,
     ffi::FromBytesUntilNulError,
     ops::Range,
     str::Utf8Error, //
@@ -13,21 +11,13 @@
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
     gpu::Chipset,
     gsp::{
-        cmdq::{
-            Cmdq,
-            CommandToGsp,
-            MessageFromGsp,
-            NoReply, //
-        },
+        cmdq::Cmdq,
         fw::{
             self,
             commands::{
@@ -36,7 +26,6 @@
                 GspInitResponseSchema, //
             },
             GspGmcMsgElement,
-            MsgFunction,
             GMCAPI_CMD_GSP_INIT,
             GMCAPI_CMD_GSP_SUSPEND, //
         },
@@ -52,175 +41,7 @@
     vgpu::VgpuState, //
 };
 
-/// The `GspSetSystemInfo` command.
-pub(crate) struct SetSystemInfo<'a> {
-    pdev: &'a pci::Device<device::Bound>,
-    chipset: Chipset,
-}
-
-impl<'a> SetSystemInfo<'a> {
-    /// Creates a new `GspSetSystemInfo` command using the parameters of `pdev`.
-    pub(crate) fn new(pdev: &'a pci::Device<device::Bound>, chipset: Chipset) -> Self {
-        Self { pdev, chipset }
-    }
-}
-
-impl<'a> CommandToGsp for SetSystemInfo<'a> {
-    const FUNCTION: MsgFunction = MsgFunction::GspSetSystemInfo;
-    type Command = fw::commands::GspSetSystemInfo;
-    type Reply = NoReply;
-    type InitError = Error;
-
-    fn init(&self) -> impl Init<Self::Command, Self::InitError> {
-        Self::Command::init(self.pdev, self.chipset)
-    }
-}
-
-struct RegistryEntry {
-    key: &'static str,
-    value: u32,
-}
-
-/// The `SetRegistry` command.
-pub(crate) struct SetRegistry {
-    entries: KVec<RegistryEntry>,
-}
-
-impl SetRegistry {
-    /// Creates a new `SetRegistry` command, using a set of hardcoded entries.
-    pub(crate) fn new(vgpu_state: VgpuState) -> Result<Self> {
-        let mut entries = KVec::new();
-
-        // RMSecBusResetEnable - enables PCI secondary bus reset
-        entries.push(
-            RegistryEntry {
-                key: "RMSecBusResetEnable",
-                value: 1,
-            },
-            GFP_KERNEL,
-        )?;
-
-        // RMForcePcieConfigSave - forces GSP-RM to preserve PCI configuration registers on
-        // any PCI reset.
-        entries.push(
-            RegistryEntry {
-                key: "RMForcePcieConfigSave",
-                value: 1,
-            },
-            GFP_KERNEL,
-        )?;
-
-        // RMDevidCheckIgnore - allows GSP-RM to boot even if the PCI dev ID is not found
-        // in the internal product name database.
-        entries.push(
-            RegistryEntry {
-                key: "RMDevidCheckIgnore",
-                value: 1,
-            },
-            GFP_KERNEL,
-        )?;
-
-        if matches!(vgpu_state, VgpuState::Enabled { .. }) {
-            // RMSetSriovMode - required when vGPU is enabled.
-            entries.push(
-                RegistryEntry {
-                    key: "RMSetSriovMode",
-                    value: 1,
-                },
-                GFP_KERNEL,
-            )?;
-        }
-
-        Ok(Self { entries })
-    }
-}
-
-impl CommandToGsp for SetRegistry {
-    const FUNCTION: MsgFunction = MsgFunction::SetRegistry;
-    type Command = fw::commands::PackedRegistryTable;
-    type Reply = NoReply;
-    type InitError = Infallible;
-
-    fn init(&self) -> impl Init<Self::Command, Self::InitError> {
-        Self::Command::init(self.entries.len() as u32, self.size() as u32)
-    }
-
-    fn variable_payload_len(&self) -> usize {
-        let mut key_size = 0;
-        for entry in self.entries.iter() {
-            key_size += entry.key.len() + 1; // +1 for NULL terminator
-        }
-        self.entries.len() * size_of::<fw::commands::PackedRegistryEntry>() + key_size
-    }
-
-    fn init_variable_payload(
-        &self,
-        dst: &mut SBufferIter<core::array::IntoIter<&mut [u8], 2>>,
-    ) -> Result {
-        let string_data_start_offset = size_of::<Self::Command>()
-            + self.entries.len() * size_of::<fw::commands::PackedRegistryEntry>();
-
-        // Array for string data.
-        let mut string_data = KVec::new();
-
-        for entry in self.entries.iter() {
-            dst.write_all(
-                fw::commands::PackedRegistryEntry::new(
-                    (string_data_start_offset + string_data.len()) as u32,
-                    entry.value,
-                )
-                .as_bytes(),
-            )?;
-
-            let key_bytes = entry.key.as_bytes();
-            string_data.extend_from_slice(key_bytes, GFP_KERNEL)?;
-            string_data.push(0, GFP_KERNEL)?;
-        }
-
-        dst.write_all(string_data.as_slice())
-    }
-}
-
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
-pub(crate) fn wait_gsp_init_done(cmdq: &Cmdq<'_>) -> Result {
-    cmdq.await_msg::<GspInitDone>().map(|_| ())
-}
-
-/// The `GetGspStaticInfo` command.
-pub(crate) struct GetGspStaticInfo;
-
-impl CommandToGsp for GetGspStaticInfo {
-    const FUNCTION: MsgFunction = MsgFunction::GetGspStaticInfo;
-    type Command = fw::commands::GspStaticConfigInfo;
-    type Reply = GspStaticInfo;
-    type InitError = Infallible;
-
-    fn init(&self) -> impl Init<Self::Command, Self::InitError> {
-        Self::Command::init_zeroed()
-    }
-}
-
-/// The static GPU configuration, which GSP-RM reports in reply to [`GetGspStaticInfo`].
+/// The static GPU configuration, as decoded from the `GSP_INIT` reply.
 pub(crate) struct GspStaticInfo {
     gpu_name: [u8; 64],
     /// BAR1 Page Directory Entry base address.
@@ -231,30 +52,6 @@ pub(crate) struct GspStaticInfo {
     pub(crate) total_fb_end: u64,
 }
 
-impl MessageFromGsp for GspStaticInfo {
-    const FUNCTION: MsgFunction = MsgFunction::GetGspStaticInfo;
-    type Message = fw::commands::GspStaticConfigInfo;
-    type InitError = Error;
-
-    fn read(
-        msg: &Self::Message,
-        _sbuffer: &mut SBufferIter<array::IntoIter<&[u8], 2>>,
-    ) -> Result<Self, Self::InitError> {
-        let mut usable_fb_regions = KVec::new();
-        for region in msg.usable_fb_regions() {
-            usable_fb_regions.push(region, GFP_KERNEL)?;
-        }
-        let total_fb_end = msg.total_fb_end().ok_or(EINVAL)?;
-
-        Ok(GspStaticInfo {
-            gpu_name: msg.gpu_name_str(),
-            bar1_pde_base: msg.bar1_pde_base(),
-            usable_fb_regions,
-            total_fb_end,
-        })
-    }
-}
-
 /// Error type for [`GspStaticInfo::gpu_name`].
 #[derive(Debug)]
 pub(crate) enum GpuNameError {
@@ -284,7 +81,6 @@ pub(crate) fn gpu_name(&self) -> core::result::Result<&str, GpuNameError> {
 /// # Errors
 ///
 /// - `ENOMEM` if the request or the encoder buffer cannot be allocated.
-#[expect(dead_code)]
 pub(crate) fn build_gsp_init_payload(
     pdev: &pci::Device<device::Bound>,
     chipset: Chipset,
@@ -315,7 +111,6 @@ pub(crate) fn build_gsp_init_payload(
 ///   however many events arrive while waiting.
 ///
 /// Errors from `on_unsolicited_element` and from decoding the reply are propagated as-is.
-#[expect(dead_code)]
 pub(crate) fn gsp_init(
     cmdq: &Cmdq<'_>,
     payload: &[u64],
@@ -388,50 +183,8 @@ fn decode_gsp_init_reply(payload_0: &[u8], payload_1: &[u8]) -> Result<GspStatic
 /// # Errors
 ///
 /// Errors from [`Cmdq::send_gmc_no_wait`] are propagated as-is.
-#[expect(dead_code)]
 pub(crate) fn gsp_suspend(cmdq: &Cmdq<'_>, level: PowerStateLevel) -> Result {
     let params = fw::commands::GspSuspend::new(level);
 
     cmdq.send_gmc_no_wait(GMCAPI_CMD_GSP_SUSPEND, AsBytes::as_bytes(&params), 0)
 }
-
-/// The `UnloadingGuestDriver` command, used to shut down the GSP.
-///
-/// Only used within the `gsp` module.
-pub(super) struct UnloadingGuestDriver {
-    level: PowerStateLevel,
-}
-
-impl UnloadingGuestDriver {
-    /// Creates a new `UnloadingGuestDriver` command for the given [`PowerStateLevel`].
-    pub(super) fn new(level: PowerStateLevel) -> Self {
-        Self { level }
-    }
-}
-
-impl CommandToGsp for UnloadingGuestDriver {
-    const FUNCTION: MsgFunction = MsgFunction::UnloadingGuestDriver;
-    type Command = fw::commands::UnloadingGuestDriver;
-    type Reply = UnloadingGuestDriverReply;
-    type InitError = Infallible;
-
-    fn init(&self) -> impl Init<Self::Command, Self::InitError> {
-        fw::commands::UnloadingGuestDriver::new(self.level)
-    }
-}
-
-/// The reply from the GSP to the [`UnloadingGuestDriver`] command.
-pub(super) struct UnloadingGuestDriverReply;
-
-impl MessageFromGsp for UnloadingGuestDriverReply {
-    const FUNCTION: MsgFunction = MsgFunction::UnloadingGuestDriver;
-    type InitError = Infallible;
-    type Message = ();
-
-    fn read(
-        _msg: &Self::Message,
-        _sbuffer: &mut SBufferIter<array::IntoIter<&[u8], 2>>,
-    ) -> Result<Self, Self::InitError> {
-        Ok(UnloadingGuestDriverReply)
-    }
-}
diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/fw.rs
index ee582cbde5f6..0876e2cb785d 100644
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
@@ -41,15 +35,15 @@
         FbRanges,
         FbSizes, //
     },
-    firmware::gsp::GspFirmware,
+    firmware::{
+        bindata::UcodesImage,
+        gsp::GspFirmware, //
+    },
     gpu::{
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
@@ -62,8 +56,10 @@
 };
 
 /// Maximum size of a single GSP message queue element in bytes.
-pub(crate) const GSP_MSG_QUEUE_ELEMENT_SIZE_MAX: usize =
-    num::u32_as_usize(bindings::GSP_MSG_QUEUE_ELEMENT_SIZE_MAX);
+///
+/// GSP-RM reads this value at run time from the message queue init arguments rather than from a
+/// build-time constant, so the driver chooses it, and this constant is the one copy.
+pub(crate) const GSP_MSG_QUEUE_ELEMENT_SIZE_MAX: usize = GSP_PAGE_SIZE * 16;
 
 /// Empty type to group methods related to heap parameters for running the GSP firmware.
 enum GspFwHeapParams {}
@@ -97,7 +93,7 @@ fn client_alloc_size() -> u64 {
     fn management_overhead(fb_size: u64) -> Result<u64> {
         let fb_size_gb = fb_size.div_ceil(u64::SZ_1G);
 
-        u64::from(bindings::GSP_FW_HEAP_PARAM_SIZE_PER_GB_FB)
+        u64::from(bindings::GSP_FW_HEAP_PARAM_SIZE_PER_GB)
             .checked_mul(fb_size_gb)
             .ok_or(EINVAL)?
             .align_up(GSP_HEAP_ALIGNMENT)
@@ -304,7 +300,6 @@ pub(crate) enum MsgFunction {
     GspInitDone = bindings::NV_VGPU_MSG_EVENT_GSP_INIT_DONE,
     GspLockdownNotice = bindings::NV_VGPU_MSG_EVENT_GSP_LOCKDOWN_NOTICE,
     GspPostNoCat = bindings::NV_VGPU_MSG_EVENT_GSP_POST_NOCAT_RECORD,
-    GspRunCpuSequencer = bindings::NV_VGPU_MSG_EVENT_GSP_RUN_CPU_SEQUENCER,
     MmuFaultQueued = bindings::NV_VGPU_MSG_EVENT_MMU_FAULT_QUEUED,
     OsErrorLog = bindings::NV_VGPU_MSG_EVENT_OS_ERROR_LOG,
     PostEvent = bindings::NV_VGPU_MSG_EVENT_POST_EVENT,
@@ -351,9 +346,6 @@ fn try_from(value: u32) -> Result<MsgFunction> {
             bindings::NV_VGPU_MSG_EVENT_GSP_INIT_DONE => Ok(MsgFunction::GspInitDone),
             bindings::NV_VGPU_MSG_EVENT_GSP_LOCKDOWN_NOTICE => Ok(MsgFunction::GspLockdownNotice),
             bindings::NV_VGPU_MSG_EVENT_GSP_POST_NOCAT_RECORD => Ok(MsgFunction::GspPostNoCat),
-            bindings::NV_VGPU_MSG_EVENT_GSP_RUN_CPU_SEQUENCER => {
-                Ok(MsgFunction::GspRunCpuSequencer)
-            }
             bindings::NV_VGPU_MSG_EVENT_MMU_FAULT_QUEUED => Ok(MsgFunction::MmuFaultQueued),
             bindings::NV_VGPU_MSG_EVENT_OS_ERROR_LOG => Ok(MsgFunction::OsErrorLog),
             bindings::NV_VGPU_MSG_EVENT_POST_EVENT => Ok(MsgFunction::PostEvent),
@@ -371,277 +363,6 @@ fn from(value: MsgFunction) -> Self {
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
@@ -703,72 +424,34 @@ fn id8(name: &str) -> u64 {
     }
 }
 
-/// TX header for setting up a message queue with the GSP.
+/// The msgq version that the driver uses.
+const MSGQ_VERSION_MAJOR: u16 = 2;
+const MSGQ_VERSION_MINOR: u16 = 0;
+
+/// The msgq TX header, which describes a queue to the GSP: the msgq version that the driver uses,
+/// and the queue's geometry. The queue pointers are in BAR0 registers rather than in this header.
 #[repr(transparent)]
 pub(crate) struct MsgqTxHeader(bindings::msgqTxHeader);
 
 impl MsgqTxHeader {
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
+    /// Creates the msgq TX header of a queue of `msg_count` elements of `msg_size` bytes each,
+    /// whose first element starts `entry_off` bytes into the `msgq_size`-byte queue.
+    pub(crate) fn new(msgq_size: u32, msg_size: u32, msg_count: u32, entry_off: u32) -> Self {
         Self(bindings::msgqTxHeader {
-            version: 0,
+            versionMajor: MSGQ_VERSION_MAJOR,
+            versionMinor: MSGQ_VERSION_MINOR,
             size: msgq_size,
-            msgSize: num::usize_into_u32::<GSP_PAGE_SIZE>(),
+            msgSize: msg_size,
             msgCount: msg_count,
-            writePtr: 0,
-            flags: 1,
-            rxHdrOff: rx_hdr_offset,
-            entryOff: num::usize_into_u32::<GSP_PAGE_SIZE>(),
+            entryOff: entry_off,
+            reserved: [0; 3],
         })
     }
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
 }
 
 // SAFETY: Padding is explicit and does not contain uninitialized data.
 unsafe impl AsBytes for MsgqTxHeader {}
 
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
@@ -806,92 +489,87 @@ fn init(cmd_size: usize, function: MsgFunction) -> impl Init<Self, Error> {
     }
 }
 
-/// GSP Message Element.
-///
-/// This is essentially a message header expected to be followed by the message data.
-#[repr(transparent)]
+/// The headers that open an RPC queue element: the queue element header and the RPC header.
+#[repr(C)]
 pub(crate) struct GspMsgElement {
-    inner: bindings::GSP_MSG_QUEUE_ELEMENT,
+    element_header: QueueElementHeader,
+    rpc: bindings::rpc_message_header_v,
 }
 
+// `AsBytes` below requires that no padding separates the two headers.
+static_assert!(
+    size_of::<GspMsgElement>()
+        == size_of::<QueueElementHeader>() + size_of::<bindings::rpc_message_header_v>()
+);
+
 impl GspMsgElement {
-    /// Creates a new message element.
-    ///
-    /// # Arguments
-    ///
-    /// * `sequence` - Sequence number of the message.
-    /// * `cmd_size` - Size of the command (not including the message element), in bytes.
-    /// * `function` - Function of the message.
-    pub(crate) fn init(
-        sequence: u32,
-        cmd_size: usize,
-        function: MsgFunction,
-    ) -> impl Init<Self, Error> {
+    /// Creates the queue element header and the RPC header of a command with a `cmd_size`-byte
+    /// payload.
+    pub(crate) fn init(cmd_size: usize, function: MsgFunction) -> impl Init<Self, Error> {
         type RpcMessageHeader = bindings::rpc_message_header_v;
-        type InnerGspMsgElement = bindings::GSP_MSG_QUEUE_ELEMENT;
-        let init_inner = try_init!(InnerGspMsgElement {
-            seqNum: sequence,
-            elemCount: size_of::<Self>()
-                .checked_add(cmd_size)
-                .ok_or(EOVERFLOW)?
-                .div_ceil(GSP_PAGE_SIZE)
-                .try_into()
-                .map_err(|_| EOVERFLOW)?,
-            rpc <- RpcMessageHeader::init(cmd_size, function),
-            ..Zeroable::init_zeroed()
-        });
 
         try_init!(GspMsgElement {
-            inner <- init_inner,
+            element_header: QueueElementHeader::new(
+                NvdmType::RmRpc,
+                size_of::<RpcMessageHeader>()
+                    .checked_add(cmd_size)
+                    .ok_or(EOVERFLOW)?,
+            )?,
+            rpc <- RpcMessageHeader::init(cmd_size, function),
         })
     }
 
-    /// Sets the checksum of this message.
-    ///
-    /// Since the header is also part of the checksum, this is usually called after the whole
-    /// message has been written to the shared memory area.
-    pub(crate) fn set_checksum(&mut self, checksum: u32) {
-        self.inner.checkSum = checksum;
+    /// Returns the length of the payload that follows the RPC header, or `None` if the queue
+    /// element header declares a message shorter than the RPC header.
+    pub(crate) fn payload_length(&self) -> Option<usize> {
+        self.element_header
+            .payload_len(size_of::<bindings::rpc_message_header_v>())
     }
 
-    /// Returns the length of the message's payload.
-    pub(crate) fn payload_length(&self) -> usize {
-        // `rpc.length` includes the length of the RPC message header.
-        num::u32_as_usize(self.inner.rpc.length)
-            .saturating_sub(size_of::<bindings::rpc_message_header_v>())
+    /// Returns the length of the whole element, both headers included.
+    pub(crate) fn length(&self) -> usize {
+        self.element_header.element_len()
     }
 
-    /// Returns the total length of the message, message and RPC headers included.
-    pub(crate) fn length(&self) -> usize {
-        size_of::<Self>() + self.payload_length()
+    /// Validates the queue element header and that the element is long enough to hold the RPC
+    /// header after it.
+    ///
+    /// # Errors
+    ///
+    /// - `EIO` if [`QueueElementHeader::validate`] fails, or if the declared element length is
+    ///   shorter than the two headers together.
+    pub(crate) fn validate_framing(&self) -> Result {
+        self.element_header.validate().map_err(|_| EIO)?;
+
+        if self.length() < size_of::<Self>() {
+            return Err(EIO);
+        }
+
+        Ok(())
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
+        self.element_header.element_count()
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
 
 /// First word of every queue element: `"MCTP"` in ASCII.
@@ -929,19 +607,19 @@ pub(crate) struct QueueElementHeader {
 
 static_assert!(
     core::mem::offset_of!(QueueElementHeader, magic)
-        == core::mem::offset_of!(r000_00::GSP_MSG_QUEUE_ELEMENT, mctpMagic)
+        == core::mem::offset_of!(bindings::GSP_MSG_QUEUE_ELEMENT, mctpMagic)
 );
 static_assert!(
     core::mem::offset_of!(QueueElementHeader, element_len)
-        == core::mem::offset_of!(r000_00::GSP_MSG_QUEUE_ELEMENT, mctpPayloadSize)
+        == core::mem::offset_of!(bindings::GSP_MSG_QUEUE_ELEMENT, mctpPayloadSize)
 );
 static_assert!(
     core::mem::offset_of!(QueueElementHeader, mctp)
-        == core::mem::offset_of!(r000_00::GSP_MSG_QUEUE_ELEMENT, mctpHeader)
+        == core::mem::offset_of!(bindings::GSP_MSG_QUEUE_ELEMENT, mctpHeader)
 );
 static_assert!(
     core::mem::offset_of!(QueueElementHeader, nvdm)
-        == core::mem::offset_of!(r000_00::GSP_MSG_QUEUE_ELEMENT, nvdmHeader)
+        == core::mem::offset_of!(bindings::GSP_MSG_QUEUE_ELEMENT, nvdmHeader)
 );
 
 impl QueueElementHeader {
@@ -1057,42 +735,42 @@ pub(crate) struct GmcApiHeader {
 
 /// GMC request that carries the system information and registry keys to GSP-RM. GSP-RM answers
 /// it with the static GPU configuration once it has finished starting.
-pub(crate) const GMCAPI_CMD_GSP_INIT: u32 = r000_00::GMCAPI_COMMANDS_GMCAPI_CMD_GSP_INIT;
+pub(crate) const GMCAPI_CMD_GSP_INIT: u32 = bindings::GMCAPI_COMMANDS_GMCAPI_CMD_GSP_INIT;
 
 /// GMC event that requests the driver to run the generic falcon bootloader on the descriptor that
 /// the event carries.
 pub(crate) const GMCAPI_CMD_EXEC_GENERIC_BOOTLOADER: u32 =
-    r000_00::GMCAPI_COMMANDS_GMCAPI_CMD_EXEC_GENERIC_BOOTLOADER;
+    bindings::GMCAPI_COMMANDS_GMCAPI_CMD_EXEC_GENERIC_BOOTLOADER;
 
 /// GMC event that requests the driver to run a Heavy-Secured (HS) binary that GSP-RM has placed in
 /// the framebuffer.
 pub(crate) const GMCAPI_CMD_EXEC_HS_BINARY: u32 =
-    r000_00::GMCAPI_COMMANDS_GMCAPI_CMD_EXEC_HS_BINARY;
+    bindings::GMCAPI_COMMANDS_GMCAPI_CMD_EXEC_HS_BINARY;
 
 /// GMC request for GSP-RM to suspend. GSP-RM sends no response, and reports the completed
 /// suspend in the GSP falcon's `MAILBOX0` instead.
-pub(crate) const GMCAPI_CMD_GSP_SUSPEND: u32 = r000_00::GMCAPI_COMMANDS_GMCAPI_CMD_GSP_SUSPEND;
+pub(crate) const GMCAPI_CMD_GSP_SUSPEND: u32 = bindings::GMCAPI_COMMANDS_GMCAPI_CMD_GSP_SUSPEND;
 
-static_assert!(size_of::<GmcApiHeader>() == size_of::<r000_00::GMCAPI_HEADER>());
+static_assert!(size_of::<GmcApiHeader>() == size_of::<bindings::GMCAPI_HEADER>());
 static_assert!(
     core::mem::offset_of!(GmcApiHeader, command)
-        == core::mem::offset_of!(r000_00::GMCAPI_HEADER, command)
+        == core::mem::offset_of!(bindings::GMCAPI_HEADER, command)
 );
 static_assert!(
     core::mem::offset_of!(GmcApiHeader, size)
-        == core::mem::offset_of!(r000_00::GMCAPI_HEADER, size)
+        == core::mem::offset_of!(bindings::GMCAPI_HEADER, size)
 );
 static_assert!(
     core::mem::offset_of!(GmcApiHeader, sequence)
-        == core::mem::offset_of!(r000_00::GMCAPI_HEADER, sequence)
+        == core::mem::offset_of!(bindings::GMCAPI_HEADER, sequence)
 );
 static_assert!(
     core::mem::offset_of!(GmcApiHeader, max_resp_or_status)
-        == core::mem::offset_of!(r000_00::GMCAPI_HEADER, __bindgen_anon_1)
+        == core::mem::offset_of!(bindings::GMCAPI_HEADER, __bindgen_anon_1)
 );
 static_assert!(
     core::mem::offset_of!(GmcApiHeader, reserved)
-        == core::mem::offset_of!(r000_00::GMCAPI_HEADER, reserved)
+        == core::mem::offset_of!(bindings::GMCAPI_HEADER, reserved)
 );
 
 impl GmcApiHeader {
@@ -1185,6 +863,12 @@ unsafe impl AsBytes for GspGmcMsgElement {}
 // SAFETY: All fields are integer types for which all bit patterns are valid.
 unsafe impl FromBytes for GspGmcMsgElement {}
 
+/// First word of `GSP_ARGUMENTS_CACHED`: `"GSP "` in ASCII.
+const GSP_ARGUMENTS_MAGIC_VALUE: u32 = 0x2050_5347;
+
+/// Flag that requests GSP-RM to place its stack in DMEM.
+const GSP_ARGUMENTS_FLAG_STACK_IN_DMEM: u64 = 0x02;
+
 /// Arguments for GSP startup.
 #[repr(transparent)]
 #[derive(Zeroable)]
@@ -1193,11 +877,21 @@ pub(crate) struct GspArgumentsCached {
 }
 
 impl GspArgumentsCached {
-    /// Creates the arguments for starting the GSP up using `cmdq` as its command queue.
-    pub(crate) fn new<'a, 'b>(cmdq: &'a Cmdq<'b>) -> impl Init<Self> + use<'a, 'b> {
+    /// Creates the arguments for starting the GSP, with `cmdq` as its command queue and
+    /// `state_monitor` as the buffer in which GSP-RM reports its own state.
+    pub(crate) fn new<'a, 'b>(
+        cmdq: &'a Cmdq<'b>,
+        state_monitor: &'a Coherent<'b, [u8; GSP_PAGE_SIZE]>,
+    ) -> impl Init<Self> + use<'a, 'b> {
         let init_inner = init!(bindings::GSP_ARGUMENTS_CACHED {
+            magic: GSP_ARGUMENTS_MAGIC_VALUE,
+            size: num::usize_into_u16::<{ size_of::<bindings::GSP_ARGUMENTS_CACHED>() }>(),
+            flags: GSP_ARGUMENTS_FLAG_STACK_IN_DMEM,
             messageQueueInitArguments <- MessageQueueInitArguments::new(cmdq),
-            bDmemStack: 1,
+            rmStateMonitorBufferArgs: bindings::GSP_ARGUMENTS_CACHED__bindgen_ty_3 {
+                pa: state_monitor.dma_address(),
+                size: num::usize_as_u64(state_monitor.size()),
+            },
             ..Zeroable::init_zeroed()
         });
 
@@ -1221,12 +915,23 @@ pub(crate) struct GspArgumentsPadded {
 }
 
 impl GspArgumentsPadded {
-    pub(crate) fn new<'a, 'b>(cmdq: &'a Cmdq<'b>) -> impl Init<Self> + use<'a, 'b> {
+    pub(crate) fn new<'a, 'b>(
+        cmdq: &'a Cmdq<'b>,
+        state_monitor: &'a Coherent<'b, [u8; GSP_PAGE_SIZE]>,
+    ) -> impl Init<Self> + use<'a, 'b> {
         init!(GspArgumentsPadded {
-            inner <- GspArgumentsCached::new(cmdq),
+            inner <- GspArgumentsCached::new(cmdq, state_monitor),
             ..Zeroable::init_zeroed()
         })
     }
+
+    /// Records where `ucodes` is mapped.
+    ///
+    /// GSP-RM reads the arguments once, when it starts, so a write after that point has no effect.
+    pub(crate) fn set_bindata(this: &Coherent<'_, Self>, ucodes: &UcodesImage<'_>) {
+        io_write!(this, .inner.inner.bindataArgs.radix3, ucodes.radix3_dma_address());
+        io_write!(this, .inner.inner.bindataArgs.size, num::usize_as_u64(ucodes.size()));
+    }
 }
 
 // SAFETY: Padding is explicit and will not contain uninitialized data.
@@ -1247,6 +952,15 @@ fn new<'a, 'b>(cmdq: &'a Cmdq<'b>) -> impl Init<Self> + use<'a, 'b> {
             pageTableEntryCount: num::usize_into_u32::<{ Cmdq::NUM_PTES }>(),
             cmdQueueOffset: num::usize_as_u64(Cmdq::CMDQ_OFFSET),
             statQueueOffset: num::usize_as_u64(Cmdq::STATQ_OFFSET),
+
+            queueElementHdrSize: num::usize_into_u32::<{ size_of::<QueueElementHeader>() }>(),
+            queueElementSizeMin: num::usize_into_u32::<GSP_PAGE_SIZE>(),
+            queueElementSizeMax: num::usize_into_u32::<GSP_MSG_QUEUE_ELEMENT_SIZE_MAX>(),
+
+            // Both alignments are log2 values, which GSP-RM applies as `1 << n`.
+            queueHeaderAlign: 4,
+            queueElementAlign: num::usize_into_u32::<GSP_PAGE_SHIFT>(),
+
             ..Zeroable::init_zeroed()
         })
     }
@@ -1271,7 +985,9 @@ fn new(target: GspDmaTarget, wpr_meta_addr: u64) -> impl Init<Self> {
             bIsGspRmBoot: 1,
             wprCarveoutOffset: 0,
             wprCarveoutSize: 0,
-            __bindgen_padding_0: Default::default(),
+            bInstInSysMode: 0,
+            bIcuEnabled: 0,
+            bScrubCbcSr: 0,
         });
 
         params
@@ -1284,8 +1000,8 @@ impl GspRmParams {
     fn new(target: GspDmaTarget, libos_addr: u64) -> impl Init<Self> {
         let params = init!(Self {
             target: target as u32,
+            reserved: 0,
             bootArgsOffset: libos_addr,
-            __bindgen_padding_0: Default::default(),
         });
 
         params
@@ -1294,6 +1010,9 @@ fn new(target: GspDmaTarget, libos_addr: u64) -> impl Init<Self> {
 
 pub(crate) type GspFmcBootParams = bindings::GSP_FMC_BOOT_PARAMS;
 
+/// Magic value opening the ABI-stable `GSP_FMC_BOOT_PARAMS` header: `"FMC "` in ASCII.
+const GSP_FMC_BOOT_PARAMS_MAGIC: u32 = 0x2043_4d46;
+
 // SAFETY: Padding is explicit and will not contain uninitialized data.
 unsafe impl AsBytes for GspFmcBootParams {}
 // SAFETY: This struct only contains integer types for which all bit patterns are valid.
@@ -1302,6 +1021,8 @@ unsafe impl FromBytes for GspFmcBootParams {}
 impl GspFmcBootParams {
     pub(crate) fn new(wpr_meta_addr: u64, libos_addr: u64) -> impl Init<Self> {
         let init = init!(Self {
+            magic: GSP_FMC_BOOT_PARAMS_MAGIC,
+            size: num::usize_into_u16::<{ size_of::<Self>() }>(),
             // Blackwell FSP obtains WPR info from other sources, so
             // wprCarveoutOffset and wprCarveoutSize are left zero.
             bootGspRmParams <- GspAcrBootGspRmParams::new(GspDmaTarget::CoherentSystem,
diff --git a/drivers/gpu/nova-core/gsp/fw/commands.rs b/drivers/gpu/nova-core/gsp/fw/commands.rs
index 4e6c712637b0..9792cea36770 100644
--- a/drivers/gpu/nova-core/gsp/fw/commands.rs
+++ b/drivers/gpu/nova-core/gsp/fw/commands.rs
@@ -9,16 +9,11 @@
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
     gpu::Chipset,
-    gsp::GSP_PAGE_SIZE,
-    num::IntoSafeCast,
     vgpu::VgpuState, //
 };
 
@@ -38,173 +33,7 @@
 
 use super::bindings;
 
-/// Payload of the `GspSetSystemInfo` command.
-#[repr(transparent)]
-pub(crate) struct GspSetSystemInfo {
-    inner: bindings::GspSystemInfo,
-}
-static_assert!(size_of::<GspSetSystemInfo>() < GSP_PAGE_SIZE);
-
-impl GspSetSystemInfo {
-    /// Returns an in-place initializer for the `GspSetSystemInfo` command.
-    pub(crate) fn init<'a>(
-        dev: &'a pci::Device<device::Bound>,
-        chipset: Chipset,
-    ) -> impl Init<Self, Error> + 'a {
-        type InnerGspSystemInfo = bindings::GspSystemInfo;
-        let pci_config_mirror_range = chipset.pci_config_mirror_range();
-        let init_inner = try_init!(InnerGspSystemInfo {
-            gpuPhysAddr: dev.resource_start(0)?,
-            gpuPhysFbAddr: dev.resource_start(1)?,
-            gpuPhysInstAddr: dev.resource_start(3)?,
-            nvDomainBusDeviceFunc: u64::from(dev.dev_id()),
-
-            // Using TASK_SIZE in r535_gsp_rpc_set_system_info() seems wrong because
-            // TASK_SIZE is per-task. That's probably a design issue in GSP-RM though.
-            maxUserVa: (1 << 47) - 4096,
-            pciConfigMirrorBase: pci_config_mirror_range.start,
-            pciConfigMirrorSize: pci_config_mirror_range.end - pci_config_mirror_range.start,
-
-            PCIDeviceID: (u32::from(dev.device_id()) << 16) | u32::from(dev.vendor_id().as_raw()),
-            PCISubDeviceID: (u32::from(dev.subsystem_device_id()) << 16)
-                | u32::from(dev.subsystem_vendor_id()),
-            PCIRevisionID: u32::from(dev.revision_id()),
-            bIsPrimary: 0,
-            bPreserveVideoMemoryAllocations: 0,
-            ..Zeroable::init_zeroed()
-        });
-
-        try_init!(GspSetSystemInfo {
-            inner <- init_inner,
-        })
-    }
-}
-
-// SAFETY: These structs don't meet the no-padding requirements of AsBytes but
-//         that is not a problem because they are not used outside the kernel.
-unsafe impl AsBytes for GspSetSystemInfo {}
-
-// SAFETY: These structs don't meet the no-padding requirements of FromBytes but
-//         that is not a problem because they are not used outside the kernel.
-unsafe impl FromBytes for GspSetSystemInfo {}
-
-#[repr(transparent)]
-pub(crate) struct PackedRegistryEntry(bindings::PACKED_REGISTRY_ENTRY);
-
-impl PackedRegistryEntry {
-    pub(crate) fn new(offset: u32, value: u32) -> Self {
-        Self({
-            bindings::PACKED_REGISTRY_ENTRY {
-                nameOffset: offset,
-
-                // We only support DWORD types for now. Support for other types
-                // will come later if required.
-                type_: bindings::REGISTRY_TABLE_ENTRY_TYPE_DWORD as u8,
-                __bindgen_padding_0: Default::default(),
-                data: value,
-                length: 0,
-            }
-        })
-    }
-}
-
-// SAFETY: Padding is explicit and will not contain uninitialized data.
-unsafe impl AsBytes for PackedRegistryEntry {}
-
-/// Payload of the `SetRegistry` command.
-#[repr(transparent)]
-pub(crate) struct PackedRegistryTable {
-    inner: bindings::PACKED_REGISTRY_TABLE,
-}
-
-impl PackedRegistryTable {
-    pub(crate) fn init(num_entries: u32, size: u32) -> impl Init<Self> {
-        type InnerPackedRegistryTable = bindings::PACKED_REGISTRY_TABLE;
-        let init_inner = init!(InnerPackedRegistryTable {
-            numEntries: num_entries,
-            size,
-            entries: Default::default()
-        });
-
-        init!(PackedRegistryTable { inner <- init_inner })
-    }
-}
-
-// SAFETY: Padding is explicit and will not contain uninitialized data.
-unsafe impl AsBytes for PackedRegistryTable {}
-
-// SAFETY: This struct only contains integer types for which all bit patterns
-// are valid.
-unsafe impl FromBytes for PackedRegistryTable {}
-
-/// Payload of the `GetGspStaticInfo` command and message.
-#[repr(transparent)]
-#[derive(Zeroable)]
-pub(crate) struct GspStaticConfigInfo(bindings::GspStaticConfigInfo_t);
-
-impl GspStaticConfigInfo {
-    /// Returns a bytes array containing the (hopefully) zero-terminated name of this GPU.
-    pub(crate) fn gpu_name_str(&self) -> [u8; 64] {
-        self.0.gpuNameString
-    }
-
-    /// Returns the BAR1 Page Directory Entry base address.
-    ///
-    /// This is the root page table address for BAR1 virtual memory,
-    /// set up by GSP-RM firmware.
-    pub(crate) fn bar1_pde_base(&self) -> u64 {
-        self.0.bar1PdeBase
-    }
-
-    /// Returns an iterator over valid FB regions from GSP firmware data.
-    fn fb_regions(
-        &self,
-    ) -> impl Iterator<Item = &bindings::NV2080_CTRL_CMD_FB_GET_FB_REGION_FB_REGION_INFO> {
-        let fb_info = &self.0.fbRegionInfoParams;
-        fb_info
-            .fbRegion
-            .iter()
-            .take(fb_info.numFBRegions.into_safe_cast())
-            .filter(|reg| reg.limit >= reg.base)
-    }
-
-    /// Iterates over usable FB regions from GSP firmware data.
-    ///
-    /// Each yielded region is a [`Range<u64>`] suitable for driver memory allocation.
-    /// Usable regions are those that satisfy all the following properties:
-    /// - Are not reserved for firmware internal use.
-    /// - Are not protected (hardware-enforced access restrictions).
-    /// - Support compression (can use GPU memory compression for bandwidth).
-    /// - Support ISO (isochronous memory for display requiring guaranteed bandwidth).
-    pub(crate) fn usable_fb_regions(&self) -> impl Iterator<Item = Range<u64>> + '_ {
-        self.fb_regions().filter_map(|reg| {
-            // Filter: not reserved, not protected, supports compression and ISO.
-            if reg.reserved == 0
-                && reg.bProtected == 0
-                && reg.supportCompressed != 0
-                && reg.supportISO != 0
-            {
-                reg.limit.checked_add(1).map(|end| reg.base..end)
-            } else {
-                None
-            }
-        })
-    }
-
-    /// Computes the exclusive end of the FB physical address space.
-    pub(crate) fn total_fb_end(&self) -> Option<u64> {
-        self.fb_regions().map(|reg| reg.limit).max()?.checked_add(1)
-    }
-}
-
-// SAFETY: Padding is explicit and will not contain uninitialized data.
-unsafe impl AsBytes for GspStaticConfigInfo {}
-
-// SAFETY: This struct only contains integer types for which all bit patterns
-// are valid.
-unsafe impl FromBytes for GspStaticConfigInfo {}
-
-/// Power level requested to the [`UnloadingGuestDriver`] command.
+/// Power level that a `GSP_SUSPEND` request names.
 #[derive(Clone, Copy, Debug, PartialEq, Eq)]
 #[repr(u32)]
 #[expect(unused)]
@@ -252,29 +81,6 @@ pub(crate) fn new(level: PowerStateLevel) -> Self {
 // SAFETY: The single field is an integer type, and the struct has no padding.
 unsafe impl AsBytes for GspSuspend {}
 
-/// Payload of the `UnloadingGuestDriver` command and message.
-#[repr(transparent)]
-#[derive(Clone, Copy, Debug, Zeroable)]
-pub(crate) struct UnloadingGuestDriver(bindings::rpc_unloading_guest_driver_v1F_07);
-
-impl UnloadingGuestDriver {
-    pub(crate) fn new(level: PowerStateLevel) -> Self {
-        Self(bindings::rpc_unloading_guest_driver_v1F_07 {
-            bInPMTransition: u8::from(level.is_power_transition()),
-            bGc6Entering: 0,
-            newLevel: level as u32,
-            ..Zeroable::zeroed()
-        })
-    }
-}
-
-// SAFETY: Padding is explicit and will not contain uninitialized data.
-unsafe impl AsBytes for UnloadingGuestDriver {}
-
-// SAFETY: This struct only contains integer types for which all bit patterns
-// are valid.
-unsafe impl FromBytes for UnloadingGuestDriver {}
-
 /// The host CPU architecture.
 #[derive(Clone, Copy)]
 pub(crate) enum HostArch {
diff --git a/drivers/gpu/nova-core/gsp/hal.rs b/drivers/gpu/nova-core/gsp/hal.rs
index 8c2a8abcb187..b23beb6e2907 100644
--- a/drivers/gpu/nova-core/gsp/hal.rs
+++ b/drivers/gpu/nova-core/gsp/hal.rs
@@ -56,7 +56,6 @@ fn boot<'gpu>(
     /// # Errors
     ///
     /// Errors from loading the bootloader image are propagated as-is.
-    #[expect(dead_code)]
     fn generic_bootloader(
         &self,
         _dev: &device::Device<device::Bound>,
@@ -65,19 +64,6 @@ fn generic_bootloader(
     ) -> Result<Option<GenericBootloader>> {
         Ok(None)
     }
-
-    /// Performs HAL-specific post-GSP boot tasks.
-    ///
-    /// This method is called by the GSP boot code after the GSP is confirmed to be running, and
-    /// after the initialization commands have been pushed onto its queue.
-    fn post_boot(
-        &self,
-        _gsp: &Gsp<'_>,
-        _ctx: &mut GspBootContext<'_, '_>,
-        _gsp_fw: &GspFirmware<'_>,
-    ) -> Result {
-        Ok(())
-    }
 }
 
 /// Returns the names of the firmware files required to boot the GSP of `chipset`, in addition to
diff --git a/drivers/gpu/nova-core/gsp/hal/tu102.rs b/drivers/gpu/nova-core/gsp/hal/tu102.rs
index 32931fd0b7cf..265039b8ff55 100644
--- a/drivers/gpu/nova-core/gsp/hal/tu102.rs
+++ b/drivers/gpu/nova-core/gsp/hal/tu102.rs
@@ -41,7 +41,6 @@
             UnloadBundle, //
         },
         regs,
-        sequencer::GspSequencer,
         Gsp,
         GspBootContext,
         GspFwWprMeta, //
@@ -329,17 +328,6 @@ fn generic_bootloader(
 
         GenericBootloader::new(dev, chipset, imem_size).map(Some)
     }
-
-    fn post_boot(
-        &self,
-        gsp: &Gsp<'_>,
-        ctx: &mut GspBootContext<'_, '_>,
-        gsp_fw: &GspFirmware<'_>,
-    ) -> Result {
-        GspSequencer::run(&gsp.cmdq, ctx, &gsp.libos, gsp_fw.bootloader.app_version)?;
-
-        Ok(())
-    }
 }
 
 /// The TU102 HAL requires the use of the FWSEC bootloader.
diff --git a/drivers/gpu/nova-core/gsp/sequencer.rs b/drivers/gpu/nova-core/gsp/sequencer.rs
deleted file mode 100644
index 250adc9fe74f..000000000000
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
-    libos: &'a Coherent<'a, [LibosMemoryRegionInitArgument]>,
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
-        cmdq: &Cmdq<'_>,
-        ctx: &'a GspBootContext<'_, '_>,
-        libos: &'a Coherent<'a, [LibosMemoryRegionInitArgument]>,
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
diff --git a/drivers/gpu/nova-core/sbuffer.rs b/drivers/gpu/nova-core/sbuffer.rs
index b8c01104c255..f2cb9276b6e8 100644
--- a/drivers/gpu/nova-core/sbuffer.rs
+++ b/drivers/gpu/nova-core/sbuffer.rs
@@ -164,6 +164,7 @@ pub(crate) fn read_exact(&mut self, mut dst: &mut [u8]) -> Result {
     /// Read all the remaining data into a [`KVec`].
     ///
     /// `self` will be empty after this operation.
+    #[expect(unused)]
     pub(crate) fn flush_into_kvec(&mut self, flags: kernel::alloc::Flags) -> Result<KVec<u8>> {
         let mut buf = KVec::<u8>::new();
 
-- 
2.55.0

