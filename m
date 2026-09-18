Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010026.outbound.protection.outlook.com [52.101.193.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1A5E3812DA
	for <nova-gpu@lists.linux.dev>; Fri, 18 Sep 2026 01:07:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789693678; cv=fail; b=WP/GSxPq4aIC7u4gqX4y7j4VEmWMz3uw+xxTZiB6ydCDNyR5UfNEAeZm2pv9RHrW0O21PKyvbBfw8+dvOerpi4LBXOV2xeymDkY5z+n7wNx5Nh8UPBROC5o9ZRy+Iv0PvJsN9FUC1mRXYy37fjol0aFdtoGZpL4hjAHZIDh3GGI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789693678; c=relaxed/simple;
	bh=KEYOzeWcwnB8jmEq/AcMSSP006yQGel0KBE0+wqxyIA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=twAHpLLhnfkesVua3qDleWVo96LlY5t2j7+I4zb2I2JlIQelBn/VPtKw8okq0+Yh9RpC72dFqpzrZgeZtwDcJf6NcgFR3DlYxu6ApLIUPeAn9RBTYPqFtgpn5cTFFiR+sUyugL9JZKK65YtmXkXbIulQTmHbTuAOelQydh8dFwU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=HJVuU9KO; arc=fail smtp.client-ip=52.101.193.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="HJVuU9KO"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j3IwKLVz/PF8Kv4LdjkmheTqc1vdf2s72s1gVbCbrAUp1tAX2ctaC+KLhDFD8l+XR1AveV6gHymNkcoIY40ux/0fOR5XBqYWqpP/JC5xN7P+OTs4eeIQnTS8xn7gWlSoH8mHkuss5Z6h52fB2LNu3j6kozFK6OSoBvHL79RQ0J2Qfv5oKGgRGrz44E4fGaKNJEAdyuFj3b27s7j1RlhjHAXslsIN8hLgFiJgieNjy5gJTZmWILX5Q8+GIK05SzsD3/5jJNZzjY65sFiWH6EsHY2It9UKC+8u43FUeVWZvCBpfS7soKvUUO9eYL0jYzFKRa66VLUzQeVQEQeF658DjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mk+B2m++aURAxjpIvyyv1Uf7HPp5AJrQ9geubYRC/bs=;
 b=s90NoPX9+kIZLCSV4SQUFOBWVUJzwjBPZCauke3+8bqqNePI8LEjioSQLdBGdxu2+UGod/zJDSKh8cLq/VFYX6notTJ5sBIaTPEbDZ+KY8OW2QMpTdKjfYH8l8SCs1FWzIeBrBfZiwpJzPVbI+A6jy68PALFpQGgLRJdl8ZHA4359N6KLRL2gl1TNismGdwhBW73Nw6q67qgluqzni4kkCbCKb8sss6j906vBpBwqLEY8nk0nwnUf+ZC/m0s2NjlLAsS1yYw/dbfjs7TzIqxrbl53VIODp44dN5ogjPvvSuL+a15+D+1vfBVJI01wt4krMG4epn7y6uPunIgrT7cTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mk+B2m++aURAxjpIvyyv1Uf7HPp5AJrQ9geubYRC/bs=;
 b=HJVuU9KOAmGfqgltD1cDcNQNepvhXXWf5KbW/H8Fcyd8LCgI98h4fpBz1TqG6/hwE3/pcMadZxbmhnT251w1R5Y+NYeQRIgO+Cy7LF654c6CQafX3rw2RXU4u1EI0lT76Kli2OnaMsdbqP+HeZ8ecjLLsrKhKrN86w6BZ3Y+0yXAg0mSSp7Oq0PqDfq/UpQan9HXnctH/RGMQcoEZAIK/AzlhPDqi+WYU4xjrESnjU3GaqygZ1tKswFbnErW7DwHs3Tk3UUaXPNjN1SSZa3ui6JkvyTzhjsxjH+SvFRJn2if561bEMAIfnhnpgA8BOY5rEsG2cp8WopwJNks/y+0dg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 DS7PR12MB5888.namprd12.prod.outlook.com (2603:10b6:8:7b::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.13; Fri, 18 Sep 2026 01:07:34 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%4]) with mapi id 15.21.0406.007; Fri, 18 Sep 2026
 01:07:34 +0000
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
Subject: [PATCH v3 08/33] gpu: nova-core: gsp: compute the queue regions from a count and a slot
Date: Thu, 17 Sep 2026 18:06:54 -0700
Message-ID: <20260918010719.1176945-9-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260918010719.1176945-1-jhubbard@nvidia.com>
References: <20260918010719.1176945-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0036.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::11) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|DS7PR12MB5888:EE_
X-MS-Office365-Filtering-Correlation-Id: 68447c43-e299-4abc-5476-08df15213910
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|7416014|376014|1800799024|10067099003|56012099006|6133799003|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	/VAQqDa5QJdDZyuVZ8STxBl94/3HKtj1TJ7nAnwx+GTdaSD/f+c9YUUQ8aTwEbLdEz0N9HGPEA7G95Yv0zOO7O/hiAc4gUKaQ03VH9ptY+pCf/psUk6r9mOAm7AKewbR2MrCzDO7uE6FcuXbnr2BrWLavr5t9M4wY6hB3aBsUSVQ7+veypchvnx6yEgaO6lfTCTJSB4H+zcdquQYnBMp3O+OLRKE1d2XuC/GVcIyCn615Hj7Z8NGkcrEhb/pHdodt0Mmk69PIg4vcP2LuopSmGxjDo9YHqRV2ZvPvpomWniJfCtsWXU7om0yxUmludTnuAPsWqs1PTnIwG8pGnFR463jxXyr6b1h/9oC+3eTliCjuw14l0haoH1UBlvKM14VhsdMoRit5RqWMAwoiA4Yhvz5Q2F28Pn/AIEYKV9h2urvdy5HjFahMW7A+dZgEiQx3M78mUU1xf3d51ygg29a/9d61wOL4V7nsImrfR/ycUCwub9pLKMGKkjXm8yVfL3pBxkvRnyh9o3im7zkvSDRWWHJc8lBUfFaiPY/QphBAWtraw9vfVWx8KMOAwBwX3HV4GSSASHpqRYxJa64vUgoArD21bXVHLjW3k/QXn/OKxwmTpSV1YPHjQLAZYPdMT9UanUU0wqiF4RsfxpzcLSywFPG8nlOxraLi8BsgT5Gpmk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(7416014)(376014)(1800799024)(10067099003)(56012099006)(6133799003)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ZS4M4DXwRSSvjClU+U5obWxvapgkjMfKxh4s6YARja4zd8jMN/woFaDW16n6?=
 =?us-ascii?Q?PHXDoXG2wNlVMHuqIR1yfSGjdefmZxhq+EoXmWVRqUnqdyeW2Cd3LKiDiaLa?=
 =?us-ascii?Q?F83ezxsetgfJT1py7ZC0Q8V4xkiD7ylFJDsonsT+kdwHlpX6pMwaOOZ4+vcv?=
 =?us-ascii?Q?fOjhC3qxRN0BKhsOS8aFIPs5cdvN1aQVS92hN8MfZWewkZogge3Y4RiKlh/Q?=
 =?us-ascii?Q?jufMg1wGDuA1f9jcbayggo4bKjjFt1sdzK7p/br2mIbBBBIRdodsmQ+8kGZ4?=
 =?us-ascii?Q?Nl6AiEL1nZKrlu3/LIRgx3JrBeId17JO1hxBR+mEaDMqX+il+v/mzKlG1+xV?=
 =?us-ascii?Q?pdPnGUEBfDXmvWWCoOduis7K90K6Yr0Z4P5OZyaCELexPf5ftkjupog+Fmz4?=
 =?us-ascii?Q?tzKdE7y8rlwtRK1+XGHDDjsSeNz5Tzq9NxIPmdaMqQZUYfLDz3wArlLzBQKu?=
 =?us-ascii?Q?UoMWZD1Vpu/MJyAtNb7vd9kbBeQ9WvEfRJAZWb1CuR/wqPG4RyxFVdulEj4C?=
 =?us-ascii?Q?ch2Eu3tN7eSdnZ6XPUZMjFGnaaHv0+idU2thK17So32UBCmLxEUvrU1LuY6F?=
 =?us-ascii?Q?uO9zse/M2WafBZam+FiCejatQL8Uq1z3CmBjun7kqWxOXlyO/5TasWZwUExN?=
 =?us-ascii?Q?dWrkvAg6xxvhgd0q1EEBVZ0NADF0lPDn/X2FLE9Ktbt6U8SayLKYg1qc3zKN?=
 =?us-ascii?Q?xoIgkWwtLKcXYdTNoSH4oLQVYLM6CPr2BuyIKgivDygCSCGbShrcMMZs1+CP?=
 =?us-ascii?Q?hHk6sqWTbUsRyUXLWUa5ie5Vps4wgzigOzLLfbRrJHHxi3GLFIks/6fyVrZR?=
 =?us-ascii?Q?ptQPN9XAehJQbgEsh6OvdeSoUyMew5eZLOejPCEtGRe7r0H3RbcTYeNgkrOA?=
 =?us-ascii?Q?ZhcXqGY64YaPmz2BYUeMs4LPuNu/02T5lWpwINRydvNUOaeKvR+zju3QBHV/?=
 =?us-ascii?Q?w/2rRm6aMzwQkX0JuxG4hnH9KwzE8RvV7dsEW6jXguRJSMcUr1fR0i0YJzAn?=
 =?us-ascii?Q?XvD55C5ddGmdC9uXGj2GdF9BefFgX1EgYtTll/Uh/95leIBC5mr0YWJVyrL5?=
 =?us-ascii?Q?ltKF1jbiKck8Y38oVuzVFXg/9ds5tsjwDks8799EuspQuJpt2NwqK+6KKVVw?=
 =?us-ascii?Q?CYHNO++BCbAiwdsvPLzYu0oQf3cV0YKTCA2W8DCllcT+glR4fVMnm74xvnIS?=
 =?us-ascii?Q?QqlU79Ihy6LMgGqp6Leflp1Zq5KHyskpBUUumpelpNPUy8sfW7M3nZK5w+3b?=
 =?us-ascii?Q?EGd37y7gyNKRWzGVcbzTaRrkT/5ytpaQE1VXxP+t3KW2873shlvMl5wAcAKa?=
 =?us-ascii?Q?EJShUiCZxSMrxw8kq/jClqL1X+THj4u/yOFzWq/5U2Y8dg0leXKoQ6AVADGH?=
 =?us-ascii?Q?LSgcmAmGcfYaHG0f9CGVymtlEz2K9gUvPoWYxLuDbbH/LRdo1cfXIyQtuY3k?=
 =?us-ascii?Q?YnfgBuDX7fFUj2pZfr/gKR3bnY/1XG+A5ZxBzphHrDtkiLOV3F9hjBpOW5h1?=
 =?us-ascii?Q?PMjjPKBttUYsyoAz0+nJSiLCdvpRNpDJ3ZNIQP5zZE/MuvXslWio5ZDhxJhZ?=
 =?us-ascii?Q?AEAkD03fJXM+OBmsNUsS4NcjrvCnlObVE+9hPCA12x311chYs82qmHgUkgQi?=
 =?us-ascii?Q?sNYVwes+qFtnZShqJx4nRfMpq9cTPkvb4POeGzJgaLYxopBS4XB/uhzVaSq9?=
 =?us-ascii?Q?AqirncGZHOuMEz2CUbx2wFZauYRTYKnyd0EHT+5Hu+6Acv6G46+PA1oxYkwW?=
 =?us-ascii?Q?yR8qhuvdbg=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68447c43-e299-4abc-5476-08df15213910
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2026 01:07:34.6701
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tgGcdQ+BOILEjDlfrH2SFo4qhnMVhOIQVWvNiqghQyIcV++6qCn5Nr/r93qaM4xRo7KcCjg3PXGWIuiW3GP6zQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5888

The r000 firmware uses msgq v2, the queue layout that keeps the queue
pointers in BAR0 registers as counts that do not wrap at the ring size.
The r570 firmware's layout keeps the pointers in shared memory as
indices into the ring. The two layouts differ in where a pointer is
read and in how the size of the region that the driver may write, and
of the region that it may read, follows from a queue's write pointer
and read pointer. Splitting a region across the end of the ring is the
same in both, and whether a region wraps follows from the order of the
two pointers.

The functions for the writable region and for the readable region each
branched on the order of the write pointer and the read pointer. Each
branch chose where the two slices ended, and the function then built
the slices with open-coded pointer arithmetic. The SAFETY comments
argued the slice bounds branch by branch, so the switch to msgq v2
would have had to rewrite the branches and the argument along with the
pointer rules.

Compute the number of slots in a region and its start slot once, and
split the ring at the start slot. The first slice ends at the end of
the region or at the end of the ring, whichever comes first, and the
second slice carries the rest.

No functional changes.

Assisted-by: LLM
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/gsp/cmdq.rs | 120 ++++++++++--------------------
 1 file changed, 41 insertions(+), 79 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gsp/cmdq.rs
index 80e6e79c5f3c..a1c9b7cce255 100644
--- a/drivers/gpu/nova-core/gsp/cmdq.rs
+++ b/drivers/gpu/nova-core/gsp/cmdq.rs
@@ -262,107 +262,69 @@ fn new(dev: &'a device::Device<device::Bound>, bar: Bar0<'a>) -> Result<Self> {
         Ok(Self { mem: gsp_mem, bar })
     }
 
-    /// Returns the region of the CPU message queue that the driver is currently allowed to write
-    /// to.
+    /// Returns the region of the CPU message queue that the driver may write to.
     ///
-    /// As the message queue is a circular buffer, the region may be discontiguous in memory. In
-    /// that case the second slice will have a non-zero length.
+    /// The ring wraps, so the region comes as two slices, and the second is empty unless the
+    /// region crosses the end of the ring.
     fn driver_write_area(&mut self) -> (&mut [[u8; GSP_PAGE_SIZE]], &mut [[u8; GSP_PAGE_SIZE]]) {
-        let tx = self.cpu_write_ptr();
-        let rx = self.gsp_read_ptr();
+        let avail = num::u32_as_usize(self.free_slots());
+        let w_slot = num::u32_as_usize(self.cpu_write_ptr());
 
         // Pointer to the first entry of the CPU message queue.
         let data = ptr::project!(mut self.mem.as_mut_ptr(), .cpuq.msgq.data[build: 0]);
 
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
         // SAFETY:
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
+        // - `data` points to the `MSGQ_NUM_PAGES` initialized entries of the CPU message queue.
+        // - The returned slices cover the `avail` free slots from the write pointer on, which the
+        //   GSP does not read until `advance_cpu_write_ptr` publishes them.
+        // - `split_at_mut` gives two non-overlapping halves, and the `&mut self` borrow lasts as
+        //   long as the returned slices, so that no other call hands out the same region while
+        //   they live.
+        let data =
+            unsafe { core::slice::from_raw_parts_mut(data, num::u32_as_usize(MSGQ_NUM_PAGES)) };
+        let (before_w, after_w) = data.split_at_mut(w_slot);
+
+        let in_after = avail.min(after_w.len());
+        let in_before = avail - in_after;
+        (&mut after_w[..in_after], &mut before_w[..in_before])
     }
 
-    /// Returns the size of the region of the CPU message queue that the driver is currently allowed
-    /// to write to, in bytes.
-    fn driver_write_area_size(&self) -> usize {
+    /// Returns the number of command queue slots that the driver may still write.
+    fn free_slots(&self) -> u32 {
         let tx = self.cpu_write_ptr();
         let rx = self.gsp_read_ptr();
 
-        // `rx` and `tx` are both in `0..MSGQ_NUM_PAGES` per the invariants of `gsp_read_ptr` and
-        // `cpu_write_ptr`. The minimum value case is where `rx == 0` and `tx == MSGQ_NUM_PAGES -
-        // 1`, which gives `0 + MSGQ_NUM_PAGES - (MSGQ_NUM_PAGES - 1) - 1 == 0`.
-        let slots = (rx + MSGQ_NUM_PAGES - tx - 1) % MSGQ_NUM_PAGES;
-        num::u32_as_usize(slots) * GSP_PAGE_SIZE
+        // One slot always stays empty, so that a full ring and an empty ring differ in their
+        // pointers. `tx` is below `MSGQ_NUM_PAGES`, so the subtraction does not underflow.
+        (rx + MSGQ_NUM_PAGES - tx - 1) % MSGQ_NUM_PAGES
     }
 
-    /// Returns the region of the GSP message queue that the driver is currently allowed to read
-    /// from.
-    ///
-    /// As the message queue is a circular buffer, the region may be discontiguous in memory. In
-    /// that case the second slice will have a non-zero length.
+    /// Returns the number of bytes that the driver can still write to the command queue.
+    fn driver_write_area_size(&self) -> usize {
+        num::u32_as_usize(self.free_slots()) * GSP_PAGE_SIZE
+    }
+
+    /// Returns the region of the GSP message queue that the driver may read, as two slices
+    /// because the ring wraps.
     fn driver_read_area(&self) -> (&[[u8; GSP_PAGE_SIZE]], &[[u8; GSP_PAGE_SIZE]]) {
         let tx = self.gsp_write_ptr();
         let rx = self.cpu_read_ptr();
+        let avail = num::u32_as_usize((tx + MSGQ_NUM_PAGES - rx) % MSGQ_NUM_PAGES);
+        let r_slot = num::u32_as_usize(rx);
 
         // Pointer to the first entry of the GSP message queue.
         let data = ptr::project!(self.mem.as_ptr(), .gspq.msgq.data[build: 0]);
 
-        let (tail_end, wrap_end) = if rx <= tx {
-            // Read area is non-wrapping and stops right before `tx`.
-            (tx, 0)
-        } else {
-            // Read area is wrapping and stops right before `tx`.
-            (MSGQ_NUM_PAGES, tx)
-        };
-
         // SAFETY:
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
+        // - `data` points to the `MSGQ_NUM_PAGES` initialized entries of the GSP message queue.
+        // - The returned slices cover the `avail` slots that the GSP has already written. The GSP
+        //   does not write them again until `advance_cpu_read_ptr` releases them.
+        let data = unsafe { core::slice::from_raw_parts(data, num::u32_as_usize(MSGQ_NUM_PAGES)) };
+        let (before_r, after_r) = data.split_at(r_slot);
+
+        let in_after = avail.min(after_r.len());
+        let in_before = avail - in_after;
+        (&after_r[..in_after], &before_r[..in_before])
     }
 
     /// Allocates a region on the command queue that is large enough to send a command of `size`
-- 
2.55.0

