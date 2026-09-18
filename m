Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010026.outbound.protection.outlook.com [52.101.193.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C03EB37CD52
	for <nova-gpu@lists.linux.dev>; Fri, 18 Sep 2026 01:08:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789693689; cv=fail; b=hTpliCsQR43AcdecpHq9YME0XkM052yWkTTI5IYvNrqhma9YcliD12Nk4Qv5tNNmoi3hbJs4zIy/0TB11DgykLzKPfVnlaEnkOEmLEKpjZdfzDBOPw0AgxgSPMP6bX8CV2Sc+yKrkBku+VTpRBIt+dFbKdf3akCbAa6DI3tvl8s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789693689; c=relaxed/simple;
	bh=ra0qrTKPKIyf3643QIrVqfq9c6Bz/croxvr+UkZAvo8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=n15rKKJddo/8E8FXrNBDhZneP4yU+X1VacSkLGiU+IImZzZNUHePfWDIgduo3Citd/H1uRZ5aPUZgwgP5alKrrYYikcldQiixp4d+kLKxfq+2cwRWjvwXbVaHG8XOPH/acoSMPWH2ZW0tQ9FgtgMZNqUNXfL1oCC6MqvI8caNAQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=p+jqtHei; arc=fail smtp.client-ip=52.101.193.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="p+jqtHei"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ghSSVoSspjghqGlRCI5H+18zj07HkeHK9V7Rt85xO4YL9jAj1YjGnSzbD1rhAMweFjfVPsCURrZmQv/T1RSWmQnrmJKydQU6nVFHC9qK/0Xn/r78OtB9G1weLBRFQcvf7PE+LvlYLdJnTUv9ofRfKKcGxpFtc9xNKigFE+Fm4oy271ctTDdVwk+9X4HH1KV6gvoCQLdZ961eD16KELXpDtuqZ9hy9vbpviYNmFUoPcv6mPuyhlTFQjUx4OjYYZwYQi5/4lKLpOABfjwfJaAZ236CAbeZmHQ8giAewYrOWtxqGIb7qJGg2mGmg6NZRK8rOz8Z2uIZ1rKRYZvbZdOYAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w1fMhQw+aBa3ynWTxc+3ks/P6EE7bYXYnADjZGPflUg=;
 b=YG6E1OJl0KboXvj1l4ln0N1fs9y5uL1YsFfjCSriV6ifpXhCOx5QJATO5JlrLg5FipUOvI91GSDlTp3XzGD3mL0oGX2ukyGz0mJCSaiHWarnAm8ffTFFVtZ2peR9ErbHYWWVDFxMUnxx4BAM6JU9unUmc10X3Hu9i19r+LPp6ZfIv1OZGYYdwppTc9MMujSRU+Fhk1uPN5HN6cEu52Xu1WuT0LO6WFopooGwkr27d9GWQsJzrBFsMQvndrnrNfO80Dtk4q2TpGyRxee8FyW5qNbRcdTTkQ1wcOv/2srSL+pDfH6L2JuVbpbCMjO+HceZUxj9ok2JLk3rBlnRiuYEww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w1fMhQw+aBa3ynWTxc+3ks/P6EE7bYXYnADjZGPflUg=;
 b=p+jqtHei+d5QZR8tZW18sKlTUpw1zArFFBNg/ZsgBJdGZ7P3yOYAtpIGsrdrdEjJFCx4oS2lFla/60OiuTu3y9K1F6mB6c5c3cxSafA/ubKeoFRxbp+STb5Q1bUiKvkO1rAcIrMMq9Jr4ONpx8Fvpfqhd4lKJKactGoY/rB9qnP/G9e45cpwUyeDJML1RCvKi6rSTHg1vPZe/WVo7GD4Z9icv1H8UtKWwOw9jn4z46TC9XVTLf+nW4Wlsm33iWoxInq+XEn+EQf4acOz8IuW24Yj9GdZChm3OoxFAXy4fXGAH/Fo/k+LiVvkUi/gLV6sGpAzWolfjmZg9N15r2xuwg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 DS7PR12MB5888.namprd12.prod.outlook.com (2603:10b6:8:7b::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.13; Fri, 18 Sep 2026 01:07:38 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%4]) with mapi id 15.21.0406.007; Fri, 18 Sep 2026
 01:07:38 +0000
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
Subject: [PATCH v3 11/33] gpu: nova-core: add GMC transport receive path
Date: Thu, 17 Sep 2026 18:06:57 -0700
Message-ID: <20260918010719.1176945-12-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260918010719.1176945-1-jhubbard@nvidia.com>
References: <20260918010719.1176945-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0074.namprd05.prod.outlook.com
 (2603:10b6:a03:332::19) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|DS7PR12MB5888:EE_
X-MS-Office365-Filtering-Correlation-Id: 05582b64-d9e0-4028-0569-08df15213b5a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|7416014|376014|1800799024|10067099003|3023799007|56012099006|6133799003|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	bFNPXR8hXtVo4k/dbjtmfscH/CZo6xK9BhvNL0jMJAt9uEn/MfZSKByTYlJlabcEriFRzW4YN6x+vMl/RlgoRElnmcOfUtvR8Idl8TSj9/FhIHi8gRpMRFxAQpLlpywmMA2bNr1wpFXWQJKJHSVagVZCsyTGMd1pbfw+PqjVqGYRhi9oIG0LUUZFuyfKWs4PoVqBskMcu1X9xKopODfLegx6YtbKf2AgIqycIIbZWS/tkU7LvqoPdi6hhrpZ0G/0KE1dbEezFrfqOv+6H614Gp00G9W9uXZAdH7wqZHYTM+SXbpeCqxvDNs2HK2E8Bx9g1gO6AQNnQ027AJ2nBweJWHcxHmVTR7vzuhNt4WubdLM4LgMmDk/NRcO+UKqMRJPbvqdNAGFcEzeYasm3Rq8jfFGL3iLKiPd0zZ0twqOzc440q3bcuGu/8DU/5hajjXn/RXVLUQSuWa+s+qVKQIPhrm8yxp3RxERX7uaRapQEEod5FG8hLO6ebzn+VaZAq5J0BpnxUofm/tyz9ikONJJs4/xjtcildj1deil1LAQZshxs+XbnHjFf0o/B7x1kGdEWJwyV/zpLL1jyeqnjx8LCUatGz1UkRxQFJZzeNjZa7/qYWAni0raCZJInAdSWD+JIu3RVMiSSSauKGNuEuAcWNFoE2pcT2p90UT/Bc6cZm0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(7416014)(376014)(1800799024)(10067099003)(3023799007)(56012099006)(6133799003)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Os6EMjlUGl7zM4ouQ1JAK4f6ugpRHTow03sF6zs2CrEBwOHpTkH+dEXNDrsx?=
 =?us-ascii?Q?A9qi1HFBzwmrfFgqoAAEowDbiWVZzBh08m5fJWFX7Ane8LoEvyCGwmzxjrAa?=
 =?us-ascii?Q?VCScF45MXy2RogL8NqweirBcgUVkDkM99+lBZA1KVdvPrUSAv2DD9CuyzPTb?=
 =?us-ascii?Q?yLmQYLh6OlyNy06lJ8Qqd31pknkKjjKxgNgIneY2fdbbUPMxOGTgNbTG+xJ4?=
 =?us-ascii?Q?hj8LUvGsYQ3V2Wp5pO8Y9rvlXSH1ej9MNOfyeSI7LcXWLiy/K0ONTVjPpb1b?=
 =?us-ascii?Q?PvOf7KbMmjNpOpuEyFLKVYmwlntKDlrGHPbsI0Ho6QtC6jNJipEns//g4iOx?=
 =?us-ascii?Q?3n5G/RmChQLSWhhnCfLsumX6PVz4lCtiSDP6LYYFyET/Ktc+bYvbqS9nq2mJ?=
 =?us-ascii?Q?sNwLjNjAk2oRWPC1px9e8uAQe7gJR3IgtCmExjvbDJph/MzuynNIckZ+YyY+?=
 =?us-ascii?Q?xwC1vUhaKwXtZr6mgAALKpnujJz7fvCy2iWIvzcBzD3rOp2Dk1n4tOF9ICkC?=
 =?us-ascii?Q?r/bm4ReCvVCWr6b3/CRHgYVyof5bBcWxlgHtge9tACoXhnsB51+zgetTiYsS?=
 =?us-ascii?Q?bEyDJBAMsbKP3ylnZUrBEsGEg/y9Lut0w7YNAL+M74Bjb2zfmsbD4447bhjq?=
 =?us-ascii?Q?ZZ9lICBhUUJZzRJiy37HeZBX9M/BJww3Ae6+cWIh89ut+v40BZSnRF8FM4kd?=
 =?us-ascii?Q?rsEwhJ5zQWnxvWq8qL3y8+sZOXa4OJCGk5ci5E4dQv0+OWPFng5NOnniXzIg?=
 =?us-ascii?Q?x0iZjyNNcmqVmItPH7lJYYO9x4wds/NOAqJ0I3sLiOLBJVvPqx0Od4gQWjXC?=
 =?us-ascii?Q?zewSJ94dnfDR+Xf0EWp3VFQu5XrS/7b/YNDBEDqwa1A9SHVoEtEbB26Pmxkz?=
 =?us-ascii?Q?zIkm7OMFjw3oVKPdjh5894lW1BvXlw10YALBmQlduNlnIMe8PsRn+zRCQaN9?=
 =?us-ascii?Q?yTbsl5XFcBXSpeIdJq/ULa1uufMIAHkDQVmaMgmug94dfVXPBrhfr5XBFHq/?=
 =?us-ascii?Q?lTvNqCt4EaXzkC6AFQHCEDP9yfGyDYY4jSy96XeP9z2sKshC7R9tOrVqsTq9?=
 =?us-ascii?Q?e9SvhPMr6EdLewQi72ny2PNm0N4CAZi+VLX+4XPPLxPqXRkovktM8/sDGsg7?=
 =?us-ascii?Q?eqBzy9i3TAyEvmk8DLv0GQj4cWGv5MtfctHjwJ1SRhqh53U/GG0hDV0EjoFn?=
 =?us-ascii?Q?0yBqU1XWDoNRi8MQ4XfUf//KkTJb6gYkWhPhVjkHR0cLrlB3sB5Wj8DU7Z+D?=
 =?us-ascii?Q?Qw2LKb+j87rO2SDqDzbDiNJaZse+2qRtsrnT509/hRGXoopW3Up2UlzU/mvu?=
 =?us-ascii?Q?7G73mOyEc079atDvEXCFjV9oYFAqq054o7YXyGZD7sAave1n8ONt2EQEnKjm?=
 =?us-ascii?Q?iWusBqbYLz7PNRVsJgeayT/UG7EqTk/uY3Bw+jY1YC/T4vfxuhvsE3OHo4Rs?=
 =?us-ascii?Q?H/hU8q6u9EKNAVdkQYrXJ8pDHDoyI5XghhZcqaunp5ev/Trn3XEsaAIHW7u/?=
 =?us-ascii?Q?gvUu7iFQ+Ekn177qBkkZ+GZNB5MEs+Uf7fRf6XV3ge+wGCSoDYC0BKr+e3Uf?=
 =?us-ascii?Q?KKLv53AuOeqQ1k+mcJ+a8NI6inwFL45qqTYa58UumdgYeoY1wXfzkoRm6+MN?=
 =?us-ascii?Q?HEE0k3hooEzCDsqsmUR2q7X333XWbZQRA8VbGH/SuF2/j+C54J3GaroxPzls?=
 =?us-ascii?Q?LitD5Lkd/tcXRmMC8FvtUjwBtRqoFu36Cr2Nrxrol2YVFS6oaR7t4QJBO+VO?=
 =?us-ascii?Q?TquiTr8Zzw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05582b64-d9e0-4028-0569-08df15213b5a
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2026 01:07:38.5400
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: txM2ZRfa0ABn9qDd2V4sxKPaA6trWNIVvBlXLCJ7d/ouGDv0ieXV71yBKgsBa9qHpDJS3Vi3SoZ7MCMISo4a6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5888

The r000 firmware posts GMC and RPC messages on the same queue. Behind
the transport headers, a GMC element carries a GMC header instead of an
RPC header.

Nova-core's receive path decoded RPC elements only.

Add a receive path for GMC elements. It validates the transport headers
before it trusts the length that they declare, as Open RM does. The read
pointer advances by that length, so a bad header leaves no way to find
the next element. The receive path poisons the queue on a bad header,
and every later receive fails until the device is reset. The GMC receive
path has no caller yet.

Assisted-by: LLM
Reviewed-by: Timur Tabi <ttabi@nvidia.com>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/gsp/cmdq.rs | 167 ++++++++++++++++++++++++++----
 drivers/gpu/nova-core/gsp/fw.rs   |  64 ++++++++++--
 drivers/gpu/nova-core/mctp.rs     |  14 ++-
 3 files changed, 214 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gsp/cmdq.rs
index c0c3d8596b30..a1bf536dc109 100644
--- a/drivers/gpu/nova-core/gsp/cmdq.rs
+++ b/drivers/gpu/nova-core/gsp/cmdq.rs
@@ -59,12 +59,14 @@
             MsgFunction,
             MsgqRxHeader,
             MsgqTxHeader,
+            QueueElementHeader,
             GSP_MSG_QUEUE_ELEMENT_SIZE_MAX, //
         },
         PteArray,
         GSP_PAGE_SHIFT,
         GSP_PAGE_SIZE, //
     },
+    mctp::NvdmType,
     num,
     sbuffer::SBufferIter, //
 };
@@ -475,6 +477,44 @@ struct GspMessage<'a> {
     contents: (&'a [u8], &'a [u8]),
 }
 
+/// A GMC (GPU Management Controller) API message ready to be processed from the message queue.
+///
+/// This is the message that [`QueueElement::Gmc`] carries.
+#[expect(dead_code)]
+struct GmcMessage<'a> {
+    // The queue element header and the GMC API header that open the element.
+    header: &'a GspGmcMsgElement,
+    // Slices to the payload that follows the GMC API header. The second slice is empty unless the
+    // payload wraps around the end of the message queue.
+    contents: (&'a [u8], &'a [u8]),
+}
+
+/// A queue element that has passed validation, decoded as an RPC message or as a GMC API message.
+///
+/// The queue element header holds an MCTP (Management Component Transport Protocol) header and an
+/// NVDM (NVIDIA vendor-defined message) header. The NVDM type selects between the two kinds of
+/// message.
+///
+/// This is the type returned by [`CmdqInner::wait_for_element`].
+enum QueueElement<'a> {
+    /// A GMC API message.
+    Gmc(GmcMessage<'a>),
+    /// An element whose NVDM type names another kind of message, such as an RM RPC. Only its
+    /// queue element header is decoded.
+    Other(&'a QueueElementHeader),
+}
+
+impl QueueElement<'_> {
+    /// Returns the number of queue slots that the element occupies.
+    #[expect(dead_code)]
+    fn element_count(&self) -> u32 {
+        match self {
+            Self::Gmc(message) => message.header.element_count(),
+            Self::Other(element_header) => element_header.element_count(),
+        }
+    }
+}
+
 /// GSP command queue.
 ///
 /// Provides the ability to send commands and receive messages from the GSP using a shared memory
@@ -838,29 +878,7 @@ fn wait_for_msg(&self, timeout: Delta) -> Result<GspMessage<'_>> {
             header.length(),
         );
 
-        let payload_length = header.payload_length();
-
-        // Check that the driver read area is large enough for the message.
-        if slice_1.len() + slice_2.len() < payload_length {
-            return Err(self.poison(fmt!(
-                "message advertises {} payload bytes but only {} are readable",
-                payload_length,
-                slice_1.len() + slice_2.len()
-            )));
-        }
-
-        // Cut the message slices down to the actual length of the message.
-        let (slice_1, slice_2) = if slice_1.len() > payload_length {
-            // PANIC: we checked above that `slice_1` is at least as long as `payload_length`.
-            (slice_1.split_at(payload_length).0, &slice_2[0..0])
-        } else {
-            (
-                slice_1,
-                // PANIC: we checked above that `slice_1.len() + slice_2.len()` is at least as
-                // large as `payload_length`.
-                slice_2.split_at(payload_length - slice_1.len()).0,
-            )
-        };
+        let (slice_1, slice_2) = self.payload_slices(slice_1, slice_2, header.payload_length())?;
 
         // Validate checksum.
         if Cmdq::calculate_checksum(SBufferIter::new_reader([
@@ -1029,4 +1047,107 @@ fn drain(&mut self) -> Result {
 
         Ok(())
     }
+
+    /// Truncates the read area that follows the queue element header and the message header to
+    /// the `payload_length` bytes of payload.
+    ///
+    /// # Errors
+    ///
+    /// - `EIO` if fewer bytes than that are readable, which poisons the queue.
+    fn payload_slices<'a>(
+        &self,
+        slice_1: &'a [u8],
+        slice_2: &'a [u8],
+        payload_length: usize,
+    ) -> Result<(&'a [u8], &'a [u8])> {
+        if slice_1.len() + slice_2.len() < payload_length {
+            return Err(self.poison(fmt!(
+                "message advertises {} payload bytes but only {} are readable",
+                payload_length,
+                slice_1.len() + slice_2.len()
+            )));
+        }
+
+        Ok(if slice_1.len() > payload_length {
+            // PANIC: we checked above that `slice_1` is at least as long as `payload_length`.
+            (slice_1.split_at(payload_length).0, &slice_2[0..0])
+        } else {
+            (
+                slice_1,
+                // PANIC: we checked above that `slice_1.len() + slice_2.len()` is at least as
+                // large as `payload_length`.
+                slice_2.split_at(payload_length - slice_1.len()).0,
+            )
+        })
+    }
+
+    /// Waits for the next queue element and decodes it as an RPC message or as a GMC API message.
+    ///
+    /// ```text
+    ///     +------------------------------------+
+    ///     | queue element header: magic, MCTP  |  validated
+    ///     |   header, NVDM header, lengths     |
+    ///     +------------------------------------+
+    ///     | message header                     |  decoded as a GMC API header when the NVDM type
+    ///     +------------------------------------+  is GmcApi, and left undecoded otherwise
+    ///     | payload                            |  truncated to the length that the queue
+    ///     +------------------------------------+  element header declares
+    /// ```
+    ///
+    /// # Errors
+    ///
+    /// - `ETIMEDOUT` if no element arrives within `timeout`.
+    /// - `EIO` if the queue is already poisoned, or if the framing is invalid, which poisons it
+    ///   (see [`Self::poisoned`]).
+    #[expect(dead_code)]
+    fn wait_for_element(&self, timeout: Delta) -> Result<QueueElement<'_>> {
+        if self.poisoned.get() {
+            return Err(EIO);
+        }
+
+        let (slice_1, slice_2) = read_poll_timeout(
+            || Ok(self.gsp_mem.driver_read_area()),
+            |driver_area| !driver_area.0.is_empty(),
+            Delta::from_millis(1),
+            timeout,
+        )
+        .map(|(slice_1, slice_2)| (slice_1.as_flattened(), slice_2.as_flattened()))?;
+
+        let Some((element_header, _)) = QueueElementHeader::from_bytes_prefix(slice_1) else {
+            return Err(self.poison(fmt!(
+                "read area of {} bytes is shorter than a queue element header",
+                slice_1.len()
+            )));
+        };
+
+        if let Err(error) = element_header.validate() {
+            return Err(self.poison(fmt!(
+                "element has a bad queue element header ({:?}), declared length {}",
+                error,
+                element_header.element_len()
+            )));
+        }
+
+        if !element_header.is_nvdm_type(NvdmType::GmcApi) {
+            return Ok(QueueElement::Other(element_header));
+        }
+
+        let Some((header, slice_1)) = GspGmcMsgElement::from_bytes_prefix(slice_1) else {
+            return Err(self.poison(fmt!(
+                "read area of {} bytes is shorter than a GMC element header",
+                slice_1.len()
+            )));
+        };
+
+        let Some(payload_length) = header.payload_length() else {
+            return Err(self.poison(fmt!(
+                "GMC message seq# {} declares a message shorter than the GMC API header",
+                header.gmc.sequence
+            )));
+        };
+
+        let contents = self.payload_slices(slice_1, slice_2, payload_length)?;
+
+        Ok(QueueElement::Gmc(GmcMessage { header, contents }))
+    }
 }
diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/fw.rs
index 75bc3d66f71f..5548ca77f49b 100644
--- a/drivers/gpu/nova-core/gsp/fw.rs
+++ b/drivers/gpu/nova-core/gsp/fw.rs
@@ -944,7 +944,6 @@ pub(crate) struct QueueElementHeader {
         == core::mem::offset_of!(r000_00::GSP_MSG_QUEUE_ELEMENT, nvdmHeader)
 );
 
-#[expect(dead_code)]
 impl QueueElementHeader {
     /// Builds the queue element header of an element whose message header and payload together
     /// take `message_len` bytes.
@@ -968,21 +967,68 @@ fn new(nvdm: NvdmType, message_len: usize) -> Result<Self> {
     }
 
     /// Returns the length of the whole element, the queue element header included.
-    fn element_len(&self) -> usize {
+    pub(crate) fn element_len(&self) -> usize {
         num::u32_as_usize(self.element_len)
     }
 
     /// Returns the length of the payload that follows a message header of `message_header_len`
-    /// bytes.
-    fn payload_len(&self, message_header_len: usize) -> usize {
-        num::u32_as_usize(self.message_len).saturating_sub(message_header_len)
+    /// bytes, or `None` if the declared message is shorter than that header.
+    fn payload_len(&self, message_header_len: usize) -> Option<usize> {
+        num::u32_as_usize(self.message_len).checked_sub(message_header_len)
     }
 
     /// Returns the number of queue slots that this element occupies.
-    fn element_count(&self) -> u32 {
+    pub(crate) fn element_count(&self) -> u32 {
         self.element_len
             .div_ceil(num::usize_into_u32::<GSP_PAGE_SIZE>())
     }
+
+    /// Validates the queue element header.
+    ///
+    /// Returns the first check that fails as a [`QueueElementHeaderError`].
+    pub(crate) fn validate(&self) -> Result<(), QueueElementHeaderError> {
+        if self.magic != MCTP_MAGIC {
+            return Err(QueueElementHeaderError::BadMagic);
+        }
+        // The MCTP start-of-message and end-of-message bits are not checked. Every element carries
+        // one whole message, because a large RPC is split into continuation records, not packets.
+        if !self.mctp.has_expected_version() {
+            return Err(QueueElementHeaderError::BadMctpVersion);
+        }
+        if !self.nvdm.has_nvidia_vendor() {
+            return Err(QueueElementHeaderError::BadNvdmVendor);
+        }
+
+        // Under confidential compute, GSP-RM pads the element out to whole queue slots, so the
+        // element may be longer than its queue element header and message together, but never
+        // shorter.
+        let length = self.element_len();
+        let min_length = size_of::<Self>().saturating_add(num::u32_as_usize(self.message_len));
+        if length < min_length || length > GSP_MSG_QUEUE_ELEMENT_SIZE_MAX {
+            return Err(QueueElementHeaderError::BadLength);
+        }
+
+        Ok(())
+    }
+
+    pub(crate) fn is_nvdm_type(&self, nvdm_type: NvdmType) -> bool {
+        self.nvdm.validate(nvdm_type)
+    }
+}
+
+/// The check of [`QueueElementHeader::validate`] that a queue element header fails.
+#[derive(Debug, Clone, Copy)]
+pub(crate) enum QueueElementHeaderError {
+    /// The first word is not `"MCTP"`.
+    BadMagic,
+    /// The MCTP header carries a version other than the one that this driver uses.
+    BadMctpVersion,
+    /// The NVDM header names a vendor other than NVIDIA, or a message type other than
+    /// vendor-defined.
+    BadNvdmVendor,
+    /// The element length is shorter than the queue element header and the message together, or
+    /// above the maximum element size.
+    BadLength,
 }
 
 // SAFETY: All fields are integer types or transparent wrappers over one, with no padding.
@@ -1091,6 +1137,12 @@ pub(crate) fn init(
         })
     }
 
+    /// Returns the length of the payload that follows the GMC API header, or `None` if the queue
+    /// element header declares a message shorter than the GMC API header.
+    pub(crate) fn payload_length(&self) -> Option<usize> {
+        self.element_header.payload_len(size_of::<GmcApiHeader>())
+    }
+
     /// Returns the length of the whole element, both headers included.
     pub(crate) fn length(&self) -> usize {
         self.element_header.element_len()
diff --git a/drivers/gpu/nova-core/mctp.rs b/drivers/gpu/nova-core/mctp.rs
index 0eb964c74e32..d2a7c6c02c35 100644
--- a/drivers/gpu/nova-core/mctp.rs
+++ b/drivers/gpu/nova-core/mctp.rs
@@ -70,6 +70,11 @@ pub(crate) fn single_packet() -> Self {
     pub(crate) fn is_single_packet(self) -> bool {
         self.som().into_bool() && self.eom().into_bool()
     }
+
+    /// Returns `true` if this MCTP header carries [`Self::VERSION`].
+    pub(crate) fn has_expected_version(self) -> bool {
+        u32::from(self.version()) == Self::VERSION
+    }
 }
 
 /// MCTP message type for PCI vendor-defined messages.
@@ -96,10 +101,15 @@ pub(crate) fn new(nvdm_type: NvdmType) -> Self {
             .with_nvdm_type(nvdm_type)
     }
 
-    /// Validates this header against the expected NVIDIA NVDM format and type.
-    pub(crate) fn validate(self, expected_type: NvdmType) -> bool {
+    pub(crate) fn has_nvidia_vendor(self) -> bool {
         u8::from(self.msg_type()) == MSG_TYPE_VENDOR_PCI
             && u16::from(self.vendor_id()) == Vendor::NVIDIA.as_raw()
+    }
+
+    /// Returns `true` if this NVDM header names the NVIDIA vendor and the NVDM type
+    /// `expected_type`.
+    pub(crate) fn validate(self, expected_type: NvdmType) -> bool {
+        self.has_nvidia_vendor()
             && matches!(self.nvdm_type(), Ok(nvdm_type) if nvdm_type == expected_type)
     }
 }
-- 
2.55.0

