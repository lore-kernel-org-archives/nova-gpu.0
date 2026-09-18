Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010019.outbound.protection.outlook.com [52.101.193.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B0843806D8
	for <nova-gpu@lists.linux.dev>; Fri, 18 Sep 2026 01:07:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789693679; cv=fail; b=sjulJvmCB7MAD670IwH+AIjsdE9ooayJp6kNkql551O2/cGIMXxqSlYteCJmlZteVvu/+GmzaIwsBxpRtowSN/6ETuH0CmTPyKyfHGah4xETC7T6a0xQz8X0A5XgBb6k4lPyMEAYqn9RfLIicftMMFZaDAip58D4qjeSHur60NA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789693679; c=relaxed/simple;
	bh=QO12iZUOShWQmIq2UVTt2mPEvs1JNhOpQ59hFb0qWBE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=sYkCAAzN5uzyl7ednXZZIEyuWVaRbBn1VqbQIXTOXCZjQx/Sj1mzbTU0Yapy18RMPovjNCxFMUscWNH+nN9zpSrDe4D/L6a6DLpoppEjeOciH4zrl/6CTStrFKlYu4bs6x+UTdtAUwGag+51YCJo9kFA+nTY9781N7AtHkKS9sk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=CuIAo9sR; arc=fail smtp.client-ip=52.101.193.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="CuIAo9sR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gKPv4EBRlzCzmlJjIED3KDRZuBi49/eu/jZ3U1EtFOaPUuWzbJ0u57oJjgM5mV1VtLWTO9Jr8/QlaeKpQjeBweQuEczG5pe7COm5dWCLR+mI2kcJUJRhjxQKYXe3dDF5Ce/1Lp7VODUA64kx+u74RzGE8EnnHECVeXANrqAcUxFR5MPC4vjRe2vhCsm43cJmPdNbbbeaNmPsj3OrhBXu/uOvhue4WXxaM7ym+hdf2uiIJUbZ2MRKdpNloQtCvpvTDlWUXgaHf4HQOrdnkAxyX2KtiplxmkFat8AytZ5zvMTrTveAEfcBf1QIa8IuF15JHafGV6za8L+UwBV8P6d/pQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XkURisvbJF8oiULHHmzQhtyMsznZWI8W46lJGi8cqVo=;
 b=uRz4HdrO+uxR5xj9ctSOjtpZo7303Tmr7Hj4Y6Td1EKJqQFdPV7m4Df4VDBJenNPJZc5glFRRQUPBlBGuCod1rD0mo09a2xChljCzHfCckMWX6gy1BP1JW6pq381O2vGYJX+2whnVg78oF7OPZFd81e2OhXi2p3lMKv3+ktQws/t7ZuB0A3q90FTjPOZPH16MN4Kwns0VEtaNZPSpIuS0jtjvHkbXvDuU+IFMG007o6+Goek+z1ypDFGe3BRSCQTBXhbM57eTxr3PgHgqcE/WdU58hZqS9GNN+17UMdf9e0yaeKFoeA013RtXPM52zWXzF9DDqSMD9OJApckdvr5wA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XkURisvbJF8oiULHHmzQhtyMsznZWI8W46lJGi8cqVo=;
 b=CuIAo9sRMNOwtfkKsvao+PDNyukzC8OCqc6H/1kZEu/Bd+ymfIFELDyrdddKVErAjROFDfKnkPCnSWiyJ5Z1FgG2UDa4uYB+LbMQwyeOQS8BaqRRrcLIkx45i4yNPhecQ7PzeYBxKeAqXilIv5PJiqir9Kh3UhXSn95vaFojdGYZtHDOglbDE7Z0frx/K4rWN4zYFFOkWKv8WBepP2/J9vAKZFnEL3lHxI2YiAJ8K/myZxKWAkbAsxUhcavSdUWk9oVZZHeulGiwGbHlulypVz6SXcoplrIk1g9tS6RTig8dbxgdTn1lO3PKf037NCpmQS+52rt0TKNtsswNasZtjQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 DS7PR12MB5888.namprd12.prod.outlook.com (2603:10b6:8:7b::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.13; Fri, 18 Sep 2026 01:07:36 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%4]) with mapi id 15.21.0406.007; Fri, 18 Sep 2026
 01:07:36 +0000
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
Subject: [PATCH v3 09/33] gpu: nova-core: add GMC API message types
Date: Thu, 17 Sep 2026 18:06:55 -0700
Message-ID: <20260918010719.1176945-10-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260918010719.1176945-1-jhubbard@nvidia.com>
References: <20260918010719.1176945-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0040.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::15) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|DS7PR12MB5888:EE_
X-MS-Office365-Filtering-Correlation-Id: 7bc2824c-cc31-4693-2495-08df152139dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|7416014|376014|1800799024|10067099003|3023799007|56012099006|6133799003|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	Sp0hTbYPtTnsMVQ6lttCxnjKL3G7VR+TNL/qYDRk6gkjfLfhuoRCGYBSAs9xMO8Qc3Bo8M6NDZyraA1lSV06dpWyK+rrrPb3asNGcMPS1cre4orGvyuJcixhVU49B8eoxn9ban+MsYrkX0vzNQv+6y0RBNnE+IDD8NB2Iqecg/f1be8akUVglD2wcb/IdO3ppw/h5vRuA+urIwPzSXFl50JuVaXM/WaP46WKUhRkaHOGiE+3khBS5p0PuTsR/fdPtcHHFwnIPHUvXiUT9xr0olpn2z1WC+7KmKV/z0ZZjx+72YH0A0THkBqfCNkQvGCQ3VKdF5GLyTMrr55pUMCHWTN2MOzfKnIJrfwyDsyB7dfhHy6vUQyeYSrgWaSb/V4HiwMCm/3t5tFMRIzEeKktnmFNHzOgZVe02qhEXbTsCDYye/Rjfou5lGPTGIPJpB9RNNXbr32eGw/wqjXmikYgmsdae4S1/gEtJBVu1rwlCyBPhfB2C71IxkDsFVc1JJ/CU2RR8v1w5tqrpFcCVk4CKSGQPzorFWh635OA+xwNSfqMzYrrIiVRbjJdNaZ7pr/8QG3ytuJNeiWjIbabtTa7HZIgGVS8PXPf3mp4gsYroSDYk5AvQ6HrQgh0GXq0WDk0/oeiJICaX+Ua+hqOa+7xFY7q7h/pQnaBUmZHbrGrcT4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(7416014)(376014)(1800799024)(10067099003)(3023799007)(56012099006)(6133799003)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?SBhhl8kvqNe55PVL+WcVaaRz1iM8ws5yK3RzVylefJL5svOsB76nXgFXduPP?=
 =?us-ascii?Q?tEe62WNNdCPipI2bdeBojiqSu9CsijD8Hn7R7uQdbkW1Xm4ESygn5DD9CmLh?=
 =?us-ascii?Q?eawXs9vaQ7Dk00LM5pc1cgr1SVZ8Vo5AUkBTrUdEbm5rcZ7/bHzLgWWFtBad?=
 =?us-ascii?Q?LYck+sFWpL8jN7BBhJAUhcyY6kM8iQqK0AtRp4mlXx4bv3wCvh13c7R1yeQu?=
 =?us-ascii?Q?YRwlM4z/IZw5cEypBMYKGXwdibxR2NKMH3ah4xMIxVD1pbbRHr85pmFQVaEL?=
 =?us-ascii?Q?wZ52zfQHibCTNlcrnmU4JG+BeF5OekywEOG/HTqC17N2CiUNBm+ULzwAO6bF?=
 =?us-ascii?Q?+eNU9h0kUQw532bMKjOW30CgWT4DCSaFNdIc8qDWC+Ho8QXKMsjAo4bfLTzD?=
 =?us-ascii?Q?PH3n1+Rj4LCGk3bco5Zsc7u6b/plhw+ayf8cOukckrKM8tqsKS4zSP0PzczO?=
 =?us-ascii?Q?x/SJJ6apklg7t7qQnlUhFpqF9WXFPu0/sEmt0Xp5VR8BSv7xBTWPCwUl2EcZ?=
 =?us-ascii?Q?H/b2x3yzXTWrPbjkYivjVVT/fvQ5Qw2eD01tzUugNQ1PAFIK1QzMgpEgbv+3?=
 =?us-ascii?Q?+pWqDYJDxi0EvylJ15Ckf5XUAfwDtxSjfCv02g22YNRFgUFhbdPGtsdj4tH4?=
 =?us-ascii?Q?FYLD5nEEi4qR8sRHBvnE95LtGOdnl1W/1/1MIqoFb7N+DKlG/19TL7cGfQfQ?=
 =?us-ascii?Q?AxCVmOioGfa40GbJQvp31Jxi3rdyUtRJLXgKyW7tbzJvY5Fw2jS7B/YfsUA/?=
 =?us-ascii?Q?QjlolR24K1iedVcs60ydJhjAtagA0NA63pxP7uIW9fIM6+wLyHKSLS5vgKug?=
 =?us-ascii?Q?6KY6zBWUO8BHjMjwWx0Cji/FOEWy5g87dMckjfAniCWe8uzWT/HQfOvEoHoY?=
 =?us-ascii?Q?+IfQ26n7i7CBNOy4FIsAOvBEfaucUWPRkGEcs5Wd0bAFDfVnYjmcEle8s3WH?=
 =?us-ascii?Q?zZwt1ChnJSbl9joX2NryO63NgKaDwcIXbPE1U1czdIkMbnfctNvqKuTt1m/Y?=
 =?us-ascii?Q?LHtPywKo4GObvrEYB5U1oTNnMh7QmVSKkfr2jZrQQYNMkJNctQqxpgUZC9/9?=
 =?us-ascii?Q?cPCC9b+lRIrEltn+JS3bfMFrHZGS+q41UY4nRq8tLv56me65kabWn4xYCzcm?=
 =?us-ascii?Q?B1voKHTh8LmaIexVsaxVtabMraq06JxYaiwSZVm4vhaJ9PQzm8CLQsuCMxno?=
 =?us-ascii?Q?MWvaE8LGvBNSfPyba0bpWAnP/W+f0uTzcfzF+veR3Gf6qr3Tjrzq/oJhCxwl?=
 =?us-ascii?Q?yvXa5iaQwcP6QJDxDZl42zrAP/0bQ+rFaaCr30psre2tDNPaXK/BFxYA8BuP?=
 =?us-ascii?Q?rsUkLAUSv5Aqm2PnmElgzm4dKvOTHNcUA8UY7q2gE68OOruLwQfHraL9yUAM?=
 =?us-ascii?Q?NWv9gA4XGQjPl3pF7EqJzqBRkkXv2Bem6bEEz1rpmF6x3F2qZmSQeBV3ezif?=
 =?us-ascii?Q?4tisTXQmpWxNkFPpbUCWovM4qyZfghvj5tnY0v0QFhYSGuBhGfmM9CekUQb9?=
 =?us-ascii?Q?GMm9DypDz3fOZ1PwSy4282bmn2Za5EZB8PbDHaLOIuCXgiH3/8cs+rI6efW4?=
 =?us-ascii?Q?SfLYt7Sk2S6BKi+H/+mi45qsmBZMjcrN19xfGyQ5SwUYWGZqwRk784Zgqg2S?=
 =?us-ascii?Q?P5u1mtT70zWCm2yIDGkz0k+gAXk6mnmGginKLKKj4pS8OB/RCVDuOgXmkeuI?=
 =?us-ascii?Q?YkA5qYA2Bf02IuwjkAiEQXbO3LMC0KGEtyrUwXWceYO2iFSmM2X0JTcYu3+O?=
 =?us-ascii?Q?j36e9BKMWw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7bc2824c-cc31-4693-2495-08df152139dc
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2026 01:07:36.0453
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s0zP6vp8CcJXD+Lwgtv+FkGZaMRdW8jyWXJ5di3757L5vct4heOxDG9S1hUoQBtbNFaq9hiwUG/zDclJ5DBLDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5888

With the r570 firmware, every element on the GSP queues is an RM RPC
message, and the driver builds and decodes only that form. The r000
firmware adds a second kind of element on the same queues, the GMC API
message. GMC is the GPU Management Controller, and its API carries
GSP-RM's boot and management commands. GSP-RM's newer interfaces use the
GMC API rather than RPC messages, its ABI is stable, and on r000 the
boot protocol itself runs over it.

Every element opens with the same two transport headers. The first is
an MCTP header. MCTP is the Management Component Transport Protocol,
and this is its packet header. The second is an NVDM header, the NVIDIA
vendor-defined message header, whose type field selects the header that
follows: the RPC header or the GMC API header. A GMC API header has a
fixed size and carries the command id, the payload size and a sequence
number. Its last word is the largest response that the sender accepts,
and in a response the same word carries the status.

Nova-core's queue types named the RPC header directly, so there was no
way to build a GMC element or to tell one from an RPC element.

Add the types that a GMC element needs:

* The queue element header, which holds the two transport headers and
  the element's lengths, as a type of its own.

* The two NVDM type values that the GSP queues use, one for RPC and one
  for GMC.

* The GMC API header, and the element header that opens a GMC element
  with it.

The GMC API header is written out field by field rather than wrapped
around the struct from the generated bindings. The bindings put the
request and response fields of that header in a union, so reading the
status of a response through them requires unsafe code. A struct
written out with the same layout reads the status without unsafe code,
and static assertions check that its layout matches the bindings.

The types have no user yet. The following patches add the send and
receive paths for GMC elements, and the driver keeps booting r570 over
RPC until the patch that switches firmware.

Assisted-by: LLM
Reviewed-by: Timur Tabi <ttabi@nvidia.com>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/gsp/fw.rs | 220 ++++++++++++++++++++++++++++++++
 drivers/gpu/nova-core/mctp.rs   |   4 +
 2 files changed, 224 insertions(+)

diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/fw.rs
index 285c23cea771..1aca5ca82764 100644
--- a/drivers/gpu/nova-core/gsp/fw.rs
+++ b/drivers/gpu/nova-core/gsp/fw.rs
@@ -50,6 +50,11 @@
         cmdq::Cmdq, //
         GSP_PAGE_SIZE,
     },
+    mctp::{
+        MctpHeader,
+        NvdmHeader,
+        NvdmType, //
+    },
     num::{
         self,
         FromSafeCast, //
@@ -889,6 +894,221 @@ unsafe impl AsBytes for GspMsgElement {}
 // are valid.
 unsafe impl FromBytes for GspMsgElement {}
 
+/// First word of every queue element: `"MCTP"` in ASCII.
+const MCTP_MAGIC: u32 = 0x4D43_5450;
+
+/// The queue element header that opens every queue element, whatever kind of message follows.
+///
+/// It holds an MCTP (Management Component Transport Protocol) header and an NVDM (NVIDIA
+/// vendor-defined message) header. The NVDM type selects the message header that follows: the RPC
+/// header or the GMC (GPU Management Controller) API header.
+///
+/// ```text
+///     +------------------------------------+
+///     | queue element header               |  QueueElementHeader: magic, element length, MCTP
+///     |                                    |  header, NVDM header, message length
+///     +------------------------------------+
+///     | message header                     |  the RPC header or the GMC API header. The NVDM
+///     +------------------------------------+  type selects between the two.
+///     | payload                            |  command-specific data
+///     +------------------------------------+
+/// ```
+#[repr(C)]
+pub(crate) struct QueueElementHeader {
+    magic: u32,
+    /// Length of the whole element: the queue element header, the message header and the
+    /// payload. Open RM calls it `mctpPayloadSize`.
+    element_len: u32,
+    mctp: MctpHeader,
+    nvdm: NvdmHeader,
+    /// Length of the message header and the payload, the queue element header excluded. Open RM
+    /// calls it `nvdmPayloadSize`.
+    message_len: u32,
+    reserved: u32,
+}
+
+static_assert!(
+    core::mem::offset_of!(QueueElementHeader, magic)
+        == core::mem::offset_of!(r000_00::GSP_MSG_QUEUE_ELEMENT, mctpMagic)
+);
+static_assert!(
+    core::mem::offset_of!(QueueElementHeader, element_len)
+        == core::mem::offset_of!(r000_00::GSP_MSG_QUEUE_ELEMENT, mctpPayloadSize)
+);
+static_assert!(
+    core::mem::offset_of!(QueueElementHeader, mctp)
+        == core::mem::offset_of!(r000_00::GSP_MSG_QUEUE_ELEMENT, mctpHeader)
+);
+static_assert!(
+    core::mem::offset_of!(QueueElementHeader, nvdm)
+        == core::mem::offset_of!(r000_00::GSP_MSG_QUEUE_ELEMENT, nvdmHeader)
+);
+
+#[expect(dead_code)]
+impl QueueElementHeader {
+    /// Builds the queue element header of an element whose message header and payload together
+    /// take `message_len` bytes.
+    ///
+    /// # Errors
+    ///
+    /// - `EOVERFLOW` if a length does not fit its 32-bit field.
+    fn new(nvdm: NvdmType, message_len: usize) -> Result<Self> {
+        Ok(Self {
+            magic: MCTP_MAGIC,
+            element_len: size_of::<Self>()
+                .checked_add(message_len)
+                .ok_or(EOVERFLOW)?
+                .try_into()
+                .map_err(|_| EOVERFLOW)?,
+            mctp: MctpHeader::single_packet(),
+            nvdm: NvdmHeader::new(nvdm),
+            message_len: message_len.try_into().map_err(|_| EOVERFLOW)?,
+            reserved: 0,
+        })
+    }
+
+    /// Returns the length of the whole element, the queue element header included.
+    fn element_len(&self) -> usize {
+        num::u32_as_usize(self.element_len)
+    }
+
+    /// Returns the length of the payload that follows a message header of `message_header_len`
+    /// bytes.
+    fn payload_len(&self, message_header_len: usize) -> usize {
+        num::u32_as_usize(self.message_len).saturating_sub(message_header_len)
+    }
+
+    /// Returns the number of queue slots that this element occupies.
+    fn element_count(&self) -> u32 {
+        self.element_len
+            .div_ceil(num::usize_into_u32::<GSP_PAGE_SIZE>())
+    }
+}
+
+// SAFETY: All fields are integer types or transparent wrappers over one, with no padding.
+unsafe impl AsBytes for QueueElementHeader {}
+
+// SAFETY: All fields are integer types for which all bit patterns are valid.
+unsafe impl FromBytes for QueueElementHeader {}
+
+/// Header of a GMC API message.
+#[repr(C)]
+#[derive(Zeroable)]
+pub(crate) struct GmcApiHeader {
+    /// Command id in the low three bytes, flags in the high byte.
+    pub(crate) command: u32,
+    /// Payload size in bytes.
+    pub(crate) size: u32,
+    /// Sequence number that GSP-RM copies from a request into its response.
+    pub(crate) sequence: u64,
+    /// In a request, the largest response that the sender accepts. In a response, the `NV_STATUS`.
+    pub(crate) max_resp_or_status: u32,
+    reserved: [u32; 5],
+}
+
+static_assert!(size_of::<GmcApiHeader>() == size_of::<r000_00::GMCAPI_HEADER>());
+static_assert!(
+    core::mem::offset_of!(GmcApiHeader, command)
+        == core::mem::offset_of!(r000_00::GMCAPI_HEADER, command)
+);
+static_assert!(
+    core::mem::offset_of!(GmcApiHeader, size)
+        == core::mem::offset_of!(r000_00::GMCAPI_HEADER, size)
+);
+static_assert!(
+    core::mem::offset_of!(GmcApiHeader, sequence)
+        == core::mem::offset_of!(r000_00::GMCAPI_HEADER, sequence)
+);
+static_assert!(
+    core::mem::offset_of!(GmcApiHeader, max_resp_or_status)
+        == core::mem::offset_of!(r000_00::GMCAPI_HEADER, __bindgen_anon_1)
+);
+static_assert!(
+    core::mem::offset_of!(GmcApiHeader, reserved)
+        == core::mem::offset_of!(r000_00::GMCAPI_HEADER, reserved)
+);
+
+impl GmcApiHeader {
+    /// Returns the `NV_STATUS` that a response carries.
+    ///
+    /// The value is meaningful only on a response, which GSP-RM marks with a flag in the command
+    /// word. In a request, the same word holds the largest response that the sender accepts.
+    #[expect(dead_code)]
+    pub(crate) fn status(&self) -> u32 {
+        self.max_resp_or_status
+    }
+}
+
+// SAFETY: All fields are integer types with no uninitialized padding bytes.
+unsafe impl AsBytes for GmcApiHeader {}
+
+// SAFETY: All fields are integer types for which all bit patterns are valid.
+unsafe impl FromBytes for GmcApiHeader {}
+
+/// The headers that open a GMC API queue element: the queue element header and the GMC API
+/// header.
+#[repr(C)]
+pub(crate) struct GspGmcMsgElement {
+    element_header: QueueElementHeader,
+    pub(crate) gmc: GmcApiHeader,
+}
+
+// `AsBytes` below requires that no padding separates the two headers.
+static_assert!(
+    size_of::<GspGmcMsgElement>() == size_of::<QueueElementHeader>() + size_of::<GmcApiHeader>()
+);
+
+#[expect(dead_code)]
+impl GspGmcMsgElement {
+    /// Creates the queue element header and the GMC API header of a request that carries
+    /// `payload_size` bytes of payload.
+    ///
+    /// `max_response_size` is the largest response that the sender accepts, and zero for a request
+    /// that GSP-RM does not answer.
+    ///
+    /// # Errors
+    ///
+    /// - `EOVERFLOW` if a length does not fit its 32-bit field.
+    pub(crate) fn init(
+        command_id: u32,
+        sequence: u64,
+        payload_size: usize,
+        max_response_size: u32,
+    ) -> impl Init<Self, Error> {
+        try_init!(GspGmcMsgElement {
+            element_header: QueueElementHeader::new(
+                NvdmType::GmcApi,
+                size_of::<GmcApiHeader>()
+                    .checked_add(payload_size)
+                    .ok_or(EOVERFLOW)?,
+            )?,
+            gmc: GmcApiHeader {
+                command: command_id,
+                size: payload_size.try_into().map_err(|_| EOVERFLOW)?,
+                sequence,
+                max_resp_or_status: max_response_size,
+                reserved: [0; 5],
+            },
+        })
+    }
+
+    /// Returns the length of the whole element, both headers included.
+    pub(crate) fn length(&self) -> usize {
+        self.element_header.element_len()
+    }
+
+    /// Returns the number of queue slots that this element occupies.
+    pub(crate) fn element_count(&self) -> u32 {
+        self.element_header.element_count()
+    }
+}
+
+// SAFETY: All fields are integer types with no uninitialized padding bytes.
+unsafe impl AsBytes for GspGmcMsgElement {}
+
+// SAFETY: All fields are integer types for which all bit patterns are valid.
+unsafe impl FromBytes for GspGmcMsgElement {}
+
 /// Arguments for GSP startup.
 #[repr(transparent)]
 #[derive(Zeroable)]
diff --git a/drivers/gpu/nova-core/mctp.rs b/drivers/gpu/nova-core/mctp.rs
index a3872a740233..0eb964c74e32 100644
--- a/drivers/gpu/nova-core/mctp.rs
+++ b/drivers/gpu/nova-core/mctp.rs
@@ -28,6 +28,10 @@ pub(crate) enum NvdmType with TryFrom<Bounded<u32, 8>> {
         Cot = 0x14,
         /// FSP command response.
         FspResponse = 0x15,
+        /// RPC message to or from GSP-RM.
+        RmRpc = 0x25,
+        /// GMC (GPU Management Controller) API message to or from GSP-RM.
+        GmcApi = 0x26,
     }
 }
 
-- 
2.55.0

