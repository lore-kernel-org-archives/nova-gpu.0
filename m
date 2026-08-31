Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010035.outbound.protection.outlook.com [52.101.61.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B12262CCC5
	for <nova-gpu@lists.linux.dev>; Mon, 31 Aug 2026 05:36:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788154567; cv=fail; b=piS08BPgLIy6iXQjhcMRApbhPY0vNrrLzWJzW3aSWJzuR3CEGK5QaXxqwu2pyp749qYoKwnNE/9bhiGVfR8bYQA0mKNFkAMYwqbMZV0HYvKf/+AkIqs0ZXy79N7GbDpBVxnTDWM+Zh8MCfqN0cnCqC3oXF96uF9Vtar23F3AWwk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788154567; c=relaxed/simple;
	bh=LsNoO429aGP6/FmgkhThVhcunjyYJqDrzTUL9xrrr/w=;
	h=Content-Type:Date:Message-Id:To:Cc:Subject:From:References:
	 In-Reply-To:MIME-Version; b=PonQyRm8ahPV/NJFqwm7cRKyJTliQp1fbHNLXcBXHw+zzDT6cTeJ9xALUqUQLse4Y8cuNULIypls6vFk/t4deCn0c0kHDxvWPHSl86Jg/zKQY4C+of/fuwYCnSqWiMW7Sc0o+zcAWpEGJfTMZnMWF8X1fJymRDviCiFFrGjfyZY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=JHenFcr7; arc=fail smtp.client-ip=52.101.61.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="JHenFcr7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GGQBspGFUWuqoDUAfV384xyfYxwQimyXLO4aNjeXD72S2L9r2mCFcwpGTJNJVqlQV+0hkomM3iWhdpwyK+4ZXlrsF9KMtveYRQlHHXaL6s15udcM40cMt55d80chMsD6O52YKJeuziTz7dnsAQFncywACJEREKeULRAkC+zh9BAoXFBmLJQyWWXXGZ/KBj5eyIVChqdP1TDVh8IIb6W0fNBGzt+0gWzAiTdxQF18npyRfaBHKmgFtKFYvZ1XwSR9R0ysKobMwQP7AzSwxHRsElCcotjQq4Dh4HcwyzTCEbDoOmc2X9lUDM+6giykWU0h9DcjghU5J8dfu9Q6yFpihQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KvOnxMN8sORs2LVtlNuSugQxbBaz1u9JSX6G0JufVzY=;
 b=iD1KzDXorFbHhXy8MAFEHIFEd+R59HJkAJqbM6+CqO8YSkkQ/+LS0pkmm54lvl8bl6i3drqmitIbRYEjnMB/T2/XrjjabcN84DvmNV4bXl1OF/Bu39mDT/u2JXOHaw1DFGZzWxtdfYpz37OBK6ceQbQvA/i+W5mg8gHUq8oyyYpHbRuCpe3R7Lf9Y8fdT3aZbzpuXJvK+jfd43etmlBR70QyjdyazqazmKsw7ruotwIkh/zdq126/8MLc/uGuBzAgYJzRnzMihlyiduhX/8jZEzUIrpYeUeszmGLWnTGdXti6J9FNam1Z+4jg7kzWTWWZyAqUUOZuAJZu1WqGJV7eA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KvOnxMN8sORs2LVtlNuSugQxbBaz1u9JSX6G0JufVzY=;
 b=JHenFcr7UIn38if7w4+By2tHK6u0839Tup0hk3WRPFeTxRiMvgPR21ibya0RQRbKYHB44e04ptuCd2hvHPIGFbYYlj+RafviQtZbQrsTXFiH2VN/x6Ow0J4pq99TomEt8SaT8n1MnbPZTOnIB+uF5Z/7kjiUrOk8XSa9q37r18T14w4dQBDbzUR46DKj1SBJQ6mgQOwHoxk23H8GNwQQe08eufzQoxVUM7Af6RCtgwqsHE76/HATOGBy633MgzDakI2i6RrrQ4uvdQxSCveZofXmOmX7c7aETPso9Wo7gqeKhg9hTn7NI9NheJYBzv5sulF+Vs3EHI1jFyfpGV1Kng==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MW4PR12MB6873.namprd12.prod.outlook.com (2603:10b6:303:20c::17)
 by LY0PR12MB120611.namprd12.prod.outlook.com (2603:10b6:408:3b9::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Mon, 31 Aug
 2026 05:36:01 +0000
Received: from MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1]) by MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1%5]) with mapi id 15.21.0360.008; Mon, 31 Aug 2026
 05:36:01 +0000
Content-Type: text/plain; charset=UTF-8
Date: Mon, 31 Aug 2026 14:35:58 +0900
Message-Id: <DL2VVZMCMKFJ.3VSCVJRWO5HKR@nvidia.com>
To: "John Hubbard" <jhubbard@nvidia.com>
Cc: "Danilo Krummrich" <dakr@kernel.org>, "Timur Tabi" <ttabi@nvidia.com>,
 "Alistair Popple" <apopple@nvidia.com>, "Eliot Courtney"
 <ecourtney@nvidia.com>, "Zhi Wang" <zhiw@nvidia.com>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Bjorn Helgaas"
 <bhelgaas@google.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, <nova-gpu@lists.linux.dev>, "LKML"
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 10/15] gpu: nova-core: recover the GSP receive path
 from corrupt framing
From: "Alexandre Courbot" <acourbot@nvidia.com>
Content-Transfer-Encoding: quoted-printable
References: <20260829012243.496697-1-jhubbard@nvidia.com>
 <20260829013324.499542-15-jhubbard@nvidia.com>
In-Reply-To: <20260829013324.499542-15-jhubbard@nvidia.com>
X-ClientProxiedBy: TY4PR01CA0084.jpnprd01.prod.outlook.com
 (2603:1096:405:36c::11) To MW4PR12MB6873.namprd12.prod.outlook.com
 (2603:10b6:303:20c::17)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR12MB6873:EE_|LY0PR12MB120611:EE_
X-MS-Office365-Filtering-Correlation-Id: c6c03c37-3fdd-4397-7bda-08df0721bdce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|10070799003|23010399003|366016|7416014|376014|22082099003|18002099003|11063799006|56012099006|10067099003|4143699003;
X-Microsoft-Antispam-Message-Info:
	VWHDCJC/lTLuQnLuGw+2l4kR2gLcYxKNNflsIfCGN2Fz6ZkNpEj2U+h8N+Gdugs4nlpizRG3KUw6+2+yt+lhsgdKizy1MEVuUc0B2EAw9JAFF3qtwYbqjFwvMLn4HDgTGYZrwrzWXeLti6o9X2nADackPX4Hx+yofOdiQPvb2d6vXQVURM7D2S48Picnuc6RYXUFiTUkE1Ci+GPJuEcTcEtDki9p/Z/ci6LU5zyoulrwoL7pHS9h/0gN/JN+eha8JNRRwBL5Dtm+toJT3Q9/lSnMFPFUrZsQIq9LmOM7uHIKy+vHMaWFWmxsa/U6c/MoR4hfiK/JU8su9N1DUiS6SQUnBk5D13fGriCIbAccmxttojDOv32A+qIOw+mC6kAZd2CU0DyyLjXLirdC9ggA6KKs4sJMX0HoyKbmQ000w0x5d3Y7nlWDu1ctS5/0pN8lV+10CMRpOcjfcvs2257LykMsfpyFe9dZSAj29pEr0ty/WMWVESHPvf+6qT0ZOlgWPtGd6IZls3Pyf9MfyNh5TM0QaO+/Ke2d4y3n+FNkw8QdaSnqDIQdymjllbc/CEB6kwD+UdhKTmmeeGs2kQAP4vUOZIa1Sv9c8+SO7e+Z0L3fPc4xXOLVcFTJFrcIK8oiv4IRrUM0VdQctsNh5j2O23o67uSJAyxwcyEVls9/3Rg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR12MB6873.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(23010399003)(366016)(7416014)(376014)(22082099003)(18002099003)(11063799006)(56012099006)(10067099003)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QXRzOEllSXlYUEJzNkNJclo1N00zWk5vaGt0eHRTTFJzbklzWmVrRDdSQ0dB?=
 =?utf-8?B?NXNwUzJNYUFQYlhIdjl3NXBnWHNCWnMvbWs5TXRYdHN1a0w4YW9JWkNGYlJ2?=
 =?utf-8?B?dUE2VVhMMk5QYlFaVjFIRVppaXJrSnVYMGFiWHYzRUVIdkw0M296Q0E0eG9w?=
 =?utf-8?B?N2w5OG0yL0Z1TjQ1MWkxNWJOdVhzVnVNTE92Q1M4d3BLclhCYWN2SVFDOHlM?=
 =?utf-8?B?a3FKT284NTM5dzlXWkxKbHl6MC9KQmtpWkcxZXgwUnc4MXd0Qk9PWldSRElq?=
 =?utf-8?B?eVhDMms5dmtPbnRuc1lMMmpsYTNHSEwvcU1LWE5jVUJDNFVreG9oTkFJL1F4?=
 =?utf-8?B?RW5WUFNoTW94QmwzQ2pNWlowazJUOUhnM2E1OElTdkVnc0FsVExUeC9DT3FV?=
 =?utf-8?B?MmdXblo3emFXWnFYT0Q3Y1FrRWwraExtSjFXSDRWRnBaVERFZHRxM01BdUxC?=
 =?utf-8?B?dzVaQnA4NVdCWXlreUZZZC9MTmFwNTB0Zys0SUNJNUhldThOQStQZGltMXQx?=
 =?utf-8?B?STVrV2MzZ1FON1lKaUk5eC9kclRYSURSNWVvTHNYTDQ0VFVKRGdMRVk3UjE5?=
 =?utf-8?B?dG5WczJSeHNFT0IwdWl0alR5amJjOHdTWTlqSWZFbnBLZUdpb1kwMTd4QXE2?=
 =?utf-8?B?WE1qa3VhOFFxbHp5bXZqOFBoTk1nK05MUDhKNFAvUkt0YXQyRzc5akNqWUFn?=
 =?utf-8?B?MWZ6NVFURkMzd2N3Wm9hSWlrVzRMeTVRQWZtUi9PNGZ2aG9IUGpZY3d4SFIy?=
 =?utf-8?B?YzJUTVRYNjhCd3plUENZdFQ0cjl5NjIvQWNIQ3FjQ3lDRk1ia0pDcUxpdDhH?=
 =?utf-8?B?dzg3VnM0OGd6M29HOERzcVFjOFU5RXhpYTRsRTgxd0ZXZU5OWmZzakNVRnFI?=
 =?utf-8?B?amY1VWcyaHJLbHBrY3N0aEsxbkl1OHVwRzlEb0FDcENlQ1NvdnFjRVN2Rmhm?=
 =?utf-8?B?R0tnSEJQS3RYWmlKRzR5N0VydG1TZTk5a1dLbTVFSWN1NE9MeHJDTjBlbkhl?=
 =?utf-8?B?RHN6SkdMdXlvSEJXK1NyWGluVTdhSUNZTGxUQ1Z5eFNaQUVsRERUMEFlVHQ1?=
 =?utf-8?B?akYybHZhN1pvcmZKcHAvWlY3b2tTMkFzYWR4Y3ZvZCtuWGtiamZ2SXkzQXBS?=
 =?utf-8?B?aXAvUVRlRkxCNkVmamU1S3cxOWs1ZEpsQ0xnNXZWN2xUQUJVVWRBRzQxbjJB?=
 =?utf-8?B?Rkp4NmUxM2ljd3NKSlhOdFZjZXBOd3c1T2xoRER6Tm1BRFJpempQT0JtaDZT?=
 =?utf-8?B?N0JTdEU4N1FINTN4WlhhL0c0T25oWVN3Y2ljR0laSWtMYkdRU3VpVWltaU5m?=
 =?utf-8?B?ckNMeUdUMTJQWExudk85cW5jbC9EaUJkbk1lTnByUy9lOWlkdzgyamRoOWhC?=
 =?utf-8?B?MGg3WXZSN2liVlpTMExCQWtBY1BDdGdWSC9Yd0hMVUFUZU9WYzlvQldMdmw4?=
 =?utf-8?B?cXpXcEh5UVpQS1JXVnFnd0Y3QVA1WlRQanA2UkordEJBdkM2ZUFSNWJxczUz?=
 =?utf-8?B?QUhBWGJGcm8xNDBJWlE0N0psd292d3lESHl3NGptNHR4N1laMjM3L2ozUGJ1?=
 =?utf-8?B?bUFTazBYczNsc204UjdKYm82cFNGYjVBZHFTcUdBUXF5SHY1RDc2N3IyMldt?=
 =?utf-8?B?L0hKb0c5Uy9qZzgvdW5qK1pDc1JEdG1ubEdnK2dlOWk1ZWZJajFWVG1qVko4?=
 =?utf-8?B?U1FjeitINGd0RFp6ZmJsVmFidVNFQzR2ZElkYW9uRmxkZURRMXprNjFBbGJr?=
 =?utf-8?B?MGZRdjJEWnVUckpLQlFYMmozNGc1Ymw0NmRMOFhYL0dnTms0YzhUYTRlak1W?=
 =?utf-8?B?NE4zS2g4bElJMTFIcks3ektxWXUvYjllSmtTY2kyRFhhOGRaOXMvTk03aFVS?=
 =?utf-8?B?STZaMm4rUFBQWVMwUHcySDcrZXR3VURKd2JUcVYwSlp5WkpsN1M2dXh5RFJX?=
 =?utf-8?B?ZStYVHhxUmZIQWZqUXJCRE9iN0tEUjh0U0pLQllmSVR0VGkyTEhTTXJrNzdE?=
 =?utf-8?B?bjVDcnNkaWt4amdmdnQrVHNkMTlpNDVFMi9WQUM3Q05Ddk9jbXdsblpDZjdm?=
 =?utf-8?B?S05zVTRYWEI5SGZVOFRjU0VHaHJlV2p6elNzdy9SZnd5eHNGNm05akNEaVZT?=
 =?utf-8?B?QXpYRDZDZ055aXJhOVVFcUJhMWVJOXJjeGRZbzFDcWlQZVZOekVXanJrUUMy?=
 =?utf-8?B?ZVhYeVA3NHhrYjdIaGZOT2FKZ0NGL0krZGdSNTJ6YXQzVVl0MmN3RkdmLzNz?=
 =?utf-8?B?Tmd2dFE2R2NKWEJ6d3dabWh5K1k5aEwyK3VtcDBIWlJSbXFxMDc4d2d0T3NZ?=
 =?utf-8?B?Ti9wTWphSmNFWnhQdTI5ZkhIUC9hRlhvdFF2QUNHbzZWeDlrdm9GR1NHOHVv?=
 =?utf-8?Q?Jo3s3O1AJD8NgiMzGpowceVqsk5wQ8W/JCgcS042ptfLT?=
X-MS-Exchange-AntiSpam-MessageData-1: kBsVKkaLrbeGUw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c6c03c37-3fdd-4397-7bda-08df0721bdce
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB6873.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 05:36:01.0909
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rWQc1v0uAWercaKLAhf0H2q+UzRNAX7qK5nSXdXLqZdhXnPAuX/0uFkQfvYSP7zY5jgiG9DczRkXEmWh2alT8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LY0PR12MB120611

On Sat Aug 29, 2026 at 10:33 AM JST, John Hubbard wrote:
<...>
> @@ -748,11 +756,13 @@ fn send_command<M>(&mut self, bar: Bar0<'_>, comman=
d: M) -> Result<u32>
>      /// # Errors
>      ///
>      /// - `ETIMEDOUT` if `timeout` has elapsed before any message become=
s available.
> -    /// - `EIO` if there was some inconsistency (e.g. message shorter th=
an advertised) on the
> -    ///   message queue.
> -    ///
> -    /// Error codes returned by the message constructor are propagated a=
s-is.
> +    /// - `EIO` if the framing or the checksum is invalid, or the queue =
was already poisoned by an
> +    ///   earlier such failure. Either failure poisons the queue, so rec=
overy requires a reset.
>      fn wait_for_msg(&self, timeout: Delta) -> Result<GspMessage<'_>> {
> +        if self.poisoned.get() {
> +            return Err(EIO);
> +        }
> +
>          // Wait for a message to arrive from the GSP.
>          let (slice_1, slice_2) =3D read_poll_timeout(
>              || Ok(self.gsp_mem.driver_read_area()),
> @@ -763,7 +773,10 @@ fn wait_for_msg(&self, timeout: Delta) -> Result<Gsp=
Message<'_>> {
>          .map(|(slice_1, slice_2)| (slice_1.as_flattened(), slice_2.as_fl=
attened()))?;
> =20
>          // Extract the `GspMsgElement`.
> -        let (header, slice_1) =3D GspMsgElement::from_bytes_prefix(slice=
_1).ok_or(EIO)?;
> +        let Some((header, slice_1)) =3D GspMsgElement::from_bytes_prefix=
(slice_1) else {
> +            self.poisoned.set(true);

We probably want to `dev_err` some error here, or the queue will just
stop working without explanation.

> +            return Err(EIO);
> +        };
> =20
>          dev_dbg!(
>              &self.dev,
> @@ -777,6 +790,7 @@ fn wait_for_msg(&self, timeout: Delta) -> Result<GspM=
essage<'_>> {
> =20
>          // Check that the driver read area is large enough for the messa=
ge.
>          if slice_1.len() + slice_2.len() < payload_length {
> +            self.poisoned.set(true);

Same here. Maybe we can have a `fn poison(&self, reason:
fmt::Arguments<'_>) -> Error` that performs the log and returns `EIO`
for convenience?
