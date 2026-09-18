Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010026.outbound.protection.outlook.com [52.101.193.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 853D239183B
	for <nova-gpu@lists.linux.dev>; Fri, 18 Sep 2026 01:07:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789693683; cv=fail; b=Ac+712MrR5kNFPKXLYuK8ecnWIIcD6ph2EW1GnhSUDFdU4g3/j834UxHZ9EgTKk83CZNUMeIVejxlmzvuWWN0HdaK7UM+mjrP0bSXs+El3DrXFuFCYrCTyqPlor4eCGe35WP/hWzStClVBYFh0WWxBUxlp+z7cTWP5s74R8y8+g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789693683; c=relaxed/simple;
	bh=iAiBvYvuxgoai4om7MRXT4iTtsIcvmOeaozK6S+PTy4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ZUpsp+8FCCF+7sIgwhzzRWzOSnAqLkQldRf0P7lLTknyuixiUFem+f3PHx0U5PyFr1OqiMZXnnDoADhHMCQ/z3kcn1HqSXrSebKeJZoO2APpL5wP+ZiGH3RPruj9aw3qYaCzNVP8kxfGQwUAcRsbtaD/djuz/uaNMUJ5SOepbNw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=l7K6kFDB; arc=fail smtp.client-ip=52.101.193.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="l7K6kFDB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m/inrGYwcQ1xF6EiSb7GBJxDHSO2hyEK6zQzaoD/9bplgZ5xBCNSxZtuIpSzu48JRh9OtrfgV9AWUKYgRKEe9syFJxZlxDCS2ZA/05c2QyfbRRjT3pjkEEnyxX+lBeWvViAVQSujOCRxdTi/6mfjSVchWwX9rlqcN7qT6FkhmcaqRNHMKOD4mPAuovg4bgBtQS+cEl6pwiZ0L1bC+r0yEi1QaOz1BWc750/x454xluHb1UGD5SNtRkBQYEHIS0Pk4eDn0/jA4eD2+riAYgFnM1Mi3JbkxTcKwOJY49FMjhlNIS7nGXrUugPXlWxgEx6mhXITZBJUKf5oYab+gbbNoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mSDX2NY+G7jOmchBkea9yu8yzaHkEK5NMmO/9MWv4T0=;
 b=Q1gOgKG04Sa7RUOqeNQFZnFzsh7fq3XL4hblNgKo9yDJ3SmKOmSLbeBpzotGZDJ8vLDQzW44agd/9B6w2ThcYfo+aTW3vYADA2ceoP1AkohRvttFdMjcmV8YURL3NCJ4qKzMouDMm98j802HFrCqUk0X4ZzIJ79LjmIiT2vxuJeXMWV3q/rCxMVQnbJfGV3JeUm3WwXAavb7VxkafV2/RdGOZD9aW13ToKlUU7i9IrklhhHusotyCWPAwViKxP9VUG9DtNL1FPn+P9uOzLCWiL3/vz3v5iiM1zfOFYA/jsoj0yUOW9vR02iIr35rrEgofhyNHELQjYYBqLln+Ed7Hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mSDX2NY+G7jOmchBkea9yu8yzaHkEK5NMmO/9MWv4T0=;
 b=l7K6kFDBt+ytFLTkueFS68afopxynhKrU/rW+/mCmU7ECIRoEw+dSwjXlcLxKFFGe+CvTzlyvd+jlUYblZmvfYn/4D/GUO0aj91E0cGBhbZgvpgQ/DTByj6F30bSeBXhnj7dBkJKnQhVpGSDTUN9kB/W+H/vIfGeEeOXvqqFWJEbDEXak/PTchzG2ZnCh3tD2E+RIXeiJ5HZZkGN17JeuCWlTqrdIeVrOYMxzi64MYtIL/iU1DIGXxiVx1UsktiJ2m2D0EWQ6S5mNBuEn4moOFs82n7SiIJOXoBl2hWXCA1+q1LaphxwQ+Ayzjnf7m7+w8HkdkfeOFa+upkk+B5Czg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 DS7PR12MB5888.namprd12.prod.outlook.com (2603:10b6:8:7b::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.13; Fri, 18 Sep 2026 01:07:37 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%4]) with mapi id 15.21.0406.007; Fri, 18 Sep 2026
 01:07:37 +0000
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
Subject: [PATCH v3 10/33] gpu: nova-core: add GMC send path
Date: Thu, 17 Sep 2026 18:06:56 -0700
Message-ID: <20260918010719.1176945-11-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260918010719.1176945-1-jhubbard@nvidia.com>
References: <20260918010719.1176945-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR05CA0043.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::18) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|DS7PR12MB5888:EE_
X-MS-Office365-Filtering-Correlation-Id: 24fe3d69-e79e-4945-92ff-08df15213a96
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|7416014|376014|1800799024|10067099003|3023799007|56012099006|6133799003|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	IsLxLQS0A/QskAqUOiVKweM5PShzVE7NqKwqYAcRvmgiGq7uoYX23rqHMD3VwDZZ69VBNAUYZF4ZYZPGQSBBucJSSD3/DYmTjo8aWgxEHwGIp2V7bKtQjXWSzktI2bFwqU7LHvRnbGj4dUq0rvnAJfNJ8qHfq3j0Rifg4dKLB+4CkrOWStq9PA+pzecBc+zNYKiON7vNVI4BmZRTXmUwne5uQUdS1PFeDdtKp1FYP9bkvQ4je6ttAKMsNomx2eJdPHs9bo1QRS1hMuMI77q+YQrUISlsm6ihKBNp+WDYqjOdjTeCKYEPkc+zilFszWzK3f1yENlOOlW5aNN0wuWKmlJDVRBsgRSpivdTP0EN60uVZaG63eq28bmJKy4p55ZpXQze7h7v8ERa40hgPztC5bZ8IbpEkLOw6QkSAo4+uVJcwxTq1K+mfp5da7oaKdI0Tk7S2dBHLxlRn5dzYXLgEg+iPh4P83MLYv7mfZgRji/4s2/mj64U+fRH+yRJ42IeU5a6DLFI1RR4D2xtYN4hNXANqWdOJpTBGbQAeTsyOxueHZSfQDnjSAmDZp6CqmVJgbD66dVJVeq+1AXCnnEpsw6dDBWbvZdwVDvfSAcalUjJNMj4hAzPkzsZKXD8+Ln5v8PbY7mvv1kqg4De/9vS52DcejZwMcdSjuy8FIys5VI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(7416014)(376014)(1800799024)(10067099003)(3023799007)(56012099006)(6133799003)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Rl0YnXmZ4Ock/9BALivFOW+vPShXxlPnWWwPyM4pDXQjg0pVAoYhBlptMLjc?=
 =?us-ascii?Q?VfHiRYujorW3+RFZ3z7w8nKT3FZpjZdAVVQa+Dn8P6IVT84t+8zrkJnUXshM?=
 =?us-ascii?Q?ellA1IZXvQDZEbkihZeaja9TPuzDzUU+T+SAQHOjtD8C/ZMV65ALsr6fpDIY?=
 =?us-ascii?Q?m0dvubR/mMCYqm6eRipS0bV3XWrZw51LgXFL8807QAm8kWMLfD5r8Bxh8jSX?=
 =?us-ascii?Q?C7ZMqKPuukjgR/hA84inJOiqQgPjUsHyRwIJCKZmvRpfin9Nuxm5m53k7nLb?=
 =?us-ascii?Q?EpoHQ704TlMAd87LyWFbqwtKr2zau/mKp/G0bHGJxx7bBWqrhenNtRmdNe+f?=
 =?us-ascii?Q?X18VXKLIDe6U1T/SY53cIHmd/Pix0ltbPoxxl3IHYxwG/8DW5a47AOadjgD0?=
 =?us-ascii?Q?jykkRrZqjLjvJoJX25ymGKzud1jr5JshtL0QQj3HCoOuqgp/jRqxY4V8KBKn?=
 =?us-ascii?Q?bEfwexnuu83Op0R1P/c1Qdef/Il1kUbMRZtU/xpU53F4nqWHDqTwQ6osCokX?=
 =?us-ascii?Q?rOA6BXEqs0EUXv8IUIibShy9WaxEAbKHZZV5J0+L1D2SPC1dUWrxeKkwnvi7?=
 =?us-ascii?Q?8P904nl7gSkRYLgQfEaHvWJNIySjuy/XGzsKAeUuMgZwyK5UCCFaq+Gf3aX9?=
 =?us-ascii?Q?93mw6b5TATXzN3BbFPJrwE7SZwmlwdr1RhPFyeAdrVRoeHI8D3pbKzPtZWLe?=
 =?us-ascii?Q?yIpXrEpDuIw+ZmoJ9OnDA2npmw7ogQsmNMkr2ait0iJZaue+MWNHwMFHukjQ?=
 =?us-ascii?Q?hSTLig6MNoFSjAe061kCUng9QlJfttlk+x0A4hRLKcX7lUYpHefFyhTQwepM?=
 =?us-ascii?Q?Rf2e89CTFouFfav8SIyJQtpxzwisB6tPQ0McUPQBb1Kh+pguHDi2QDtFRnXy?=
 =?us-ascii?Q?nyoX3CbqEbEnz1OmvqAgnuv9J3XC9pIKcA2apFhjNcsdHAnZ+bgBnsWaciT2?=
 =?us-ascii?Q?qT8yMXLncMMpwnQ27/jaRTIdkX6eLTnzdLZT858gbTBG3lT/1RDpeYcwygeO?=
 =?us-ascii?Q?uGmcjSmqmS1OI7goHMD8VNvspSy36qAYe0NOViFrJtvsvMTDcXXpchDggwK0?=
 =?us-ascii?Q?ou65u1I9I+/vmfDO7DZ2SGyXROkCMNaiEWTrLx60UTOB9wgcC3Q/BsxzmxFS?=
 =?us-ascii?Q?gZPkGU4vwnCcxACFRhp7DcMn9QfgMDooQ9OFU5JA/O9nyVsCBgsgM4mr5qbe?=
 =?us-ascii?Q?Mhhuxi3180pj2TIrs7OG3rXQB5FPXrlbakSEC2Dt9ttjMXqW9kai5JIKn22Y?=
 =?us-ascii?Q?bj1c2BIoEfe6vVpNFQpssk5LmKAywnnEyJunQkPkmMeme46bwnZl9B6R4Ame?=
 =?us-ascii?Q?9KTZrnHImiyCGzNOweH693ZT2dYrzIgOYxfTFWlSUSv9bz+hjao1IIXWHyYU?=
 =?us-ascii?Q?0ArSuT0NOUmtyMGC/svsKOW2OwFPwha3v+nbxrJtVl/RH/hgCJa/D7692H/g?=
 =?us-ascii?Q?QM/VS0OP+nUOzfQ1NL+ZOxJspsQcDrWH1PrpGnC2AMLIBCLuGrKb632APUOn?=
 =?us-ascii?Q?ym4fBr3YthQf+zR+d87qNIC81+Bnmqlk4NO2/wD1qKt2mQf+qVkGUribcPG/?=
 =?us-ascii?Q?UaW9BQazTcNBuin3FaYLkWn4oon5N47YAj4LAnmeBQkehdqFmYV/THjduKvy?=
 =?us-ascii?Q?g+jxNw7ClfrLGHsfgzUylKmhGWcDqTMfgZEjCZjc0WDWZSz++9vPy1ylGTAY?=
 =?us-ascii?Q?PcO+D1GvGSU8eUUzyNZHGD3rc5z3ASClnW3KaPESXc9UqY6TT3VF38Zx/U1s?=
 =?us-ascii?Q?TnLZA/hNBw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24fe3d69-e79e-4945-92ff-08df15213a96
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2026 01:07:37.2544
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JfTwFan1cZjs9XPLFG+6ykHB4XYuwL/oH+h3oXRrw38WXApTpKiek0Xg0G9fDXfPJ9oRdFw6CsoZ5jpv7HG0qA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5888

The r000 boot protocol has the driver send GSP_INIT, the request that
carries the driver's configuration to GSP-RM, as a GMC command. GMC and
RPC commands share the command queue and the RPC sequence counter, and
a GMC element, unlike an RPC element, carries no checksum.

Nova-core's send path filled in RPC elements only, so there was no way
to send a GMC command.

Add a send path for GMC commands. It has no caller yet. A following
patch adds the GSP_INIT sender.

Assisted-by: LLM
Reviewed-by: Timur Tabi <ttabi@nvidia.com>
Reviewed-by: Zhi Wang <zhiw@nvidia.com>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/gsp/cmdq.rs | 43 +++++++++++++++++++++++++++++++
 drivers/gpu/nova-core/gsp/fw.rs   |  1 -
 2 files changed, 43 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gsp/cmdq.rs
index a1c9b7cce255..c0c3d8596b30 100644
--- a/drivers/gpu/nova-core/gsp/cmdq.rs
+++ b/drivers/gpu/nova-core/gsp/cmdq.rs
@@ -54,6 +54,7 @@
     driver::Bar0,
     gsp::{
         fw::{
+            GspGmcMsgElement,
             GspMsgElement,
             MsgFunction,
             MsgqRxHeader,
@@ -749,6 +750,48 @@ fn poison(&self, reason: fmt::Arguments<'_>) -> Error {
         EIO
     }
 
+    /// Sends a GMC API request to the GSP.
+    ///
+    /// `payload` follows the GMC API header in the element, and `max_response_size` is the largest
+    /// response that the caller accepts. The request carries the next sequence number, which GSP-RM
+    /// copies into its response. The number is consumed even if the send fails.
+    ///
+    /// # Errors
+    ///
+    /// Errors from [`DmaGspMem::allocate_command`] are propagated as-is.
+    #[expect(dead_code)]
+    fn send_gmc(&mut self, command_id: u32, payload: &[u8], max_response_size: u32) -> Result {
+        let seq = self.seq;
+        self.seq = self.seq.wrapping_add(1);
+
+        let dst = self
+            .gsp_mem
+            .allocate_command::<GspGmcMsgElement>(payload.len(), Self::ALLOCATE_TIMEOUT)?;
+
+        let msg_element =
+            GspGmcMsgElement::init(command_id, u64::from(seq), payload.len(), max_response_size);
+        // SAFETY: `dst.header` is a valid reference, and not written if the initializer fails.
+        unsafe {
+            pin_init::raw_try_init(core::ptr::from_mut(dst.header), msg_element)?;
+        }
+
+        SBufferIter::new_writer([&mut dst.contents.0[..], &mut dst.contents.1[..]])
+            .write_all(payload)?;
+
+        dev_dbg!(
+            &self.dev,
+            "GSP GMC: send: seq# {}, command_id=0x{:x}, length=0x{:x}\n",
+            seq,
+            command_id,
+            dst.header.length(),
+        );
+
+        let elem_count = dst.header.element_count();
+        self.gsp_mem.advance_cpu_write_ptr(elem_count);
+
+        Ok(())
+    }
+
     /// Wait for a message to become available on the message queue.
     ///
     /// This works purely at the transport layer and does not interpret or validate the message
diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/fw.rs
index 1aca5ca82764..75bc3d66f71f 100644
--- a/drivers/gpu/nova-core/gsp/fw.rs
+++ b/drivers/gpu/nova-core/gsp/fw.rs
@@ -1058,7 +1058,6 @@ pub(crate) struct GspGmcMsgElement {
     size_of::<GspGmcMsgElement>() == size_of::<QueueElementHeader>() + size_of::<GmcApiHeader>()
 );
 
-#[expect(dead_code)]
 impl GspGmcMsgElement {
     /// Creates the queue element header and the GMC API header of a request that carries
     /// `payload_size` bytes of payload.
-- 
2.55.0

