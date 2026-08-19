Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012060.outbound.protection.outlook.com [40.93.195.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79C103C10A8
	for <nova-gpu@lists.linux.dev>; Wed, 19 Aug 2026 03:53:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787111585; cv=fail; b=bLQH4likjC/YahK93xMmSD/K2QZghT+FNafGFo0JfkJ8hRUD3r9VXozHl4JKHOWlyL28v8txF7bXBhZb45phwMa4ddajaDu5hCFQeE1jwkeD+03H0xMwdpXXvo8q4r56dk55hsrSPZ+phINmZUKDTlCVYq62Fqz8EPUVRNnyx4E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787111585; c=relaxed/simple;
	bh=upTNKMwaiaW1sjhq/a6d1vJ/eI6GlepTYbe/ELp+hAA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=KrZxnszyoAro3t7Hq2ZfcCLuKaPiU/P8U0h3ol2KFomOY6uoz4dpSxnNDeY8/PMbkKFT1rgSeJ5wrlzeVL1x+OGwZBeSNB2VW3wCodujFY/UhQSQDsxMkesP5HVuXczCvJWiM6FEh1ZsSKgSf46KgQj8ZOvjpJ+XtkUWszgaqX8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=UVgEMtOT; arc=fail smtp.client-ip=40.93.195.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="UVgEMtOT"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xvnMws/AKIOZJHAAZtRiwhPJFVvaZg0iw4bilbolNGMIneZ31f+E/3uaNzoq3tX1KrxQZoviu2plNC3jZ1D0qo0PvWGtOu9B3C9ju9t5Ta2jz3LoZBFrBbNbEekzrU6PhuREvUyE07ZfiX+nC8dVaXg8pxqcBO+Lezh43al+XqcQvS2SBLtfjBQ4yG91tq8/qvIIUeYn/TOV+amm6QaTi4NsYBlCc64+dacGKvYDO2akIkTfUJaRPO3YbZDd4eMGvZdSdPz9nTsqc+GXL1/M91wNqmeoNZZJM6mMTxDR6yLMbSl3MitOpYrbcXi1GZJ3/xp0+tJ9672bHgYafRLipA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DBcMpB71ipGqcyWxdrgE3yAiPCZ3/nDy2kEUJ2g0raI=;
 b=RUwdnFT5HUMblWSF6yMSbMI8ZOJzFABAAwWbn9O8XcorkMGKfin7iZFHgIwLxEogjHP4QyXL9/dsitKWI6qKP+AmrakATk0AX/GjiSxT/mNVEs3z4C5emtkFurOEoZrLStynii3tC1AvVKUsASsN+3cm8Ca2NqNL+J1xaGVp1KiIGRDp8btuqaXrDcOs3raw4FIVEcjp9lihWW0vNcP+8skdmdID/bgDjmFe8VFRKoaMzh+0BMZDuEpINP+FIoG9z+dFCVzbevkDQ53eZbwrzf0dvUgOGFrsh3ihbSvE2jKAsfChp4yLEEIrtSJDOYNnSbrnKafMRLqE6Vv7uC2/7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DBcMpB71ipGqcyWxdrgE3yAiPCZ3/nDy2kEUJ2g0raI=;
 b=UVgEMtOTQW5e1H8JlIcIn8BMXUiT1F7Z/go1A2Xyng4E18rdvCYhrbZN9W6dV1NpC7axjtHNKsX8L4Lppdp7IKcV9v0UoDstm85CITKdF/7O+cMnvO5SPzZXOTr+RQvCVyIQT1dTlh4IyTuimeHEOhRccc0GNMpR3tIys7Re0BlwNS7ptjK+U4qXvEDxTUnukQzPLPp/k7JxVkGgSIi9ng0lpQTTiEeK8aas7Ox1YIZU3wUYZHZhudKSLqTHqoDerI3fRPXmOuyomx3xltGlNZkkMgZ3y4I/uRyR3y2S3u9m3Ek76LPglhv6Pl83yLBvvDX6bE8+IHkCN+MheCm4pw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 DS7PR12MB6287.namprd12.prod.outlook.com (2603:10b6:8:94::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.315.17; Wed, 19 Aug 2026 03:52:40 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%4]) with mapi id 15.21.0339.007; Wed, 19 Aug 2026
 03:52:40 +0000
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
Subject: [PATCH 15/27] gpu: nova-core: add GMC send path
Date: Tue, 18 Aug 2026 20:52:08 -0700
Message-ID: <20260819035221.336390-16-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260819035221.336390-1-jhubbard@nvidia.com>
References: <20260819035221.336390-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0160.namprd03.prod.outlook.com
 (2603:10b6:a03:338::15) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|DS7PR12MB6287:EE_
X-MS-Office365-Filtering-Correlation-Id: 3649a9bb-f8d0-4368-e771-08defda550d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|7416014|23010399003|366016|6133799003|3023799007|56012099006|10067099003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	ZwpM7I5GKQ/14gZPPJKrDzxBmrZhhxdh+tNNQGPpNbw0tzbJKF71eYYzYwZeeaFqDO+FeyWrRObIlWjNBjc5PZpX4HPqWbX8aOfQZm1y4VvbQG2PjUq0fYP3WOoSHfKCr1OgusK33UJfCpccc5eMBMboagO4yPovyuu9VLmC/bu9Du7+tJR+uGXFr6WKK9TyKpv8E3owBy2J44nl1evhl7XBlQQzXQw5tT+oX8rUHsBpd5Jw8cnAHDdx2PPb2YpPqArpFSemsZGS56DwkC7mii4s01UPqUIvhlw0AFzh+ZvPQWeE2BiAnWfepsvLQcgtAzMUngb8PAQOvbo+E1uQ+eDgGxVHfWlrc52QUbJ7nQMy5kci/utcxySZRcqpxVr8IdvD4JIh1EI2NwpnY6kxERSqVqUBlSp9yXoWy5OT64VSO4MtezitUNF7AdTBZPNH2zB2uJ6jr5juOeccgSLL96XbO4DJ3tltlOICAa90hnflyAkFrAozvF6+4pt9V8o2fh3TFg4oZrUk8cbvKnbUmBswkAL8FlI7TkwcCSZOPr+yeWwkcT0JxGXajfFyR0rVvW94KPNea/G9C28l/Be7Rsr8nUkIBxbCoqDx7pDiidE1JHoz8QgcnUJyoxQCL4SlHYECyEXjhlmS9nRNhIQCQ6MOulfT2UxyQEBbZS7O8DQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(23010399003)(366016)(6133799003)(3023799007)(56012099006)(10067099003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?4KXHzI/xXczqMOznS6uOd3v7LYipjzjnz6qjYavZsviFf9tx1BwFve0Njaw+?=
 =?us-ascii?Q?ucWDa3H3PQIHQujHdiYyVFyiZek+ln+vBidpl22DiT9oEOVh1WS6qNDPmCKY?=
 =?us-ascii?Q?GMCAMPTP1ZiX9AiVE4VesOEwt2+tU9Rl2Gb44g6F1drIBnsto5jKPfkynh+g?=
 =?us-ascii?Q?Vyv3QMDVKW4TSIbEGeOqnUENHJ7+RcgcuauBZwUm1f2oVILWE9XthJhhBk/b?=
 =?us-ascii?Q?70ah6rJiHhFFGIY2g9Mta01JZcXggUmgDxa8TC3yikKBnKpJYU8AM7Yg8MlI?=
 =?us-ascii?Q?4pt1gnr4GZxnU3+b9UXjj/uRoXH2Ks/A3hsDhioycx6TzVtK+Sqr19bEBGQs?=
 =?us-ascii?Q?/pqCmjrOw4/AlaYVhuvQdvHoWWBIvDv9QmiyAy/M4F1Wf3MMTzr2flo4egQ/?=
 =?us-ascii?Q?okWa59xAQXfyWE2S3x1JZ9ilHk68Fdf5aWKlYPQ6sCPnk/MBA4jUGGa+CYKz?=
 =?us-ascii?Q?fo8DKiJ9aSJpZI59+3gbCyX5KaUgm4AfLopVbblBbx7ktdPQtrS57qpnAc8c?=
 =?us-ascii?Q?X6c91uNY0F0lRXGI7M0c+tQNjHqluXlUkvqTqOlMAncKHsgv1x1dg+oJjq3F?=
 =?us-ascii?Q?6vjKscmck9ZFxRDi+alxB+tM84WD2oTwicVqe/lrCBRdBnWvx9Pq2JLrRufT?=
 =?us-ascii?Q?OS1xniVIXscP5sMZBpu8uT88fkPkVIYr8X2nQqE1sWLdFpqkHG4eqM1iB5q6?=
 =?us-ascii?Q?1V6o35Gjfcf/kK1MLC3M9gOVqxod/8613eNeeZVMWGw7B8M1+7foWV+Ezkje?=
 =?us-ascii?Q?OJiIU5DlP69qhYWrNiApA3VfWDNgLJO5l3qz6xXY6VxS+XXTNmgv7hcsf+j9?=
 =?us-ascii?Q?tASnY/0B1C14FqvxWFk2e7Tk4XdDCOJjO+qrsuZrOwJ4sK1ykOx4+rX4sK5/?=
 =?us-ascii?Q?uCeEV6pqBI/GWPjKG/gzY1/lzAgTsS8MbpsM0+Dip7k3ayigrti/4JAkW4YZ?=
 =?us-ascii?Q?qVSvCjinY5K3SOBvFyKE3Tk97SVdX/XvFRN/wOHNiDdIy77wfGutYNMmcqQQ?=
 =?us-ascii?Q?1Qc7DwyamGegB2816762aSiOyg0z0tQwBtWaQzFkXZwfGp2KTq+q5bcVJaRM?=
 =?us-ascii?Q?2BvFt2edCC8+RS+poHlTP+cjOYm7kLyi3rllhSLLYI3hTeU0f4g5vSR+xsTa?=
 =?us-ascii?Q?ckb/LzyNTybdUAoIWafY2RaD5Hgffqi+gofO9ur3dqQcV9XdwPWNXHublwMk?=
 =?us-ascii?Q?SaWtzw4W0qzRxJIzjKqgI3Y3BxO6yatjIFLTufd2guUmIorbq7wFJGKqwnkq?=
 =?us-ascii?Q?dKWrcCsWq3fj+B8SxTMXP59DwtYr082efGdDzFOX93itcSTxYMSHkdSa5e1R?=
 =?us-ascii?Q?tGrpugJ4SRo6Injr7+NcH0FVSjsCaOeuwN2bVxN624Iiyh2cZ+gQHkbcqlUh?=
 =?us-ascii?Q?hqH5iRt0rhuO7WjWzxTUiSgIw4xDYBKbJ3qf1JqnP1vcge5b4lyssBHvj+5l?=
 =?us-ascii?Q?pt47ZZTZfDlEdR6IiWMOyaPDn3WOLofhCs319mnqXHOEBn0MvqSAh5o6Fjy0?=
 =?us-ascii?Q?iUfRi1M75QnDm0xcvlPkMHGxyOf4EK33FpGv/e3wqXFPQUE8fD+77vPRE+O/?=
 =?us-ascii?Q?wcgUHDjBAmQ8gfsm1KPJAvXgdbe6XxjMaelASfe/WEuAPS2XpNP58M6Bl5x0?=
 =?us-ascii?Q?ukbQHtS5gG3vifKSM/61jnEm8SPqt1ewVT9qXJ2zOeehJbHZ6mrGTEgH9y5L?=
 =?us-ascii?Q?WbUY+Ayz+R/G2SU8yY/iw6RA5AgMgs8wck7f2WgP0H9Xyrxxo8JcIVlB7if1?=
 =?us-ascii?Q?0+4sjwWP8g=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3649a9bb-f8d0-4368-e771-08defda550d6
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2026 03:52:40.2610
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hJbRj1URe+DLbWUCyEJAt3OVclpQC20V5VGciwt9om7f4++df+AqERsdvL1ZpwsWPGRWWkucuh88ULfhy7m0Vg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6287

The r000 GSP-RM boot protocol requires the driver to send GSP_INIT as a
GMC command. GMC and RPC commands share the command queue and sequence
counter. GMC queue elements carry a GMC API header and no checksum.

Add the GMC send path needed for GSP_INIT.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/gsp/cmdq.rs | 59 +++++++++++++++++++++++++++++++
 drivers/gpu/nova-core/gsp/fw.rs   |  1 -
 2 files changed, 59 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gsp/cmdq.rs
index 0dab3d279426..88b143c6a7b7 100644
--- a/drivers/gpu/nova-core/gsp/cmdq.rs
+++ b/drivers/gpu/nova-core/gsp/cmdq.rs
@@ -52,6 +52,7 @@
     driver::Bar0,
     gsp::{
         fw::{
+            GspGmcMsgElement,
             GspMsgElement,
             MsgFunction,
             MsgqRxHeader,
@@ -963,6 +964,64 @@ fn send_command<M>(&mut self, bar: Bar0<'_>, command: M) -> Result<u32>
         Ok(rpc_seq)
     }
 
+    /// Sends a GMC API command to the GSP.
+    ///
+    /// `command_id` is the GMC command identifier (from `GMCAPI_COMMANDS`).
+    /// `payload` is the command-specific data following the [`super::fw::GmcApiHeader`].
+    /// `max_response_size` is the maximum expected response payload size.
+    ///
+    /// The command carries the next RPC sequence number, which the GSP echoes in its response.
+    /// The number is consumed whether or not the send succeeds.
+    ///
+    /// # Errors
+    ///
+    /// - `EMSGSIZE` if the command exceeds the maximum queue element size.
+    /// - `ETIMEDOUT` if space does not become available within the timeout.
+    /// - `EIO` if the command header is not properly aligned.
+    #[expect(dead_code)]
+    fn send_gmc(
+        &mut self,
+        bar: Bar0<'_>,
+        command_id: u32,
+        payload: &[u8],
+        max_response_size: u32,
+    ) -> Result {
+        let rpc_seq = self.rpc_seq;
+        self.rpc_seq = self.rpc_seq.wrapping_add(1);
+
+        let dst = self
+            .gsp_mem
+            .allocate_command::<GspGmcMsgElement>(payload.len(), Self::ALLOCATE_TIMEOUT)?;
+
+        let msg_element = GspGmcMsgElement::init(
+            command_id,
+            u64::from(rpc_seq),
+            payload.len(),
+            max_response_size,
+        );
+        // SAFETY: `dst.header` points to a valid, writable `GspGmcMsgElement` region.
+        unsafe {
+            msg_element.__init(core::ptr::from_mut(dst.header))?;
+        }
+
+        SBufferIter::new_writer([&mut dst.contents.0[..], &mut dst.contents.1[..]])
+            .write_all(payload)?;
+
+        dev_dbg!(
+            &self.dev,
+            "GSP GMC: send: seq# {}, command_id=0x{:x}, length=0x{:x}\n",
+            rpc_seq,
+            command_id,
+            dst.header.length(),
+        );
+
+        let elem_count = dst.header.element_count();
+        self.gsp_mem.advance_cpu_write_ptr(elem_count);
+        Cmdq::notify_gsp(bar);
+
+        Ok(())
+    }
+
     /// Wait for a message to become available on the message queue.
     ///
     /// This works purely at the transport layer and does not interpret or validate the message
diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/fw.rs
index 050a6af8c0c7..56f255a3d49c 100644
--- a/drivers/gpu/nova-core/gsp/fw.rs
+++ b/drivers/gpu/nova-core/gsp/fw.rs
@@ -1016,7 +1016,6 @@ pub(crate) struct GspGmcMsgElement {
         == core::mem::offset_of!(r000_00::GSP_MSG_QUEUE_ELEMENT, nvdmHeader)
 );
 
-#[expect(dead_code)]
 impl GspGmcMsgElement {
     /// Creates a new GMC message element.
     ///
-- 
2.55.0

