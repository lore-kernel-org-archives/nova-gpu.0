Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010046.outbound.protection.outlook.com [52.101.56.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35ABA30BF70
	for <nova-gpu@lists.linux.dev>; Sat, 22 Aug 2026 01:55:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787363750; cv=fail; b=RLVgxLjKk9R75L9E830IxFIOmUHzWSPE8L+kUPeIdnMKoFsKKGTma1g0iSXww+4Qh0Z4KiPxAyYBsFG829/K6i3IbM9JvfWKAC20aaiRURH4FEwRYfbKDAIh08xOKWpyVHkPv/RB1umisz7oNOI7lNmS/cdxfsRcm6rtp47LdFE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787363750; c=relaxed/simple;
	bh=SL/+xUR2NNMEHHrvUXWkrybuj6KBxbpolfAwLKZZ6LA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=rLArIwqVWUI03vKmv7xpIOR92cslxUJsxxG5WxZCfa79PLDoRCdP1iSK1l7OaBLzO5IxUjfUKMNX1XHbWhjkD2cf4BDbQRiSe6O338zyuWmSv4HAOrlSko5Yja1b0nNOZxNWRK2zMa9+qPGOWbYX8dA07daAhznKAybvaGvGbco=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=KonFf4Hj; arc=fail smtp.client-ip=52.101.56.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="KonFf4Hj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I3+X5qObR7GeraMGNXBAoBhk3RZ1LGFVcMCY0cIYbsDyjyEFtqyARZpV8VXkt8LxqTadA8j9ZZ+eICb/2Fm7zSGY/HZdjY6T7rz8A6OzqQ2FuNT0fiU8zGv1OAOvwER6pkwVZQVOs9r8SfWijPMolPsikVkPO6Kgi8fNtGR7/xz6L+RCds5dNjVVCEAQRzfdVHDaoVBil+4s0rDvnjMIS0CAl4knXhqD7fVIlL2nFxMJMhsq5Rc64GqxMMlA0Uzm4kXYQzNrruZdwQotx5sg7JijEVLcqYEF2P8K5sqnHVeobdkilJmv1PoorGfPWA+BMwHsBj2BFV7yqM+PXLzKiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+XR8YqqSVXL0bVelPByiDnrLQYgDMHotr/JwXgeA52g=;
 b=ImGxUguLTUnxALUpj9PmCNt49vV80QMKymOGNGpF37qHSr+l3bw/TQufK52hWqswM2KSI+01PuInrtS6DAtEY+33+OPdgAiDNT6v016VaF8d1LrJz+HALdA9wMSOPVqm/Jf/gjrEWB6bgfTw0K8xoJZt29Q2s89kFEDrWvQJSZC9yxYNwcOjfrWFKj0SUpaD/6PkC8q04KntzEDKb+HRvxDLvNc2l4IrzH2+HMRdecws3PV//03Z6ZhY5ijhV4ovL2e5NMaqcAP9IxkhQkMzM7E2FKzRoRsf93CiI6JfOri/pzgTppqWE4+9y6FaIr+z9l0zuLuedhz0pJ+aFu5/Mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+XR8YqqSVXL0bVelPByiDnrLQYgDMHotr/JwXgeA52g=;
 b=KonFf4HjciWj8UEHersLkimsobAlT5r6q3X9+i4RnyzvVNh1474wtBF4iY4GvQp9xePk/Z8Yd8V64eAy+wNyaEjcDzaxpgL66CxP1NOucTdbTC7+8YkLhkyEEo6wV0mXs3hPFvmLNa8e7IXZKGryzb2jtxrottoUrV/xSZJDvLm3AnzqUg6jKau2oYkkUQWXsAW1azDFizxWGNl/4SFM7oMjS4EEO9/LTsK3+9GFG0HGHKXW9v9JPhInIfLDAljOWdKWwcG0i3i2cqUSTdLqj3EgzRnxs/3XeqQExO4GXjowcYC0hB8JrLWzFlDMVZQoVg9QwKZEnB+AtqJXaeGJ8A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 MN0PR12MB5834.namprd12.prod.outlook.com (2603:10b6:208:379::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.11; Sat, 22 Aug
 2026 01:55:43 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%4]) with mapi id 15.21.0339.010; Sat, 22 Aug 2026
 01:55:43 +0000
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
Subject: [PATCH v2 16/31] gpu: nova-core: add GMC send path
Date: Fri, 21 Aug 2026 18:54:33 -0700
Message-ID: <20260822015448.238214-17-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260822015448.238214-1-jhubbard@nvidia.com>
References: <20260822015448.238214-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0177.namprd03.prod.outlook.com
 (2603:10b6:a03:338::32) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|MN0PR12MB5834:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f7bee36-98d8-438b-4404-08defff079ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|1800799024|7416014|376014|10067099003|56012099006|3023799007|6133799003|22082099003|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	uGZIbFeX++K7aDx/DscY0Sc1mLw+r13QjOHTazraq63duWElOxUq02vqRSxwTx92dsUQmB17Obgs1IXhaPLzu8/fGxZ0PRy01wRvCk7/scXGi0AxemjM1WPUGQWVEJBn3soaEeruJ0nd1rb9xdcFMKAvzwSc3jY2x3+6zUFBBCryl2fy92opp1JHvKryOiwLMQ1KcXy8RHOY61UFrhYwBEnTOAFADXUWLJG2R4Sf0ilEaCzBAqkphhX2h4mPxTlSKsRrpWYjrNU936KrvRuRXL9dJBEQYzURk/uPT4nsK61CNZMlJNYkNzZHLy7t9D5ZYdtoNZDvbqdL+BfzrAthFFW5zgVYS4SDDU+sxAM5FaB/0FmslJiVkbZYf9ZEmdSATuoHUr0Xdr5nxjcOIVsOwLd1ESBJUxqt1DJUNRyl5vJXxmXGBvpZ+7Ep/5H6PeXufuZLSUVek/zWix4PCeYloYS/SK4zHMyYBsdhj7TmmHiCjFbzkO2NtL6dd8V5runv61/+dqf3eVs/cyj0yrMUXR9y3dsBpX+7UaDdMsNVMLBQt7qNEv/aJBFqYb8ExlzhjmnGISS5OQbrXs9oQuQ1QMO4pzt6TP1N/G6tyrUmT5CiuoZJy5kYB8CLsa+T4tjMnj7ymifhzbD+aK/tk1SEvAQvO/M4+s54EE2LxrSiXFU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(7416014)(376014)(10067099003)(56012099006)(3023799007)(6133799003)(22082099003)(18002099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?dTsTY0R8PGpWUNzdWtVOn3kktGzEXT9uLR4E3j9A6Xsv9uUA/PAIwgjH3wS6?=
 =?us-ascii?Q?515yHHXVO9UYPqsGEpzpEQUdhijxo6lht2QHsj8V4SehVj74ELAZNkJfvx/M?=
 =?us-ascii?Q?dYk+dFh/nSxWdeSs3cn+CZUy+GhJ0//7ekCYt+LRlXooRCeUcMH/BJQGSn7K?=
 =?us-ascii?Q?/qRRM58HbU4vE4jtM+cj+dvLsPW+Kx+nb6rHhEo0vd/EwRBnK5MchzXgnQvJ?=
 =?us-ascii?Q?rpbCVyU1wgqfiBeMfDb4N8QnpBn4cEkQJ7F/jj+WrQSmbHTqxRaiPzdZFMvg?=
 =?us-ascii?Q?LhbS2tpk6/u7hk8uD2sS6kq9VfQJbtvOegx5zKb102GeId/hGsojFVpTCtFY?=
 =?us-ascii?Q?rwi53Vu4l2Ux4GqZYHIEXZHbhBg8VJlHFKy4bOXX9M97DgC+z0SPHAvffmra?=
 =?us-ascii?Q?GcdAdQbbaX5NsEiWJBFiQr68kpcNSiTyE3BTcjRJ0UEsiP4qQZIBh1zXyVv0?=
 =?us-ascii?Q?2zRoS4OAp8ZTv65AyG8y36ab8MdiMobNylo0tSskXziZIo2/9oNkLtx4Ht91?=
 =?us-ascii?Q?iV8S4V+MfLwInTVgInDfDFe0t8p57R+tmUxITWl5a+wgKY0unnBn29N1gIXv?=
 =?us-ascii?Q?XEQSz1cMAMdjRtUUhgLY08c0eouzN7bhkZtZBYkCILrJGbHsTw3EKV9InzSb?=
 =?us-ascii?Q?dEHzacVOG9W57JT7iLTunITACFrpL9uXZLCqjYCeqz6ZX3O4GqDtnOBX0JKl?=
 =?us-ascii?Q?0EoqtO5HZOWxP4AoWxRF5wUv64gLd3BxRCUcmDd/srli7JjMNG9VkMXtD2+M?=
 =?us-ascii?Q?al13U8IKkZBAF3qlrn0P04NAdNXrEVsty4hM7wrTxOlgdP8iek+JXfRYRflk?=
 =?us-ascii?Q?hf/siU63REyNVeNzjPkITu/7dfE6Q2+jI2ydzRgofTfnp+dRdFu/nCmIrvVZ?=
 =?us-ascii?Q?cDjJpUQeeU/mjSkNPLd0Wzitck3z8X94k9pW/iMPpw5dqz8Rp/eVhHvq6D7R?=
 =?us-ascii?Q?AQPP9qf0Mxkq40ZMyKfhqqm6D9d0wu5MfyHTq5iTcWMUYgzMi+y0dwO3VwFq?=
 =?us-ascii?Q?tBWDnIVg0KCk14mjpDnm7ymAvJB5p17X+XhsKpshUtTnFo64j9wmaHLMZRNA?=
 =?us-ascii?Q?y0R9HvEey1sfChgOUZnvMSt5d1VGrCQlF1QeEYuNm6n3NvqYL6+JcA5/B4le?=
 =?us-ascii?Q?FxetHg1MruYDqSN2TzO9d0yTdnO8W4IoEK3By/mDG9g6Q/K9xr9tFHM+i6DW?=
 =?us-ascii?Q?DX0waHS7pZypzWLid6c0+trb9Nu8QIP6gi51d7PuE7vh5KM3+aveqKA+5dd7?=
 =?us-ascii?Q?XSroeh8OMXjrNt2TlDSsQrDYN6BIMGJ6xaikaqJ5WxNdoe6fcR/f+9rIlg7X?=
 =?us-ascii?Q?FUr0mG4Zjc2EA9LD29e2kHMxUQOy7f5pFwUr+FJ96Ifi3FiXrpaSK5YG184w?=
 =?us-ascii?Q?3lQDDBnSTazY1AzzLroBjCYIsgc1/o0w99Penp6fa7977grfAYn9sKTjDblT?=
 =?us-ascii?Q?x1GdCwGCGpYAyUjBm8FZgE74/9FxFKvLh+x0SJonX9V8GlJZElbXoozWUDst?=
 =?us-ascii?Q?rVNPnEN2nn54toXfLhszvK59+oQYlsTnrPrzbBHRMeqTUTkocxedgY0ZU+mF?=
 =?us-ascii?Q?m47MhMQfZLNW9PTDhWgDivbR38Sb8aMSWF26uDk/TQ+HvIPTWuXurzEjyLuA?=
 =?us-ascii?Q?7P4Gr3mxHo3xezp51OE4Rm5/OdQX2BtHerkdjFt2Nli6qVYup9iq9w8YK2JY?=
 =?us-ascii?Q?swFMs2zJz4ZX9Bv9sl8KHGGTtZ1SWEn9Mt6dKW6Rk4VKFDs8hiIX6lS2UaAr?=
 =?us-ascii?Q?RrmBZJ3Ybg=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f7bee36-98d8-438b-4404-08defff079ec
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2026 01:55:43.7544
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c/Ax+F5upKnfJI5I7v+zWbJolcYNHP6bjvSeuVkq2vxqSU+i17YSxHJMGorUNs2ndiGS166aN2BPpX/SIW0rTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5834

The r000 GSP-RM boot protocol requires the driver to send GSP_INIT as a
GMC command. GMC and RPC commands share the command queue and sequence
counter. GMC queue elements carry a GMC API header and no checksum.

Add the GMC send path needed for GSP_INIT.

Assisted-by: Cursor:claude-opus-5
Reviewed-by: Timur Tabi <ttabi@nvidia.com>
Reviewed-by: Zhi Wang <zhiw@nvidia.com>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/gsp/cmdq.rs | 59 +++++++++++++++++++++++++++++++
 drivers/gpu/nova-core/gsp/fw.rs   |  1 -
 2 files changed, 59 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gsp/cmdq.rs
index babec37716b5..6470b1b673b6 100644
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
index 2b938802495c..2d7ea46332e6 100644
--- a/drivers/gpu/nova-core/gsp/fw.rs
+++ b/drivers/gpu/nova-core/gsp/fw.rs
@@ -1036,7 +1036,6 @@ pub(crate) struct GspGmcMsgElement {
         == core::mem::offset_of!(r000_00::GSP_MSG_QUEUE_ELEMENT, nvdmHeader)
 );
 
-#[expect(dead_code)]
 impl GspGmcMsgElement {
     /// Creates a new GMC message element.
     ///
-- 
2.55.0

