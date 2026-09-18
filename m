Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010005.outbound.protection.outlook.com [52.101.46.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDE2739D6DD
	for <nova-gpu@lists.linux.dev>; Fri, 18 Sep 2026 01:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789693792; cv=fail; b=jCPkVKJ7PWF4uXzho7gN3D1FiCIrcGUGxCoVI/7NfhSA18xtPjgSRymcowhWSW+dTNUlmnI241YWZcxHX9WB9/d/ZTqhe/iefGwJEWXWAobeVTvR/sagz9jutgsImZosGdDGsKQNTMErfBGQ/NPUZMQb/SjoFL7MHcDTZpp+qW8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789693792; c=relaxed/simple;
	bh=8uj+zZhMXxpcOIkFl4Qc0xizF44omwuhwLkJ5y9dhCY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=O2fAn3EZVIJpLywfGrVF4220lfbzCKjIFu56C54V1Bza1/p3v/t8yvyB7NiiInSvhcylr2sLZyABgOMjYpHyas3UylX8u/v1Ew5f5qozIuC1M8NzOuEXEaX2bTii0ZWQFIuf+60DdEeyPTDoL70CqKWhNL+6rqNETAicfn2uDW8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=lquO+U2n; arc=fail smtp.client-ip=52.101.46.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="lquO+U2n"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mh7LGYrJ6x/O9v1E+xRvhmeKEzM10JJEfpQZ1gLVcC38IoKKoXi0ou0bi6yAWZEYmWnOhkwf3KAFU7RZ7XZpIupGkds7MIh8I0nVlzLMDYqmhS8B7jOpcgANz112YGdQAWPDSLDyYenma6Kd9JbYnDE9lNDLecoBFGEHqnqH7CR6I7MxThKl/iA7jmd8G/02xGVuESBrxtkiQ33ZE3D1TOW+hsIOgw7Md4F3mN9vNBlbY7IvBw7KPBbwJmIJRRJTIgB5aCaLYIlTMyPpNAe46LnlLoaUh+uQHqOFWJ43zeSmKGtYfGY5mfK50YUDXYl7FRRdMSWzobKr46qMBrVGYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8noc7W1BtdKxSgOx6QQaYJeLzWLPgLVSCiVTYJqtCmo=;
 b=pPrCw86gJ54UZ9Ic7CvHRZtsDxbLZVYd8wmahUvnx/obdnVx+9SHIVJ6FibX+oBOuvCsfLC5OXhe++Nw88OhKuj9Xf1oB9gRRRLoNTUX7y3zVOXMEDH/bYleHr6htMWDsurETueu1feJVf5mpPucPDA0NftS75Kk+3FC0by+7uF6KqGfLcjVG52aFmIm8wHHoy/14qR0keBYBDNsq/3rn0V0zuyKSB+IuuwFbBSFkhNNrkY+cGG6PVZVTe5u1cRoWIocUFoCuwebrG4/W2PPl5HhlTEYy6KLh7kOrFKRK6jdxix3+WpXRXPDY3NTzyhdZwbyzhML9lN1BJlMCcOrXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8noc7W1BtdKxSgOx6QQaYJeLzWLPgLVSCiVTYJqtCmo=;
 b=lquO+U2nTCEy3yzWIujSH4bs7mLQ4Rn+e/QGp4/BV1XIJZnKD0GtQMCRahRTPgDvvjlTkqN3VXUvFFCet5k9A48ON7+oEcYyRBAv2gtXoZHGIILjx3CaELVbu2RULkJX/9LB01pCMebj1X9ffYMYB0Xv6CCxTYaRALOiYLYBoAtkzKM3QeWufJB16VPDL5Gnqmv7stO50rTBLgFXD1gTYLlK0S9/pW/ZH9TU+1Vxkq3Y06QbXdsAkvSjwH3kawbrJdxx+EhHLv06PeF1N3kdyPjL+JgX/Xu4l+XWkmxlBShPjnh8I9oYOTI9Wo81As8Gxg8aSNW6tOPZt1fi/ODlKA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 IA0PR12MB8349.namprd12.prod.outlook.com (2603:10b6:208:407::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.13; Fri, 18 Sep
 2026 01:09:11 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%4]) with mapi id 15.21.0406.007; Fri, 18 Sep 2026
 01:09:11 +0000
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
Subject: [PATCH v3 32/33] gpu: nova-core: gsp: decode queue elements by their NVDM type
Date: Thu, 17 Sep 2026 18:07:18 -0700
Message-ID: <20260918010719.1176945-33-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260918010719.1176945-1-jhubbard@nvidia.com>
References: <20260918010719.1176945-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR03CA0016.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::26) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|IA0PR12MB8349:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d3ac8b4-34e1-4d98-8b23-08df15214aae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|7416014|366016|18002099003|22082099003|56012099006|3023799007|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
	hed55Y5mVTDe+qIlm0b1T7DSBJKF7A+DlAdxqCGaSiJZdamla6bJFF2zALQWYfEfvnKrDQDlfM61EUKJiOA8CseFJQQ3VtE6J87VDt7QTjRVNb/2VFl/1pvuSr/e4DBxzQSsy3WQaazCvK1tfB+2482CJRZbv74exeuSb3UEgx1qWxK3kKbCgY23Wm4HfJWQO0EzQBvACHqGJwoVrMJCOn9jq0LqqGEadLxA/LTv1mfNTOtnH3SbLh+h9kogqPx5Oo75CQdkEAv3ATz7E7rj42vqSL7j9t1Fu/nubZJiDlX1Qdg+/L8j3i4MxZHnAi430WYeo+GdFn6CZ3usBRGI+OloLVvi66wNmWgLwFjikdUX/PH2MLHcGIxK47AiPY5BAWVvXIP9586fsNrVBy88/aSbrkIyrglxDhonpzYP7zwfBioyjrL3Axcrtkmr3OgiA2COpDBe5RtlZP5YYI7O/NO7zRcRASFdk69Q+Me3bVydoV3bGqvekp2FIfcgfAZ/Q5fS3r3R37xX+OpEQfBOyDxB4crPPPdz63Q6f8wVFbhWP+A27C7JsLka50mCna/m7uOYJKUiJydktALHWoMRpM5Oe34K2LuQ/o0YXwtyb+S9/6fHsB4gIM96qs7rxsrmdlrGJlX0kC9zQvRMeoz5FGJPghYbR4llBShXfjjNGmI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(7416014)(366016)(18002099003)(22082099003)(56012099006)(3023799007)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?oZsILiEcLb1TYrdg/2NUA4NbIKhN/q7JY6Fcf2F/3YIiAyKHM3ikRa4ikpyr?=
 =?us-ascii?Q?X/p5CftKtjh2aOBjIzBzqDe3SJoME7WVowii/4+8el/+XPwffoJEDBAg5Y7B?=
 =?us-ascii?Q?zkPlGd0QWRo5G38mtmH6m8Tb3rbVPYhp4BJ77jb3qpbsaEbxRrX+B2Qu5D3o?=
 =?us-ascii?Q?LNfNukYbIx7Ah9d7SwG+X7xHJYtnMnyPwVse+FTNxB82BTUhFMqfV/JT/Fj4?=
 =?us-ascii?Q?g2njCAsj5OovYMkdrcf3ctGx0TqwAVfCR6ZfoMRbG9oILZcIbjPZkybJUwRM?=
 =?us-ascii?Q?/Zr9RThyc0E458lB++lhXfWgdU5KfpoWIRPCuzM8TMdTNmQEuTxF9YWUZZB3?=
 =?us-ascii?Q?I3JRFv1hHqX8gZeVw5TCZOzJpb/BNKFDS/qP3p6dA8eTh2/APQudHfNdIulr?=
 =?us-ascii?Q?7wUMRNOMLPXwp06JaR2g020ui7YVlEwLXycOBg9kcjUSFUaL5PbKL1eTJntB?=
 =?us-ascii?Q?Rl0AxioTWCdnHsjov9+MVK4vkVgiePFviaL096EiCVFrqteTwhcpseRhJkOe?=
 =?us-ascii?Q?E/achhVUC4eqJdSotzGHhdTCi938yHqZmnzAwkWbWOeuCuhceyB25SoL8H4D?=
 =?us-ascii?Q?DLqfxGeH3PSF7zp25MrB+oPBRmoeRxtUJ3a4054R+hw2FJDVhxlj47dKo5M4?=
 =?us-ascii?Q?z6kpQaisnPGj/Dui53VRQ2HRpkC3SoFTYdRhifa6BrHGlHGFg9/V+m2k8P+1?=
 =?us-ascii?Q?e5el9hB0na0j5JB810EgrVtO1GFX2M3gXPOWEHkgSji7gN1aJC4cywm6mz2w?=
 =?us-ascii?Q?hDE1NXkvp1R6XHmO079WDvI16Kff0jlHKFR1aRdUV2kR3Fwtoff0FeWDwZwy?=
 =?us-ascii?Q?WHtKkWXMyvLtKanRDknOBXT7EYrRm3BZEt2Vkpw7+4pTTDfRe5u5vIPGj++f?=
 =?us-ascii?Q?JkCeQdp0Q6q59/a7rB99iojgwayHSEZiXoFJDs66NcDNr748dnjQ7pukpvY5?=
 =?us-ascii?Q?AsW8CuvQSHAGXMnGRUXbTZMEgYvH5FiZJ/fZnV8BaZLJzGOTLPJXna9HMx3d?=
 =?us-ascii?Q?FjgsMq8LKqrfnKdSwtklULG1WHQR0NtD4AzYscs787A1Y7XFhIYm0RAjbvQ2?=
 =?us-ascii?Q?EpYCTBGIgmjNn9m5JihQOIJEVz+NQWWxMuOKj4JhlL/H8mjhqcRU+J7KyeLn?=
 =?us-ascii?Q?04t/7r1i4uuhHQugT9qe32RtXoCuF+7VLD0doUNDzYDSTnnGaKr2SE5H8FWm?=
 =?us-ascii?Q?qP10KJPN7Z8cu9PvC+d3wk3bjBMTozWniwdLbMQwdEYoaMK7+OyXmC/Gp07k?=
 =?us-ascii?Q?7MglXPqxkltYd6RRTe6fwvDGVMtmFIBk73xxxXdRnkFAW1pTFi8ERWG0Hb4W?=
 =?us-ascii?Q?ot0HeHvYJr91iatAKwIGtKd79I1rZhDQfXquYGzOlkBVUtUBk0F8r3LRYQbC?=
 =?us-ascii?Q?vPJsY4Z5JuaIR8Gj2Ty9ADwj2jXjcJnAC2MDAde0uTDCSttINXDqiePUMCNs?=
 =?us-ascii?Q?xLhTfhNeMhnrC6XwUluU+UrG4pJFFbcuCuAPO1C4XzNSwndMOs5vKNzOxcAd?=
 =?us-ascii?Q?toILabfDb9vQB99pG1Qofu79ZIQzQlRU+J5DaNy5aK69lThROhYHn0CO2L1+?=
 =?us-ascii?Q?EBu9zZGq5epow537M1Dtvox0oXmgF9Q58o02I5b50tkE2wDQHh/OUKIHM+q8?=
 =?us-ascii?Q?SeqxefGXDJyGkxGWQSbr1IjKS8c9YspoGcBQm1FnnVoykc87jjammAN73YU4?=
 =?us-ascii?Q?H2SrUN3DJa5R2+ooG+Lxb0ks9LqtaEaiklVBjp3W9zXwx1GmCXbv6JDVv/aN?=
 =?us-ascii?Q?1b1F8xKaGQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d3ac8b4-34e1-4d98-8b23-08df15214aae
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2026 01:08:04.2527
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QjFa5+5lwWxgn8TNmQYUT6caxy8dQSCw/vkXx7QoJmPRZYh3PKH1lR8QrkAsdBNtB5Z/YMtBN45Xg4W2dvHD8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8349

GSP-RM posts RPC and GMC messages on one queue. Every element opens with
the same transport headers, whose NVDM type selects whether an RPC
header or a GMC header follows.

Each receive path assumed the header of its own kind. An RPC wait read a
GMC element through the RPC header layout, where the GMC sequence number
occupies the function code's field, so a GMC response looked like the
RPC no-op and was consumed silently, and a GMC event looked like an
unknown function. The GMC wait logged an RPC element as a dropped
element, so an OS error record posted during the GSP_INIT wait was never
logged as an error.

Decode every element once, at the transport level, and dispatch on its
NVDM type, so that each receive path decodes its own kind and logs the
other kind as what it is. An element whose NVDM type the queue does not
use poisons the queue, as bad framing does.

The r000 GSP-RM posts no element for the path that the driver is not
waiting in, but the protocol allows it, so both receive paths must
accept both kinds.

Assisted-by: LLM
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 Documentation/gpu/nova/core/interrupts.rst |  31 +-
 drivers/gpu/nova-core/gsp/cmdq.rs          | 334 +++++++++++----------
 drivers/gpu/nova-core/gsp/fw.rs            |  30 +-
 3 files changed, 201 insertions(+), 194 deletions(-)

diff --git a/Documentation/gpu/nova/core/interrupts.rst b/Documentation/gpu/nova/core/interrupts.rst
index 8519c73e9989..fa124bc8ca05 100644
--- a/Documentation/gpu/nova/core/interrupts.rst
+++ b/Documentation/gpu/nova/core/interrupts.rst
@@ -562,17 +562,23 @@ GSP.
 Draining the GSP-to-CPU queue
 -----------------------------
 
-The queue carries command replies and unsolicited events, and a message's
-function code says which it is.
+The queue carries RPC messages and GMC messages. GMC is the GPU Management
+Controller, and its API is ABI-stable. Every element opens with the same queue
+element header, which holds the MCTP and NVDM headers, and the NVDM type in
+that header selects which kind of message header follows. An RPC message is a
+command reply or an unsolicited event, and the two differ in the function code.
 
 * A function code that matches the awaited reply: the message is decoded and
   returned to the caller that sent the command.
-* Anything else is an event. An OS error record and a robust-channel record
-  are logged at error level, and an unrecognized function code at warning
-  level. The other known events (GSP logs, libos prints, assertion records,
-  lifecycle notices) need no action and get no line of their own, because the
-  receive trace at debug level already records every message's arrival with
-  its sequence number, function code, and length.
+* Any other RPC message is an event. An OS error record and a robust-channel
+  record are logged at error level, and an unrecognized function code at
+  warning level. The other known events (GSP logs, LIBOS prints, assertion
+  records, lifecycle notices) need no action and get no line of their own,
+  because the receive trace at debug level already records every message's
+  arrival with its sequence number, function code, and length.
+* A GMC message carries a command id in place of a function code. Only the
+  ``GSP_INIT`` wait during boot claims GMC messages, so one that arrives
+  anywhere else is logged at warning level and dropped.
 
 A command's reply must carry the RPC sequence number that nova-core wrote into
 the command, as well as its function code. A message with the awaited function
@@ -585,10 +591,11 @@ The read pointer advances past every message, whether it matched, was an event,
 or matched but failed to decode, so a message is never left at the queue head
 for the next receive to parse again.
 
-Corrupt framing is the exception. An element that fails framing validation has
-no trustworthy length, so the read pointer cannot advance past it. Such a
-failure poisons the queue: nova-core logs it once, and every later receive
-fails with ``EIO`` until the device is reset.
+Corrupt framing is the exception. An element that fails framing validation, or
+that carries an NVDM type that the queue does not use, has no trustworthy
+length, so the read pointer cannot advance past it. Such a failure poisons the
+queue: nova-core logs it once, and every later receive fails with ``EIO`` until
+the device is reset.
 
 The polling path and the IRQ thread both read the queue under the command-queue
 mutex. Replies and events share one queue and one read pointer, so one lock is
diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gsp/cmdq.rs
index 2258c4f2cfd1..2664ace70ef8 100644
--- a/drivers/gpu/nova-core/gsp/cmdq.rs
+++ b/drivers/gpu/nova-core/gsp/cmdq.rs
@@ -317,6 +317,11 @@ fn driver_write_area_size(&self) -> usize {
         num::u32_as_usize(self.free_slots()) * GSP_PAGE_SIZE
     }
 
+    /// Returns `true` if the GSP has posted a message that the driver has not consumed.
+    fn has_unread_message(&self) -> bool {
+        self.gsp_write_ptr() != self.cpu_read_ptr
+    }
+
     /// Returns the region of the GSP message queue that the driver may read, as two slices
     /// because the ring wraps.
     fn driver_read_area(&self) -> (&[[u8; GSP_PAGE_SIZE]], &[[u8; GSP_PAGE_SIZE]]) {
@@ -462,9 +467,9 @@ struct GspCommand<'a, H> {
     contents: (&'a mut [u8], &'a mut [u8]),
 }
 
-/// A message ready to be processed from the message queue.
+/// An RPC message ready to be processed from the message queue.
 ///
-/// This is the type returned by [`CmdqInner::wait_for_msg`].
+/// This is the message that [`QueueElement::Rpc`] carries.
 struct GspMessage<'a> {
     // Reference to the header of the message.
     header: &'a GspMsgElement,
@@ -492,23 +497,50 @@ struct GmcMessage<'a> {
 ///
 /// This is the type returned by [`CmdqInner::wait_for_element`].
 enum QueueElement<'a> {
+    /// An RM RPC message.
+    Rpc(GspMessage<'a>),
     /// A GMC API message.
     Gmc(GmcMessage<'a>),
-    /// An element whose NVDM type names another kind of message, such as an RM RPC. Only its
-    /// queue element header is decoded.
-    Other(&'a QueueElementHeader),
 }
 
 impl QueueElement<'_> {
     /// Returns the number of queue slots that the element occupies.
     fn element_count(&self) -> u32 {
         match self {
+            Self::Rpc(message) => message.header.element_count(),
             Self::Gmc(message) => message.header.element_count(),
-            Self::Other(element_header) => element_header.element_count(),
         }
     }
 }
 
+/// The headers that open a queue element of one kind of message: the queue element header, then
+/// the RPC header or the GMC API header.
+trait MessageHeaders: FromBytes {
+    /// Name of the kind of message, for the log line written when an element of this kind poisons
+    /// the queue.
+    const KIND: &'static str;
+
+    /// Returns the length of the payload that follows the message header, or `None` if the queue
+    /// element header declares a message shorter than the message header.
+    fn payload_length(&self) -> Option<usize>;
+}
+
+impl MessageHeaders for GspMsgElement {
+    const KIND: &'static str = "RPC";
+
+    fn payload_length(&self) -> Option<usize> {
+        GspMsgElement::payload_length(self)
+    }
+}
+
+impl MessageHeaders for GspGmcMsgElement {
+    const KIND: &'static str = "GMC";
+
+    fn payload_length(&self) -> Option<usize> {
+        GspGmcMsgElement::payload_length(self)
+    }
+}
+
 /// GSP command queue.
 ///
 /// Provides the ability to send commands and receive messages from the GSP using a shared memory
@@ -668,16 +700,16 @@ pub(crate) fn await_msg<M: MessageFromGsp>(&self) -> Result<M>
         self.inner.lock().await_msg(None)
     }
 
-    /// Logs and consumes every message the GSP has already posted, and returns without waiting for
-    /// more.
+    /// Logs and consumes every element that the GSP has already posted, and returns without waiting
+    /// for more.
     ///
-    /// No caller is waiting for a reply while this holds the queue mutex, so every message is
+    /// No caller is waiting for a reply while this holds the queue mutex, so every element is
     /// logged as an event. See "Draining the GSP-to-CPU queue" in
     /// `Documentation/gpu/nova/core/interrupts.rst`.
     ///
     /// # Errors
     ///
-    /// `EIO` if the queue is poisoned, or if a message fails framing validation.
+    /// `EIO` if the queue is poisoned, or if an element fails framing validation.
     pub(crate) fn drain(&self) -> Result {
         self.inner.lock().drain()
     }
@@ -690,11 +722,11 @@ struct CmdqInner<'a> {
     /// Next RPC sequence number, advanced once per command, however many messages the command is
     /// split into.
     rpc_seq: u32,
-    /// Set once a message fails framing validation. Every later receive fails, since
-    /// the bad message cannot be skipped. See "Draining the GSP-to-CPU queue" in
+    /// Set once an element fails framing validation. Every later receive fails, because the bad
+    /// element cannot be skipped. See "Draining the GSP-to-CPU queue" in
     /// `Documentation/gpu/nova/core/interrupts.rst`.
     ///
-    /// A [`Cell`] because [`Self::wait_for_msg`] sets it through `&self`.
+    /// A [`Cell`], because the receive path sets it through `&self`.
     poisoned: Cell<bool>,
     /// Memory area shared with the GSP for communicating commands and messages.
     gsp_mem: DmaGspMem<'a>,
@@ -800,7 +832,7 @@ fn send_command<M>(&mut self, command: M) -> Result<u32>
 
     /// Logs `reason`, poisons the queue, and returns `EIO` for the caller to propagate.
     fn poison(&self, reason: fmt::Arguments<'_>) -> Error {
-        dev_err!(&self.dev, "GSP RPC: receive: queue poisoned: {}\n", reason);
+        dev_err!(&self.dev, "GSP receive: queue poisoned: {}\n", reason);
         self.poisoned.set(true);
 
         EIO
@@ -851,81 +883,17 @@ fn send_gmc(&mut self, command_id: u32, payload: &[u8], max_response_size: u32)
         Ok(())
     }
 
-    /// Waits for a message to become available on the message queue.
-    ///
-    /// This validates the queue element header and the lengths that it declares, and does not
-    /// interpret the RPC header that follows it.
-    ///
-    /// Returns the message's [`GspMsgElement`] and its contents as two byte slices, the second of
-    /// which is empty unless the message wraps around the end of the message queue.
-    ///
-    /// # Errors
-    ///
-    /// - `ETIMEDOUT` if `timeout` has elapsed before any message becomes available.
-    /// - `EIO` if the queue is already poisoned, or if the framing is invalid, which poisons it
-    ///   (see [`Self::poisoned`]).
-    fn wait_for_msg(&self, timeout: Delta) -> Result<GspMessage<'_>> {
-        if self.poisoned.get() {
-            return Err(EIO);
-        }
-
-        // Wait for a message to arrive from the GSP.
-        let (slice_1, slice_2) = read_poll_timeout(
-            || Ok(self.gsp_mem.driver_read_area()),
-            |driver_area| !driver_area.0.is_empty(),
-            Delta::from_millis(1),
-            timeout,
-        )
-        .map(|(slice_1, slice_2)| (slice_1.as_flattened(), slice_2.as_flattened()))?;
-
-        // Extract the `GspMsgElement`.
-        let Some((header, slice_1)) = GspMsgElement::from_bytes_prefix(slice_1) else {
-            return Err(self.poison(fmt!(
-                "read area of {} bytes is shorter than a message header",
-                slice_1.len()
-            )));
-        };
-
-        if header.validate_framing().is_err() {
-            return Err(self.poison(fmt!(
-                "RPC element has a bad queue element header, declared length {}",
-                header.length()
-            )));
-        }
-
-        dev_dbg!(
-            &self.dev,
-            "GSP RPC: receive: seq# {}, function={:?}, length=0x{:x}\n",
-            header.sequence(),
-            header.function(),
-            header.length(),
-        );
-
-        let Some(payload_length) = header.payload_length() else {
-            return Err(self.poison(fmt!(
-                "RPC message seq# {} declares a message shorter than the RPC header",
-                header.sequence()
-            )));
-        };
-
-        let contents = self.payload_slices(slice_1, slice_2, payload_length)?;
-
-        Ok(GspMessage { header, contents })
-    }
-
-    /// Receives a message from the GSP.
-    ///
-    /// [`Self::match_rpc_reply`] decodes the message as the awaited reply of type `M`, or logs it.
-    /// `expected_seq` narrows the match.
+    /// Receives an element from the GSP.
     ///
-    /// The read pointer advances past the message in every case, including a decode failure.
+    /// [`Self::match_rpc_reply`] decodes an RPC message as the awaited reply of type `M`, or logs
+    /// it. `expected_seq` narrows the match. A GMC message is logged as unclaimed.
     ///
     /// # Errors
     ///
-    /// - `ETIMEDOUT` if `timeout` has elapsed before any message becomes available.
-    /// - `EIO` if the queue is poisoned or the message fails framing validation (see
-    ///   [`Self::wait_for_msg`]), or if the matched message is too short for `M::Message`.
-    /// - `ENOMSG` if the message was not the awaited reply.
+    /// - `ETIMEDOUT` if `timeout` has elapsed before any element becomes available.
+    /// - `EIO` if the queue is poisoned or the element fails framing validation (see
+    ///   [`Self::wait_for_element`]), or if the matched message is too short for `M::Message`.
+    /// - `ENOMSG` if the element is not the awaited reply.
     ///
     /// Error codes returned by [`MessageFromGsp::read`] are propagated as-is.
     fn receive_msg<M: MessageFromGsp>(
@@ -937,17 +905,14 @@ fn receive_msg<M: MessageFromGsp>(
         // This allows all error types, including `Infallible`, to be used for `M::InitError`.
         Error: From<M::InitError>,
     {
-        let message = self.wait_for_msg(timeout)?;
-
-        // An early return here would leave the read pointer on this message.
-        let result = self.match_rpc_reply::<M>(&message, expected_seq);
-
-        // Advance the read pointer past this message.
-        self.gsp_mem.advance_cpu_read_ptr(u32::try_from(
-            message.header.length().div_ceil(GSP_PAGE_SIZE),
-        )?);
+        self.consume_element(timeout, |this, element| match element {
+            QueueElement::Gmc(message) => {
+                this.log_gmc_event(message.header);
 
-        result
+                Err(ENOMSG)
+            }
+            QueueElement::Rpc(message) => this.match_rpc_reply::<M>(&message, expected_seq),
+        })
     }
 
     /// Decodes `message` as the awaited reply of type `M`, or logs it.
@@ -1020,15 +985,15 @@ fn match_rpc_reply<M: MessageFromGsp>(
 
     /// Receives a message of type `M`, waiting up to [`Cmdq::RECEIVE_TIMEOUT`] from the call.
     ///
-    /// Any other message that arrives first is logged as an event and does not extend the
-    /// deadline. `expected_seq` narrows the match as [`Self::match_rpc_reply`] describes.
+    /// Any other element that arrives first is logged and does not extend the deadline.
+    /// `expected_seq` narrows the match as [`Self::match_rpc_reply`] describes.
     ///
     /// # Errors
     ///
     /// - `ETIMEDOUT` if no message of type `M` arrives before the deadline, however many other
-    ///   messages arrive while waiting.
-    /// - `EIO` if the queue is poisoned or a message fails framing validation (see
-    ///   [`Self::wait_for_msg`]).
+    ///   elements arrive while waiting.
+    /// - `EIO` if the queue is poisoned or an element fails framing validation (see
+    ///   [`Self::wait_for_element`]).
     ///
     /// Error codes returned by [`MessageFromGsp::read`] are propagated as-is.
     fn await_msg<M: MessageFromGsp>(&mut self, expected_seq: Option<u32>) -> Result<M>
@@ -1050,11 +1015,11 @@ fn await_msg<M: MessageFromGsp>(&mut self, expected_seq: Option<u32>) -> Result<
         }
     }
 
-    /// Logs an event, meaning a message that no caller was waiting for.
+    /// Logs an event, meaning an RPC message that no caller is waiting for.
     ///
     /// An OS error or robust-channel record is logged at error level and an unknown function code
     /// at warning level. Every other event is recorded only by the receive trace in
-    /// [`Self::wait_for_msg`].
+    /// [`Self::consume_element`].
     fn log_event(&self, function: Result<MsgFunction, u32>, seq: u32) {
         match function {
             Ok(MsgFunction::OsErrorLog) => {
@@ -1080,27 +1045,35 @@ fn log_event(&self, function: Result<MsgFunction, u32>, seq: u32) {
         }
     }
 
-    /// Logs and consumes every message the queue holds.
+    /// Logs a GMC message that no caller is waiting for: a response to a request that has already
+    /// timed out, or an event that arrives outside the boot sequence.
+    fn log_gmc_event(&self, header: &GspGmcMsgElement) {
+        dev_warn!(
+            &self.dev,
+            "GSP GMC: dropping unclaimed message (seq {}, command_id=0x{:x})\n",
+            header.gmc.sequence,
+            header.gmc.command_id(),
+        );
+    }
+
+    /// Logs and consumes every element that the queue holds.
     ///
     /// # Errors
     ///
-    /// `EIO` if the queue is poisoned, a message fails framing validation, or a
-    /// message's page count overflows a `u32`.
+    /// `EIO` if the queue is poisoned or an element fails framing validation.
     fn drain(&mut self) -> Result {
-        while !self.gsp_mem.driver_read_area().0.is_empty() {
-            // A message is available, so this returns without waiting.
-            let msg = self.wait_for_msg(Delta::ZERO)?;
-
-            let pages =
-                u32::try_from(msg.header.length().div_ceil(GSP_PAGE_SIZE)).map_err(|_| {
-                    dev_err!(&self.dev, "GSP drain: message length overflow\n");
-                    EIO
-                })?;
-            let function = msg.header.function();
-            let seq = msg.header.sequence();
+        while self.gsp_mem.has_unread_message() {
+            // An element is available, so this returns without waiting.
+            self.consume_element(Delta::ZERO, |this, element| {
+                match element {
+                    QueueElement::Rpc(message) => {
+                        this.log_event(message.header.function(), message.header.sequence());
+                    }
+                    QueueElement::Gmc(message) => this.log_gmc_event(message.header),
+                }
 
-            self.gsp_mem.advance_cpu_read_ptr(pages);
-            self.log_event(function, seq);
+                Ok(())
+            })?;
         }
 
         Ok(())
@@ -1146,18 +1119,21 @@ fn payload_slices<'a>(
     ///     | queue element header: magic, MCTP  |  validated
     ///     |   header, NVDM header, lengths     |
     ///     +------------------------------------+
-    ///     | message header                     |  decoded as a GMC API header when the NVDM type
-    ///     +------------------------------------+  is GmcApi, and left undecoded otherwise
+    ///     | message header                     |  decoded as the RPC header or the GMC API
+    ///     +------------------------------------+  header. The NVDM type selects between the two.
     ///     | payload                            |  truncated to the length that the queue
     ///     +------------------------------------+  element header declares
     /// ```
     ///
+    /// The element stays at the queue head, and the payload slices point into it, so the read
+    /// pointer must not advance until they are dropped.
+    ///
     /// # Errors
     ///
-    /// - `ETIMEDOUT` if no element arrives within `timeout`.
-    /// - `EIO` if the queue is already poisoned, or if the framing is invalid, or if the GMC API
-    ///   header and the queue element header declare different payload sizes. Each of these
-    ///   poisons the queue (see [`Self::poisoned`]).
+    /// - `ETIMEDOUT` if `timeout` has elapsed before any element becomes available.
+    /// - `EIO` if the queue is already poisoned, or if the framing, the NVDM type or a declared
+    ///   length is invalid, or if the GMC API header and the queue element header declare
+    ///   different payload sizes. Each of these poisons the queue (see [`Self::poisoned`]).
     fn wait_for_element(&self, timeout: Delta) -> Result<QueueElement<'_>> {
         if self.poisoned.get() {
             return Err(EIO);
@@ -1186,38 +1162,68 @@ fn wait_for_element(&self, timeout: Delta) -> Result<QueueElement<'_>> {
             )));
         }
 
-        if !element_header.is_nvdm_type(NvdmType::GmcApi) {
-            return Ok(QueueElement::Other(element_header));
+        match element_header.nvdm_type() {
+            Ok(NvdmType::RmRpc) => {
+                let (header, contents) = self.split_element::<GspMsgElement>(slice_1, slice_2)?;
+
+                Ok(QueueElement::Rpc(GspMessage { header, contents }))
+            }
+            Ok(NvdmType::GmcApi) => {
+                let (header, contents) =
+                    self.split_element::<GspGmcMsgElement>(slice_1, slice_2)?;
+
+                // GSP-RM writes both sizes from the same payload, so a difference means that one
+                // of the two headers is corrupt, and the driver cannot know which.
+                let payload_length = contents.0.len() + contents.1.len();
+                if payload_length != num::u32_as_usize(header.gmc.size) {
+                    return Err(self.poison(fmt!(
+                        "GMC seq# {}: GMC API header declares {} payload bytes, element header {}",
+                        header.gmc.sequence,
+                        header.gmc.size,
+                        payload_length
+                    )));
+                }
+
+                Ok(QueueElement::Gmc(GmcMessage { header, contents }))
+            }
+            Ok(nvdm_type) => Err(self.poison(fmt!(
+                "element carries NVDM type {:?}, which the GSP queues do not use",
+                nvdm_type
+            ))),
+            Err(_) => Err(self.poison(fmt!("element carries an unknown NVDM type"))),
         }
+    }
 
-        let Some((header, slice_1)) = GspGmcMsgElement::from_bytes_prefix(slice_1) else {
+    /// Splits the read area into the headers of type `H` that open the element and the payload
+    /// slices that follow them.
+    ///
+    /// # Errors
+    ///
+    /// - `EIO` if the read area is shorter than the headers, if the queue element header declares
+    ///   a message shorter than the message header, or if fewer payload bytes are readable than
+    ///   declared. Each of these poisons the queue.
+    fn split_element<'a, H: MessageHeaders>(
+        &self,
+        slice_1: &'a [u8],
+        slice_2: &'a [u8],
+    ) -> Result<(&'a H, (&'a [u8], &'a [u8]))> {
+        let Some((header, slice_1)) = H::from_bytes_prefix(slice_1) else {
             return Err(self.poison(fmt!(
-                "read area of {} bytes is shorter than a GMC element header",
-                slice_1.len()
+                "{} element: read area is shorter than the message header",
+                H::KIND
             )));
         };
 
         let Some(payload_length) = header.payload_length() else {
             return Err(self.poison(fmt!(
-                "GMC message seq# {} declares a message shorter than the GMC API header",
-                header.gmc.sequence
+                "{} element declares a message shorter than the message header",
+                H::KIND
             )));
         };
 
-        // GSP-RM writes both sizes from the same payload, so a difference means that one of the
-        // two headers is corrupt, and the driver cannot know which.
-        if payload_length != num::u32_as_usize(header.gmc.size) {
-            return Err(self.poison(fmt!(
-                "GMC seq# {}: GMC API header declares {} payload bytes, element header {}",
-                header.gmc.sequence,
-                header.gmc.size,
-                payload_length
-            )));
-        }
-
         let contents = self.payload_slices(slice_1, slice_2, payload_length)?;
 
-        Ok(QueueElement::Gmc(GmcMessage { header, contents }))
+        Ok((header, contents))
     }
 
     /// Waits for the next queue element, passes it to `f`, and advances the read pointer past it.
@@ -1240,6 +1246,23 @@ fn consume_element<R>(
         let element = self.wait_for_element(timeout)?;
         let element_count = element.element_count();
 
+        match &element {
+            QueueElement::Rpc(message) => dev_dbg!(
+                &self.dev,
+                "GSP RPC: receive: seq# {}, function={:?}, length=0x{:x}\n",
+                message.header.sequence(),
+                message.header.function(),
+                message.header.length(),
+            ),
+            QueueElement::Gmc(message) => dev_dbg!(
+                &self.dev,
+                "GSP GMC: receive: seq# {}, command_id=0x{:x}, length=0x{:x}\n",
+                message.header.gmc.sequence,
+                message.header.gmc.command_id(),
+                message.header.length(),
+            ),
+        }
+
         let result = f(self, element);
 
         self.gsp_mem.advance_cpu_read_ptr(element_count);
@@ -1250,8 +1273,7 @@ fn consume_element<R>(
     /// Receives the next queue element and, if it is a GMC element, passes it to `handler`.
     ///
     /// `handler` receives the headers that open the element and the payload that follows the GMC
-    /// API header, as two slices because the ring may wrap, and returns `None` for an element that
-    /// it declines.
+    /// API header, as two slices because the ring may wrap. An RPC element is logged as an event.
     ///
     /// Returns `Ok(None)` when `handler` declines the element or when the element is not a GMC
     /// element.
@@ -1259,7 +1281,7 @@ fn consume_element<R>(
     /// # Errors
     ///
     /// - `ETIMEDOUT` if no element arrives within `timeout`.
-    /// - `EIO` if the queue is poisoned or the queue element header is invalid, as
+    /// - `EIO` if the queue is poisoned or the element is invalid, as
     ///   [`Self::wait_for_element`] describes.
     ///
     /// Errors from `handler` are propagated as-is.
@@ -1269,23 +1291,13 @@ fn receive_gmc_and_dispatch<R>(
         handler: impl FnOnce(&GspGmcMsgElement, &[u8], &[u8]) -> Result<Option<R>>,
     ) -> Result<Option<R>> {
         self.consume_element(timeout, |this, element| match element {
-            QueueElement::Other(_) => {
-                dev_warn!(&this.dev, "GSP GMC: dropping non-GMC queue element\n");
+            QueueElement::Rpc(message) => {
+                this.log_event(message.header.function(), message.header.sequence());
 
                 Ok(None)
             }
             QueueElement::Gmc(message) => {
-                let header = message.header;
-
-                dev_dbg!(
-                    &this.dev,
-                    "GSP GMC: event: seq# {}, command_id=0x{:x}, length=0x{:x}\n",
-                    header.gmc.sequence,
-                    header.gmc.command_id(),
-                    header.length(),
-                );
-
-                handler(header, message.contents.0, message.contents.1)
+                handler(message.header, message.contents.0, message.contents.1)
             }
         })
     }
@@ -1295,8 +1307,8 @@ fn receive_gmc_and_dispatch<R>(
     ///
     /// The response's payload is passed to `decode`, as two slices because the ring may wrap.
     /// Every other GMC element that arrives first is passed to `on_other` with the headers that
-    /// open it and its payload slices, and any other element is logged. Neither kind of element
-    /// extends the deadline.
+    /// open it and its payload slices, and an RPC element is logged as an event. Neither kind of
+    /// element extends the deadline.
     ///
     /// # Errors
     ///
diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/fw.rs
index ced7da14c0b2..f3dff49af2bf 100644
--- a/drivers/gpu/nova-core/gsp/fw.rs
+++ b/drivers/gpu/nova-core/gsp/fw.rs
@@ -535,23 +535,6 @@ pub(crate) fn length(&self) -> usize {
         self.element_header.element_len()
     }
 
-    /// Validates the queue element header and that the element is long enough to hold the RPC
-    /// header after it.
-    ///
-    /// # Errors
-    ///
-    /// - `EIO` if [`QueueElementHeader::validate`] fails, or if the declared element length is
-    ///   shorter than the two headers together.
-    pub(crate) fn validate_framing(&self) -> Result {
-        self.element_header.validate().map_err(|_| EIO)?;
-
-        if self.length() < size_of::<Self>() {
-            return Err(EIO);
-        }
-
-        Ok(())
-    }
-
     // Returns the sequence number of the message.
     pub(crate) fn sequence(&self) -> u32 {
         self.rpc.sequence
@@ -665,6 +648,15 @@ pub(crate) fn element_count(&self) -> u32 {
             .div_ceil(num::usize_into_u32::<GSP_PAGE_SIZE>())
     }
 
+    /// Returns the NVDM type.
+    ///
+    /// # Errors
+    ///
+    /// - `EINVAL` if the field holds no known NVDM type.
+    pub(crate) fn nvdm_type(&self) -> Result<NvdmType> {
+        self.nvdm.nvdm_type()
+    }
+
     /// Validates the queue element header.
     ///
     /// Returns the first check that fails as a [`QueueElementHeaderError`].
@@ -692,10 +684,6 @@ pub(crate) fn validate(&self) -> Result<(), QueueElementHeaderError> {
 
         Ok(())
     }
-
-    pub(crate) fn is_nvdm_type(&self, nvdm_type: NvdmType) -> bool {
-        self.nvdm.validate(nvdm_type)
-    }
 }
 
 /// The check of [`QueueElementHeader::validate`] that a queue element header fails.
-- 
2.55.0

