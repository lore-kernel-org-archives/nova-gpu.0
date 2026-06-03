Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012016.outbound.protection.outlook.com [40.107.209.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5058140DFA7
	for <nova-gpu@lists.linux.dev>; Wed,  3 Jun 2026 07:30:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780471853; cv=fail; b=DfSfnnu5aW4OmR1Dl6USh78jH5gMerQFZjfN9YCCXUsJtcSJUTe7ARPgpkJTF8CmW4bRDldu1hiXK4/+h3o10coAb3pYLKGfUN6TV5z7XX4kkZZIc+cTmRmToncV9ROx5b/ufeSa6tbQkSio9eR0GA64KX9rbzNk1tpgZFL4E0c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780471853; c=relaxed/simple;
	bh=5QxHF7EeQkYGcN44IL7HBFRlJtDTLHhwGVYXllfd1ms=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=XZPQUaRzOn3N1YBF2g91fJbZwjlbjqlo4vKfnjAaeYmh3tflQ2pY54LQDM1fyrAaATDEIBUhfo+tNxnSeruzpraPQJnz22OXg8Y7d7eTcLhRTpPV/mn0PsPc4+y3YCoAwg7HPNU0di5m+qrifUXR49d0Ul9OV90VTE4isHZCpJ0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=cZUEMS5p; arc=fail smtp.client-ip=40.107.209.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="cZUEMS5p"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k73HajeQI1WcjOlRpQ1gVFYJtPyKv6YDBfWxadiT4mMANWxq96xVPkDt/0GnrfRqhdXUsRggLVP+sVZldwH054NOcJWdGHnqcSfdoIpq3w64XXh5EaG+BfLTXRcxgNCg0O26J+BCHnI6CJVnrKrRMi/mpT1nGyBJGIdGKfEbOGOd/ZPIV52evsFSDzPXNwGdV2fjVDVd2FiLxwt91j8QuGwMMsaBqg6WG3DVyams2qB/A3uY8ueDkto4rO4P8BPQNZSVpoo7lYpGXAuV3Hy9LAvOGmKLKNLprDgf8dZz3/Ad7dgVBlyGmDY1BzGnjKcdxY0sbTa6qe7/odcYMPM15A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0cQ3zawqSpjT5c22tuXfEoaoSk6H8aAAbFdWdEi/9kQ=;
 b=lxqu4fQ1WM+EmCOpvCh+pjqHzCSSx+ZHDf/Ap3gR7olvGiHzrxgICbEvAzy+C5oljF+MSSmh5CD30kV3hT44EFJDpIgQGumpDjKZ4mi+UvYH1dhDTI8Bu4hkVCLTsZWm1jJ2qYMd/k4I7DqFO0IYT60XY+dvGxRoZZfh10RNbUmOTK/ERcv3rNED+z42IwbPkhtIbd1Bd6JKbWjwgLlIPGQt9OCbcigdXgXAhK64/FBBW7/IPJO+V/YzLSJwHKl6yVRiy8u82zHgNIutSRf1g9qlBF1rAxHtaJSAqJC15pAh7iKPl4AEaBj6vQ82C3C7WRSkesOnuGYCfT9KStjD0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0cQ3zawqSpjT5c22tuXfEoaoSk6H8aAAbFdWdEi/9kQ=;
 b=cZUEMS5py1v6wPZPKWSDSqbme8H7da+pnet+R6YLagi99TTjRTPIirOJjlZPS+SQNSUnGJsHIGXRnlSDUvmw4lOwl6Wcgt+Us59zu7Zdsu9lIN2T2Ak1nQefAKKEMiEq/wJW8XPx8N/R2aqWjicExr0198OOx+kMWzlUjhq0S8huJuhRo65lKLQq1zbiXitbtnlCrpU3sKjblO1mkjJdlMHACFPHR0e90Tw5qzC0+v3ku2AFaxUOom3oA23Y7rxpopxqBIDeOxcOEpySMpqZHMVuyf2oYPrMWDDUWB20GAbLefBLK+VAuh65pzj2IkwCy0Cj9d3sa4qFDhn7oqAbsQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SJ0PR12MB7036.namprd12.prod.outlook.com (2603:10b6:a03:483::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 07:30:47 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.21.0092.006; Wed, 3 Jun 2026
 07:30:47 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Wed, 03 Jun 2026 16:30:21 +0900
Subject: [PATCH v13 4/9] gpu: nova-core: Hopper/Blackwell: add FSP
 send/receive messaging
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260603-b4-blackwell-v13-4-d9f3a06939e0@nvidia.com>
References: <20260603-b4-blackwell-v13-0-d9f3a06939e0@nvidia.com>
In-Reply-To: <20260603-b4-blackwell-v13-0-d9f3a06939e0@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, John Hubbard <jhubbard@nvidia.com>
Cc: Timur Tabi <ttabi@nvidia.com>, Alistair Popple <apopple@nvidia.com>, 
 Eliot Courtney <ecourtney@nvidia.com>, 
 Shashank Sharma <shashanks@nvidia.com>, Zhi Wang <zhiw@nvidia.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Bjorn Helgaas <bhelgaas@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 nova-gpu@lists.linux.dev, LKML <linux-kernel@vger.kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, Boqun Feng <boqun@kernel.org>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: TYCPR01CA0204.jpnprd01.prod.outlook.com
 (2603:1096:405:7a::11) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SJ0PR12MB7036:EE_
X-MS-Office365-Filtering-Correlation-Id: 4bc90b19-4e34-4594-5865-08dec1420788
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|376014|7416014|1800799024|366016|56012099006|11063799006|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	r98XxBOlvZ7zrRTyBeQ6k5GTbe/9WqYcyDMV1BsOrHVr8B+RGw35cKa6F22rY02fhlUCQsXs0foKboao/OKZl8ZQLR/oeKSMIfOf84rn9aq87wYmES1LkLGRHm7LdN7NbnzPiWN0CJRFJJNtsGglK6REb6OZ590lRY6Q3wOt/asCsXX7H1H0I9mR0I7C064Mjkmjz9+by2I9Aw4ozwOOk8xwsCm3AnJVdPcuISAtFcxlMuun55RukX5NMyBxJ51vt+1QjNR+mu9YgSuL2ebqub4GzzjYBsgzTBPboXtul9gjgjNGGwjokf7LRAe1O579fw8e/uc26RMDrHDEo9uqv+ToYiWnrfmn8eLmxq7jCRSv79+dzGHBzKSsIMDkKj+mHnt+DtZjUgjtzk8ybJe76SS+8vfGCq8bF0TW4R3m829TfYABkwdFzZdGMNClCkCy758mzs8oi77hquGncf7aHdkse3M4M3updZd9zdtlRRM7R247okKRKNOltUBHWzzb3xFnz3WO1ZSD8Oh4Et+rgclmXmNpjT97TToEsPaDiH1D136A6UK5wuSJLtV+cYZ82hFKV0iwD6a9OP8VNaWaa/gpkvJ2ZKJJd0q7AMQfOn45flCfgh92yyGdRWWG4MHNz4XNaB/s+WEWo6PiL1g+qHx7fAP3BMMJVt6x0euds1CR+b4Q8JXmzVRM8JjWbSFM
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(376014)(7416014)(1800799024)(366016)(56012099006)(11063799006)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S2pDUFI2a0JVSUUrY2NlejAyeEMrZVliazhIQzBZeFIwUUwyYUtoUHIrRmRu?=
 =?utf-8?B?UnR0TS9SbStkNmhlWW90MGtib0x2aGdiZytVSmYzN0RoaUZVdG1VYnR3MHF2?=
 =?utf-8?B?Y3M2NHVlQXdLbXRZc3ZTVENtd2tmUlU3b0pHcHczbkc2dCtXclNrKzZRY1R1?=
 =?utf-8?B?ekxoNXZYUCs1NWloYUV1VzNvL3JjNWRhNjJOdVo1YUlsc0Izdzh1aEFzWjZZ?=
 =?utf-8?B?MFRNb1A5bENkTTdPblEvQ1RZWEdOWWh4Zzh0a3F0c1FScFdTVkUrc20waDd4?=
 =?utf-8?B?eWxZYmZNc01yc2FxOWNCbjAvdks4TEh1ODQ0NXNaUEMzNlR6OGtiWm84WCtE?=
 =?utf-8?B?bi9hZys0Q1FSV3dVeEV6V3p1aVRTSDZNUE9zN1BLZWdaOVFmK29GVC83U1hZ?=
 =?utf-8?B?RHRvSnN6bmVlMVppMWxpWS9rV2Q0MEJmMHVkUElYOGRhT0cxb2VOSGlNbzlJ?=
 =?utf-8?B?RUVwWnF3enBrWWtqd0hnaGIvcWcyb2xCLzFDT3NQM3BFT2xRMjdtMVlGVjBO?=
 =?utf-8?B?ektDTVJXOWN6Q2o2RDkwRGx1UE5YQVoza3FPemRnMHBzWThBR1A1SzU3Vm0y?=
 =?utf-8?B?MEw4Nk02Nll0NUg5cm5OQVJVdGZhSTFSRkgwYWU3czdGWVRJdmdkaUJEaE5u?=
 =?utf-8?B?UHk1UG51OGVMTThwdndZa1R5MFBLOXhlQ1pyeCtCaHBXQTBybS9xZU5BanR4?=
 =?utf-8?B?TmZUN1poMlY4RUZJNXZiQmN6UGorVE8yTWFnRm5WZVpuM3JrekRpRWkxN25B?=
 =?utf-8?B?cmVkc09LU0FHRmw1aWJGRzJkQVpmcWJxVG11cDE4bzB6c0xNZ252S3ErSUVh?=
 =?utf-8?B?UXBWbkd0VXdqUk1WeU9BQ05LWkFZZzgwQ3laeHE1a3dnYk5DRUpRUGxmVHVB?=
 =?utf-8?B?QTgxRTFtNkFWdkdIT29ndnBsWmJ6WHpCMENoTDlpMnhLMFRicFhPTnZ1LzUz?=
 =?utf-8?B?V2pnS0pZQkI5TkZFRFc3ajFMZHNBbG9tWEMybVVuOG9kTkExS2NZSFNRY3F6?=
 =?utf-8?B?Z0YrNU54QUlVU09ZUHdjUXp3eS9EenluR2wyVEVXdGRHZTZTb0tUMEtITzZM?=
 =?utf-8?B?c0o1dlpkc2F3KzcwMGJJZzRMVVVUeXdCc0psS051TkoxeHpqczlwNlRMR0RT?=
 =?utf-8?B?S0h0dXE2K3FocGp4OG9XK2JhdG91aHN0U3B2SkJJaVNoNXZvSXF5NGpQY2pJ?=
 =?utf-8?B?ZjdQUlFsSDNpdDlHdDNVTk10aWRvNjNaSGkwQmQyVWt5Z29tNUpoMWV0WWk3?=
 =?utf-8?B?YjUxd0Z3dmpCRXRseFZMcHYxcnRSSWY1MEI5a2YvNE1pUUZXL0ZVRkdjSldE?=
 =?utf-8?B?U1Q5b3NSOUVqeVVSaE1SNndyWGVJdDQrdGVxVEVCR1MwUjU2U2VuNlk0Q2NJ?=
 =?utf-8?B?ejVuOXo5SnVFZmw5cm53c2VEYldwVTBnUGFGQTM2SE5yZFkzbkF2dHFoN3o2?=
 =?utf-8?B?WERyMWdlVEt1VllyTjJaTE9idytBQXRiUXdqdURwUVpBWVdLRk1odEkyaFFw?=
 =?utf-8?B?T3I1dis4NWtFelpiQlJEejh1R0dicTFWMXZjbEpZbk9OSW1jZ0JDQ2l5Y3F1?=
 =?utf-8?B?Nk92VVp3TUpWcHhnN2hWM0x3K05oTkV6YTJkSzRSNFF4L3dJcWpJOE5pV2g2?=
 =?utf-8?B?WnR6Y1kwQngzS2tSYlI3aEN3VWIzcjQrT0xmYWVYN0tJYTZ6QmdjZy84aDBI?=
 =?utf-8?B?dmdScTlHaTdkN3liWFhYWW1aUmc4N3hHbHVXbnNHZXoyUEN4djUrcG1nckxO?=
 =?utf-8?B?TTFTMURzZHMrQ0hrczQvUWIxNGgxRVU0SXg4RHNOejhqWmhWR1V2akkra3FM?=
 =?utf-8?B?U1BqRHhnVE1Fa2NGU0w3ZmpzWklPNjhRTkZSYVhPbHJUS1c5ZHZJNWIrTXB5?=
 =?utf-8?B?MlBUSkdpVnlIbXlTdXdSaGNwZW1hYUk1K09NY1J2M3BMOWovdDl6bGZBUDVk?=
 =?utf-8?B?Q2lIMWhVWGZhdkxzWFo3UmFCZ0FyMHBFOERqMDZlWXo2N1dmSzFlNXVaNjNW?=
 =?utf-8?B?Tnl2MXhSZHk4ZjVYaHdjM2w4eGU5Z3BhcURyeUR4VWIrWm9RbEt1MDloVDNF?=
 =?utf-8?B?K0REeXNjWUdjZUNDZlF1WWkwSEo0Q3F5dHd3V1hPRDEvdjJwcC9uYlY0RnZT?=
 =?utf-8?B?U0ZGWkJkQ2hCYkNsVWZWVEtsemtPOExIb1Nta0s3MEgwb3pOUU4yb3VoeUwr?=
 =?utf-8?B?VE55MmZsYkF3WFRNMTBtVmgrNVRXNS9BWlNyZzdqZkhIN1AxeHRRQ3N0VDFX?=
 =?utf-8?B?aWlQMThJbW54WTFpY1cydkxoNnVHdThWeCtQM09wdCtybUZFV3ZSNVB2ei9n?=
 =?utf-8?B?REFOc3Q0WmFOZTROVVB5b3Jtd0tCK1JjU2YzOEZqZFdIZDBkUlFlQjhnUXcz?=
 =?utf-8?Q?oHxkGBcLa+M/8rWQg86Zm9Lhs0q0JqXHor6bwoKtmG//i?=
X-MS-Exchange-AntiSpam-MessageData-1: 5NXpzBWROjH8uA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4bc90b19-4e34-4594-5865-08dec1420788
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 07:30:47.3225
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T0LFTZhlWbYuNZzsh+t41cZKurvG4p3bpaajKR8VzsYiOMFIljqHOgoBlK1dqhqULWwpDJr879dcA6bWX9z0kg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB7036

From: John Hubbard <jhubbard@nvidia.com>

FSP exchanges are request/response: the driver sends an MCTP/NVDM
message and must match the reply against the request before acting on
it. Add the synchronous send-and-wait path that validates the response
transport and message headers and confirms the reply corresponds to the
request that was sent.

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/falcon/fsp.rs |   2 -
 drivers/gpu/nova-core/fsp.rs        | 105 +++++++++++++++++++++++++++++++++++-
 2 files changed, 103 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/nova-core/falcon/fsp.rs b/drivers/gpu/nova-core/falcon/fsp.rs
index a178fc4db1ea..bcb88f64c9f8 100644
--- a/drivers/gpu/nova-core/falcon/fsp.rs
+++ b/drivers/gpu/nova-core/falcon/fsp.rs
@@ -121,7 +121,6 @@ fn poll_msgq(&self, bar: &Bar0) -> u32 {
     /// Writes `packet` to FSP EMEM and updates the queue pointers to notify FSP.
     ///
     /// Returns `EINVAL` if `packet` is empty or its length is not 4-byte aligned.
-    #[expect(dead_code)]
     pub(crate) fn send_msg(&mut self, bar: &Bar0, packet: &[u8]) -> Result {
         if packet.is_empty() {
             return Err(EINVAL);
@@ -142,7 +141,6 @@ pub(crate) fn send_msg(&mut self, bar: &Bar0, packet: &[u8]) -> Result {
     ///
     /// Returns `ETIMEDOUT` if no message was available until timeout, or a regular error code if a
     /// memory allocation error occurred.
-    #[expect(dead_code)]
     pub(crate) fn recv_msg(&mut self, bar: &Bar0) -> Result<KVec<u8>> {
         let msg_size = read_poll_timeout(
             || Ok(self.poll_msgq(bar)),
diff --git a/drivers/gpu/nova-core/fsp.rs b/drivers/gpu/nova-core/fsp.rs
index 908dc112aa6f..cedfea173e50 100644
--- a/drivers/gpu/nova-core/fsp.rs
+++ b/drivers/gpu/nova-core/fsp.rs
@@ -11,7 +11,11 @@
     device,
     io::poll::read_poll_timeout,
     prelude::*,
-    time::Delta, //
+    time::Delta,
+    transmute::{
+        AsBytes,
+        FromBytes, //
+    },
 };
 
 use crate::{
@@ -22,18 +26,52 @@
     },
     firmware::fsp::FspFirmware,
     gpu::Chipset,
+    mctp::{
+        MctpHeader,
+        NvdmHeader,
+        NvdmType, //
+    },
     regs, //
 };
 
 mod hal;
 
+/// FSP command response payload (`NVDM_PAYLOAD_COMMAND_RESPONSE`).
+#[repr(C, packed)]
+#[derive(Clone, Copy)]
+struct NvdmPayloadCommandResponse {
+    task_id: u32,
+    command_nvdm_type: u32,
+    error_code: u32,
+}
+
+/// Complete FSP response structure with MCTP and NVDM headers.
+#[repr(C, packed)]
+#[derive(Clone, Copy)]
+struct FspResponse {
+    mctp_header: MctpHeader,
+    nvdm_header: NvdmHeader,
+    response: NvdmPayloadCommandResponse,
+}
+
+// SAFETY: FspResponse is a packed C struct with only integral fields.
+unsafe impl FromBytes for FspResponse {}
+
+/// Trait implemented by types representing a message to send to FSP.
+///
+/// This provides [`Fsp::send_sync_fsp`] with the information it needs to send
+/// a given message, following the same pattern as GSP's `CommandToGsp`.
+pub(crate) trait MessageToFsp: AsBytes {
+    /// NVDM type identifying this message to FSP.
+    const NVDM_TYPE: NvdmType;
+}
+
 /// FSP interface for Hopper/Blackwell GPUs.
 ///
 /// An `Fsp` is produced by [`Fsp::wait_secure_boot`], which only returns once FSP secure boot
 /// has completed. It owns the FSP falcon and the FMC firmware, which are used for the subsequent
 /// Chain of Trust boot.
 pub(crate) struct Fsp {
-    #[expect(dead_code)]
     falcon: Falcon<FspEngine>,
     #[expect(dead_code)]
     fsp_fw: FspFirmware,
@@ -69,4 +107,67 @@ pub(crate) fn wait_secure_boot(
 
         Ok(Fsp { falcon, fsp_fw })
     }
+
+    /// Sends a message to FSP and waits for the response.
+    #[expect(dead_code)]
+    fn send_sync_fsp<M>(&mut self, dev: &device::Device, bar: &Bar0, msg: &M) -> Result
+    where
+        M: MessageToFsp,
+    {
+        self.falcon.send_msg(bar, msg.as_bytes())?;
+
+        let response_buf = self.falcon.recv_msg(bar).inspect_err(|e| {
+            dev_err!(dev, "FSP response error: {:?}\n", e);
+        })?;
+
+        let (response, _) = FspResponse::from_bytes_prefix(&response_buf[..]).ok_or_else(|| {
+            dev_err!(dev, "FSP response too small: {}\n", response_buf.len());
+            EIO
+        })?;
+
+        let mctp_header = response.mctp_header;
+        let nvdm_header = response.nvdm_header;
+        let command_nvdm_type = response.response.command_nvdm_type;
+        let error_code = response.response.error_code;
+
+        if !mctp_header.is_single_packet() {
+            dev_err!(
+                dev,
+                "Unexpected MCTP header in FSP reply: {:x?}\n",
+                mctp_header,
+            );
+            return Err(EIO);
+        }
+
+        if !nvdm_header.validate(NvdmType::FspResponse) {
+            dev_err!(
+                dev,
+                "Unexpected NVDM header in FSP reply: {:x?}\n",
+                nvdm_header,
+            );
+            return Err(EIO);
+        }
+
+        if command_nvdm_type != u8::from(M::NVDM_TYPE).into() {
+            dev_err!(
+                dev,
+                "Expected NVDM type {:?} in reply, got {:#x}\n",
+                M::NVDM_TYPE,
+                command_nvdm_type
+            );
+            return Err(EIO);
+        }
+
+        if error_code != 0 {
+            dev_err!(
+                dev,
+                "NVDM command {:?} failed with error {:#x}\n",
+                M::NVDM_TYPE,
+                error_code
+            );
+            return Err(EIO);
+        }
+
+        Ok(())
+    }
 }

-- 
2.54.0

