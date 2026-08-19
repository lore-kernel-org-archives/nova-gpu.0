Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010003.outbound.protection.outlook.com [52.101.46.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4F0D3C3458
	for <nova-gpu@lists.linux.dev>; Wed, 19 Aug 2026 03:52:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787111585; cv=fail; b=evEcHMypqKlDN/9RC9rv8wTOEdTBSsoSud6t0zKIoTJWmztCtKhncO7Bwh8QF4+59wb0hdXoWSlfceEIFMuxwGoSjzcv4G/Ia1opiHdu/p5T0K3B64gV9H8dHit/+rwpTIVnA2YIK8LOz4N9J+vnlw/wh6HpnoI5Q80umyTZwQ4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787111585; c=relaxed/simple;
	bh=AKBTXKcdGOESnOb/RyXXxECcOJD5wkEOQn0hHXboxQ4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=KeUzDQPAWoPGOmUzHqohiQlUQ6ui1SNX1x9MyLYnS1PUSgzPLgVWElpijSkZyxD4JWG4lo6KzwQEB+pi/lRQCR5ihsS7U6zFmIBDBDlRH+AscQzvcOhh9tYQeJNJa0grO3JPjuLTG/EJjSj9ad9LHZTZRjIBzFYwRHxGQM3ndtA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=V8q72XjB; arc=fail smtp.client-ip=52.101.46.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="V8q72XjB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pa4yjIfEHBFuCSberf5hZeHI1IVTwoTExT5/vzbYEJz39kdPT4DTvM+tqJh9GLX3gx2z1TCLVgtJkgs4ORPX+Ev+OvyKbG7gMBt/1WD+Pd6EkSCaJzHDpOPX7H9qpNC1pYT5+TpmvXm7foUkkA8WnsLrt73++mfNTS90rs6oq8aY84yrCpCpWJQ7qKai5VVPXS2nIw/wmCSc7x5CKfkLQwVtAPfOBAWmbjuQBilr2d3ZbEDGUAZOB0PyeWZ/saaW1LAY/E01PtwQE7E8m7q/JEviBQ8sRgEsmjeaa6pwRqzfqIuMIXQ3EnLRqXb9G4CN2rRlAdYbq/yuPPJov2xuuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GOfsVrUz6ZiBI5G/G35+2Kvkaug4cfcLHBiv+mbYhdU=;
 b=Or4aqcAM8FtlxQuRVm3QTvfLjZIxJXH51rQ5UnVOrR6ATAwi+WPhhFR6GexBuQfqz7uPoZBptsT9zFrbmyZu6howl3/YAkSzS0RzHvSm7k0K9/lCXbtLdUsycMrr0HJnw0SiaHvp5VzaN4XlouhpWxXAM+RCfBR99ds1KGcIXyE/0Z+cUXxuL6aVFHDGc6FT6G+i+iIdJg2oCrn0wNStCQAgRe79wWh8I897/DdU5qbcosjNgN+Hw+ckckRkI0PG5a5y+fWN1pqLQoy+2rz2kZrDzxoQc0CE0MlaU0oE0+O1fjU26SmRjESrbOtFTDmFG79f7ODHgB0FDy0OeYPP9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GOfsVrUz6ZiBI5G/G35+2Kvkaug4cfcLHBiv+mbYhdU=;
 b=V8q72XjBBUy30/NE9nz6XA5DjxFc4cTFio98vMyCdpNFzpGWvpj4yU6lzxk2rYWDRq68hTOFA/L4613dPajQEdAwnO47Wma39XjOG9HrWou2kBzwKodfNVuKnlymefrbqz1TXkW8tqxy9/N8pTt3LOf+xWZg0iVgdNN18+i3DbWeXS2VXOnbzwh+F4jy+kGwNDJkMxNepSFr2TuC3iRA0bOS/UnAuX/DveNYOJ2yR8aQYKMblt5W6m662aVFC7YsPGIAbMIwVJEBJjJka7AmphEjSm9veCr/6t/2qn/M8xNPEMQi2cCALvefknyfm9cIttncQLtxIJ+KrL0P6SfeGQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 DS7PR12MB6287.namprd12.prod.outlook.com (2603:10b6:8:94::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.315.17; Wed, 19 Aug 2026 03:52:39 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%4]) with mapi id 15.21.0339.007; Wed, 19 Aug 2026
 03:52:39 +0000
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
Subject: [PATCH 14/27] gpu: nova-core: add GMC API message types
Date: Tue, 18 Aug 2026 20:52:07 -0700
Message-ID: <20260819035221.336390-15-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260819035221.336390-1-jhubbard@nvidia.com>
References: <20260819035221.336390-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0107.namprd03.prod.outlook.com
 (2603:10b6:a03:333::22) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|DS7PR12MB6287:EE_
X-MS-Office365-Filtering-Correlation-Id: 85694ab0-4b5c-4ca5-be91-08defda5502a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|7416014|23010399003|366016|6133799003|3023799007|56012099006|10067099003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	iOnzkqbIsIXipZxMBkZkXianx90JGAMwDk5b9gMGGe6LFimUCT8caguXgiSGuFPaeOu48EECi9MhcVfdP7VoMGBKedci0py5r0HKm+AeAOZRiscHOEIE2jrHeJqr46d8qhiL2ns1yj1s/HsNrEvwh1rnxkz098iDja2UFjCQS7C8ZFv10vQTQpmwWvmpdkrRVFYr9A2XWVNzelsfXH+E7cOAXq9gdOIGL19XGE8qS6yiib0TU23wIQbTlxtaFZTy5CfKcAg+oMADDIqVyC/pMQIbHs5b/oIoKUcl22zypkW6YjMM7QwKTG6K8CBv3g3fNYwznadfX11SJLmM8ZHIJoQWrQpsaxASP0XLOgN/aGkfrbORmZ/K1imCanhB/cQtxa2/esddZpBh9yMfyETaM16zaN5/Qh+LO0L9FEG5VLs9hiAACQS9WW0sjwZJA9cfD9rqF/wA48epkxeiIwwcOQ/izG7YSfBr8iOLpbQUxQK+mBT24ZjLDXmI3UqJB+WJowBGoiQgZT3TEBPw7HIqo924hnemW6xEZYmV5uKUHKQf+m5rrslGWteSS4pKrRQm/vGUmFRTJJkycR93NH/Z+hCvwwO5ane2hXzeOAIau2fUDVA2wNB53DqWyfThRQX88hb0Rubx2QToORx5X0iWTWIle7cP2/28iC6LhY+Qjqw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(23010399003)(366016)(6133799003)(3023799007)(56012099006)(10067099003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?j7HgAQe95s4wQzxsPfTikvG7eTNisBMh2Beu4FHHNL2RYpXBNKx0legbAihQ?=
 =?us-ascii?Q?GdqDymdgcyXMbF6YkXrHmMsBHGix0OZ/2ORvCxVz4fZy8lM3kRvMpyMMU2WC?=
 =?us-ascii?Q?54LmmHEcYDVyqg/WVXeCiy0Qw3Vpr0AwBNfXH7HtY1sJbT9dtjQlv54pi/8q?=
 =?us-ascii?Q?5ZyBpqxAGvqWhROJ3qg/ZASyMJag5El1WGqlfoKV8Ptny1eb+U1WtZZdMl9a?=
 =?us-ascii?Q?QX/82+jff4Vi/pK9Ch0fHt7kDqT+Ytl5OuYa7YwUZXJAwpqloNMLoWff3fBZ?=
 =?us-ascii?Q?gudav1fMcT1dCKxF2uM9G4f+0fhYgkau4xnutrbLwzwebsZwMjt9bMbwOVzP?=
 =?us-ascii?Q?s/QJAYwbsa315tEtop7C2s3YGwj2ZOIxBsm5gg55NiNLayze3MFKTAaVdWkE?=
 =?us-ascii?Q?zjdrazYaQOm7D0G2vSv5PvCaxW30GfjJMuBAJRsMsma/NsNQmDNkQ9HynRyf?=
 =?us-ascii?Q?DCJB683HBcfS8HN/EBHUvQgjUoCNNE114/A5QaNQ8z4EbViG2gK9NEjGuAL3?=
 =?us-ascii?Q?xFKnKyAhrJmSqbnACR85F/UpD2TGXxo9g4Bqj3qmWQ26iV8u2HUWXTN+zdFv?=
 =?us-ascii?Q?FyLWDXOygC6o05C80RdtzoE2DsL5tOkUl7s8+w1ZDzJOYFFEXpM1gg6cCBZF?=
 =?us-ascii?Q?zTXT3r0iMqhiKONe7qU8Di+u/VtZQG6XN3DjsW2gTNnaap3aHMgL/mDFvtfF?=
 =?us-ascii?Q?+CIV6Qxi+BykabxbzEiOri8COneUBpt7npvafBdmEm4YeAQj15Ee7YeFYyyL?=
 =?us-ascii?Q?JlzG2KC8xcTUoSU14RObu+TDcyHLjD2qbjiM0e7AIC58uDBtpQUXK7H0A3Zl?=
 =?us-ascii?Q?iAOCP55GjS/5GJgLf1UKWJ9lb7rGncnuzfpiYfgUy6iTR6Xkx+KL7CZHuCtj?=
 =?us-ascii?Q?LnXNHnbYa084IoaG5ZbWbEFEspbb7kTKozIDHTGyw1VcmKTIkHS7tam6SXOG?=
 =?us-ascii?Q?044tc5uXYBvtDtu0YB65PUjO6p5RbKBBLhVP9JxYEB1UzWdD7xOFCT6Tbekl?=
 =?us-ascii?Q?zYGBoyja0Nkg8xmFd8iuWe8lK1lmLTEEakq7tOihuQ2PZlmlBT9hrbAeXTGi?=
 =?us-ascii?Q?kJ0CSrLumzzgNNk99UdpC+HA42NLTgq4O1HWfrxkDAZAMzGMMatRmM1oc8ZV?=
 =?us-ascii?Q?Y6IY4xD2Ffa2Y+DNb+ZeAkNMVZ1Ic0zubs8yEiqctaBOTurNH9id7mMwRLz2?=
 =?us-ascii?Q?VGDgwxB5YKu6yRWsdp3Hh/omURdBlpcfbgTsD/V+4IOux6eEYVxEhsodpgHN?=
 =?us-ascii?Q?NFEbkhz5V+rDeitSFEL3h7F0s3ubu0JWxqOLakyBiob2BlOn2b5rDMTbiAvN?=
 =?us-ascii?Q?r9/2cxycipy5YkVyiib70bKCjZ1gbhOlwyxqKMkXVNtfi5UQI2tVjGeqRENO?=
 =?us-ascii?Q?IfT6CoPbt2SN34wqbbpIn3SSowXA+tuG71/SFXGPReBuX5RdBjniWnCBntKR?=
 =?us-ascii?Q?AhEQIoDOK+6hyNdVv+QrZ6hM7Iuuw7f4B7xE2YpkXWqc8oxXVZSAp/czAyAp?=
 =?us-ascii?Q?adc5g+4rJaqyJXbXrfOAh7PORDHodxOycDNOy6EX/CLu0tZpAARDn0NwV+Zf?=
 =?us-ascii?Q?qS2hJfaeBrcpNTwUAdpGceR1X3s+XOFa7HOWI4k8kZ24YfuzVaAAFK1zppQp?=
 =?us-ascii?Q?HCMkrv1vJ+P+yoe++XJpE8DhujWbeHF9x1aelD55Sn8JTPR6vuUwPOU3ur9o?=
 =?us-ascii?Q?ZZkRojvwIm5d4gN8JrG2COKISiH/14jtqUDUzchdi12J1knXt2IMwuCJTcqw?=
 =?us-ascii?Q?gdfCpsU/IQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 85694ab0-4b5c-4ca5-be91-08defda5502a
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2026 03:52:39.1191
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w6v6qKCQIVIXk3elWoAJsCPtknecvsDoxOWFrNdBeiaWIghQKQttjjyPE2Ipw8/aDxwdo6oC7OlwRY2hCljRwA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6287

The new firmware carries GMC commands over the same MCTP/NVDM transport
as the RPC path, under NVDM type 0x26 and with its own fixed header in
place of rpc_message_header_v. Add that header as GmcApiHeader, matching
Open RM's GMCAPI_HEADER, and the queue element that wraps it.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/gsp/fw.rs | 127 ++++++++++++++++++++++++++++++++
 drivers/gpu/nova-core/mctp.rs   |   2 +
 2 files changed, 129 insertions(+)

diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/fw.rs
index 79a7820ce99f..050a6af8c0c7 100644
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
@@ -947,6 +952,128 @@ unsafe impl AsBytes for GspMsgElement {}
 // are valid.
 unsafe impl FromBytes for GspMsgElement {}
 
+/// Magic value that opens every MCTP-framed queue element: `"MCTP"` in ASCII.
+const MCTP_MAGIC: u32 = 0x4D43_5450;
+
+/// GMC API message header.
+///
+/// Matches the `GMCAPI_HEADER` struct from Open RM. The `command` field carries
+/// flags in the high byte and a 24-bit command ID in the low bits. `size` is the
+/// payload size for both requests and responses, while the union at offset 16
+/// carries the maximum response size for requests and the status for responses.
+#[repr(C)]
+#[derive(Zeroable)]
+pub(crate) struct GmcApiHeader {
+    /// GMC command identifier with flags in the high byte.
+    pub(crate) command: u32,
+    /// Payload size in bytes.
+    pub(crate) size: u32,
+    /// Sequence number for matching requests to responses.
+    pub(crate) sequence: u64,
+    /// Request: maximum response size. Response: `NV_STATUS` code.
+    pub(crate) max_resp_or_status: u32,
+    reserved: [u32; 5],
+}
+
+static_assert!(size_of::<GmcApiHeader>() == 40);
+
+// SAFETY: All fields are integer types with no uninitialized padding bytes.
+unsafe impl AsBytes for GmcApiHeader {}
+
+// SAFETY: All fields are integer types for which all bit patterns are valid.
+unsafe impl FromBytes for GmcApiHeader {}
+
+/// Header for an unencrypted GMC API message in the GSP command queue.
+///
+/// The fields before `gmc` match `GSP_MSG_QUEUE_ELEMENT` through its
+/// `noEncryption` union member. `gmc` occupies the start of that member's
+/// flexible payload array, and the GMC command payload follows this structure.
+#[repr(C)]
+pub(crate) struct GspGmcMsgElement {
+    mctp_magic: u32,
+    mctp_payload_size: u32,
+    mctp_header: MctpHeader,
+    nvdm_header: NvdmHeader,
+    nvdm_payload_size: u32,
+    reserved: u32,
+    pub(crate) gmc: GmcApiHeader,
+}
+
+static_assert!(
+    core::mem::offset_of!(GspGmcMsgElement, mctp_magic)
+        == core::mem::offset_of!(r000_00::GSP_MSG_QUEUE_ELEMENT, mctpMagic)
+);
+static_assert!(
+    core::mem::offset_of!(GspGmcMsgElement, mctp_payload_size)
+        == core::mem::offset_of!(r000_00::GSP_MSG_QUEUE_ELEMENT, mctpPayloadSize)
+);
+static_assert!(
+    core::mem::offset_of!(GspGmcMsgElement, mctp_header)
+        == core::mem::offset_of!(r000_00::GSP_MSG_QUEUE_ELEMENT, mctpHeader)
+);
+static_assert!(
+    core::mem::offset_of!(GspGmcMsgElement, nvdm_header)
+        == core::mem::offset_of!(r000_00::GSP_MSG_QUEUE_ELEMENT, nvdmHeader)
+);
+
+#[expect(dead_code)]
+impl GspGmcMsgElement {
+    /// Creates a new GMC message element.
+    ///
+    /// `payload_size` is the size of the command payload following this header.
+    /// `command_id` is the GMC command identifier.
+    /// `sequence` is the sequence number for request/response matching.
+    /// `max_response_size` is the maximum expected response payload size.
+    pub(crate) fn init(
+        command_id: u32,
+        sequence: u64,
+        payload_size: usize,
+        max_response_size: u32,
+    ) -> impl Init<Self, Error> {
+        try_init!(GspGmcMsgElement {
+            mctp_magic: MCTP_MAGIC,
+            // Despite the name, this counts the element header as well as the payload.
+            mctp_payload_size: size_of::<Self>()
+                .checked_add(payload_size)
+                .ok_or(EOVERFLOW)?
+                .try_into()
+                .map_err(|_| EOVERFLOW)?,
+            mctp_header: MctpHeader::single_packet(),
+            nvdm_header: NvdmHeader::new(NvdmType::GmcApi),
+            nvdm_payload_size: size_of::<GmcApiHeader>()
+                .checked_add(payload_size)
+                .ok_or(EOVERFLOW)?
+                .try_into()
+                .map_err(|_| EOVERFLOW)?,
+            reserved: 0u32,
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
+    /// Returns the total length of the message, transport and GMC headers included.
+    pub(crate) fn length(&self) -> usize {
+        num::u32_as_usize(self.mctp_payload_size)
+    }
+
+    /// Returns the number of elements (i.e. memory pages) used by this message.
+    pub(crate) fn element_count(&self) -> u32 {
+        self.mctp_payload_size
+            .div_ceil(num::usize_into_u32::<GSP_PAGE_SIZE>())
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
index 03546213da28..0ae88bef2a05 100644
--- a/drivers/gpu/nova-core/mctp.rs
+++ b/drivers/gpu/nova-core/mctp.rs
@@ -28,6 +28,8 @@ pub(crate) enum NvdmType with TryFrom<Bounded<u32, 8>> {
         Cot = 0x14,
         /// FSP command response.
         FspResponse = 0x15,
+        /// GMC API message (GSP command queue).
+        GmcApi = 0x26,
     }
 }
 
-- 
2.55.0

