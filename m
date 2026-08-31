Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010017.outbound.protection.outlook.com [52.101.46.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F6193AC0D9
	for <nova-gpu@lists.linux.dev>; Mon, 31 Aug 2026 06:05:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788156308; cv=fail; b=eJE000Ln7aGWxJfbtvfJ7VASQIfkkwFlIXdAc0rJuY3zoziiO1PKlj/2LtSXX0PTWiETEYNU2LjEEvvWGOssfpfTVH46zz8mM95BS02cohK02GwDmuB+CTCs5UqEU0q0Twzxa+7dUsxTloxwpm9iekvHNkKR3u1L1EPj1Pa13vM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788156308; c=relaxed/simple;
	bh=he9MgIVMSFAfxiEF2CjW6mBVrRCaItc9KPRh4jj0N4k=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=gF5426TFklNHNKCCmqMHKcQu5wKwn6Hd2R6HuMFhtnziu9YLgOTXr+si3Get4lrxa7wYsEeyBZs8Fu5d+iVqR6c3pvWIfmk08cUsRu03pjQn5N5jg+U/BDvCe6SH9p2BDw7VFw/agb4be7poLRsXVopXVfVdbDJIVWndZmnyRqY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=B7CkSlKk; arc=fail smtp.client-ip=52.101.46.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="B7CkSlKk"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JyOmL7XVC+AMxnhNpVMl0b9lbatfq4zlDofLqbxx6nj0algKA4WSojB7srsmsHT30/vmPW7L2whKLIoKHDC1Kg9C10e6wApSBGPF1w5c5OFOCte67+coBpswdTeBQOWIEsBMptab7V1W8t7RuyXXyM/C8/xl3r/P6/xNrl8RYtuzqajVbDLeTpoT9G/1maZraP1ZQwD/HWtPZH2iqjOqgQ0ZW6w7ve2NSZhkZ+c2Fa63tAq6S3IfjZeXfpd8qJRNjdox9yY2F8tLQC8/+44zkKo9REXtazEZEcSpCP+rmoHach5ypONZeyKZNyJjBN00hmi8HrvwHuc6ON49Z9oRsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=byBuCVuwGDri+KvCnUibhqTkcZTMpDMzmwVJgYWUlqE=;
 b=ZwviuXKXNb9vXfUnKBx/m35KZW6eXt1XaHqGZwT5wdt5K7vuWq7AHKjznz0IoMuf+At8m3OkKLLbE6cuxvlxdsXwNIUSHp9/61eFRloQtKfowf1zkg13x2tt5opChFfwGYpYURdG9FnDIGnEi3NvR3DpGampBt6MJydq64QOl/iVTRN6LzWHfu1EPJenuI5FKJT2wwZwCoIAe18XWLbL3SOv3F/NY0+YLqLWvR215iQomiXE6d4y4CYWuz2VhZYk8TqKpYYFaODUpUUnQrP3gB1jScpBIYYGS4q+JZjvovSHGpF3UOZsdTSv/dek6CnTHwg+O6hpf07CXSGpuVV1Fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=byBuCVuwGDri+KvCnUibhqTkcZTMpDMzmwVJgYWUlqE=;
 b=B7CkSlKkEavDPnqV6wJn/KwTU+5a3L3dk/EsO/ZL/YoXT0J9eF4ynmZPHn0nAPDzJw0GUEFEPmpuTR8/tfisn9W87PwWztsyMurBAOOMKwuC586ysVIe6ftSP1oddZPsVmJmYVu7PmHajypyWtiUHS5rl6VajIylsMXgSRH11iKdlu+6bcB9QCmmfhm3I+hURjyq0ljgXFvdRRDKPAuhWfmbcCufK7EF17KpxJqeCITCuUdzKjXlvfFzY/liw9EFywS+KF/N/CvBCDuq7ObZqMxUqM0iqYMydb3jHh3/K2sVYrcJFKYeYrMDNFdqyEzxgCXBEg0cQsEBPqfRx9jA0Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MW4PR12MB6873.namprd12.prod.outlook.com (2603:10b6:303:20c::17)
 by CH1PPF351A22FF6.namprd12.prod.outlook.com (2603:10b6:61f:fc00::60c) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Mon, 31 Aug
 2026 06:05:01 +0000
Received: from MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1]) by MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1%5]) with mapi id 15.21.0360.008; Mon, 31 Aug 2026
 06:05:01 +0000
Content-Type: text/plain; charset=UTF-8
Date: Mon, 31 Aug 2026 15:04:58 +0900
Message-Id: <DL2WI746YAWD.2WRSVRP5MFXDO@nvidia.com>
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
Subject: Re: [PATCH v2 11/15] gpu: nova-core: bound a GSP wait by a single
 deadline
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "John Hubbard" <jhubbard@nvidia.com>
Content-Transfer-Encoding: quoted-printable
References: <20260829012243.496697-1-jhubbard@nvidia.com>
 <20260829013324.499542-16-jhubbard@nvidia.com>
In-Reply-To: <20260829013324.499542-16-jhubbard@nvidia.com>
X-ClientProxiedBy: TYCP286CA0010.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:26c::18) To MW4PR12MB6873.namprd12.prod.outlook.com
 (2603:10b6:303:20c::17)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR12MB6873:EE_|CH1PPF351A22FF6:EE_
X-MS-Office365-Filtering-Correlation-Id: 65d8a570-cb91-43a2-27b9-08df0725cb0b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|10070799003|366016|1800799024|376014|23010399003|18002099003|22082099003|56012099006|4143699003|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
	1/D7HmdD79taT0IRN0P4Qyq8cBklSSTzMe6AkzdEq7ubVsabC0BK81skMdaGpBPWBfooE03kJKDk9I4bom8rcS+Zw2/lta1FW//TiThBWu20Sf7Gnan+ABigL2pf5y7H4zoGbfgq/XzOvG9gwdY78B8P6t4gpAHUBhEb8ynoi4wrA+6/B24NDqm20JGBr67r+x9GgWsH6FxnMUzXI5t1aTTUgnzn8Gc2IIixBhgBaK2HTX7ZaXeC5vMwxI0jIh9XnnBczzByyl3WQmQ1+VvNeQLhpBbPh0plCQC0uy2p7MwknjlgDSfcxJcra99AQn8AED4P0Qxz9u89BicORup/9M310cVDE0rWMYlbftV1vRxFCUYXl+Jp2WxRmoljd2h82EVoD/wUBx95n0oJaZBsDxYNlj9X8Nt7OJZZ2lL7RQui04KJQyNtYYEiGduwF/yEUb9D6lha8czX+VeBUaQxVgjNBaGzjJz7ES5qSGf1tLoSNHFCI44aGsUhkd1UmFqsLkGD6f3NySg103unTR3gv41Eh+nZp+BH9+BVBrr1Zv8I4ZkeAb1osbX9ggXH8iscFcVgGi4jxSVH8eTcZFf1JBOdcmLMI80sxO6DYhp+Tp/HJmDUVpcGNnFwWVKM5axK9sSJXCdwD9ZZ3zqkUan7KVl+JhvFQH19tXDgaEmlikg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR12MB6873.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(10070799003)(366016)(1800799024)(376014)(23010399003)(18002099003)(22082099003)(56012099006)(4143699003)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WEdQbnFRcTZ5YlREd3NVMHlMS2NVbjNoSlhZYmJIeFh4TjY1SE9DY2VXUXpD?=
 =?utf-8?B?cFFiNkRvNStSZnFsbHRyb01wM2hST1Z2MEJjQ29HdGs0UGp2b3BRaVJXdkpp?=
 =?utf-8?B?RjJaYzlhOXc0c1VPeTFQTm5uLzloRVZvYW10S2MwalgrdEptbk95eEkzWmVX?=
 =?utf-8?B?cDlEY29zK3M0enJNaXRsRWV1Qm9id1JBbm8rQnBKWHJMNDNoem9OZnllc09z?=
 =?utf-8?B?M1JJbUJBaEUzdjFiZXZoeVdBaTRNSlBoc3JYb3R4Q0NZVndZWXRFb2wrdi9W?=
 =?utf-8?B?czZKOEF2QkNhWllqMndpc3JPd0dZRy9ONXpZd3h3YUNjMExBTkRpeHE0R2Fs?=
 =?utf-8?B?RmhmdWRaOWJkb29CbGNNVVluWFpYd05QTW15UDNISjBMSFYvMGZzd3R0d2tC?=
 =?utf-8?B?eURwWktVaWhCTmJqb21OOU9qNVc1Z3E1czdGSG9wREN0L0dOSi8vVExIWDd5?=
 =?utf-8?B?ZGIyN0VSTjdtbVgvTEwxTXdVSUVTbVpENFJNcHZ3TjA1YWxoVVBzOE1FZDFQ?=
 =?utf-8?B?M1FvT0kzbXNGQTQrT3M5aEJWVEVQMDhDbkYrakFkMHM0TDltWkw3MmNldW1J?=
 =?utf-8?B?ZnhJNUdkdjRXTGN2UXhxNmx0SzVaWGtlWlF4N0wzOEI0dHJacEYyUkZrbW9n?=
 =?utf-8?B?ZTZRRWQ3dzlKUWYwa3hmZXI1RHQ4bURhKzBEamhxNFdXYWFiTGFLc245REQz?=
 =?utf-8?B?OXdHSURWaG5SNzd6ZDZFdmZ5ZmNhejkxQlpZc2V3aUpUblVPR0RnRWg3eVlt?=
 =?utf-8?B?Y2h1UG44bTBPT0xxeVpVNzdobjJxY2htUlRwRFI4VG41RXAyRmhoQ3o1Zk5h?=
 =?utf-8?B?UDdWZkFTMitQdDFYSWxLYlFqalBBdVVjUmU0T0ZoeWlLbkpUTlNQUXpuVllx?=
 =?utf-8?B?N1ZoMFRJeXNZN0ZWeHpuVjZmbnBCTHFxbGJVaVUvU0pKYS8zQ2JxR3p2ZFRr?=
 =?utf-8?B?cHVwRGg0SEp5USsrQ1pWeHZLZkZSMGVMZzQrV2dSN0U4TXc1ZnRHL05GdGRq?=
 =?utf-8?B?TTE4NTBMUXpVdktycldDeXJJSk5PTXV1UE1POXV0OXhqemo1TnZIMWJCTG9i?=
 =?utf-8?B?WTByNTlzdGljOUY4cDR6cjRWWUoxUkg3RTdjUXQrT2JNbTBPNVE0TlBkdkIy?=
 =?utf-8?B?WThkU0N3cWR2MFMyRTV2VlN3SnFaaXpwcys3TkFwNkhPbzBVMlRIaGs2N096?=
 =?utf-8?B?dGd6THBMdWxNNWc1aG5WYXd0M2Z2U1puWVJHZTdqM3hUS05SVS9pYzJJTjM0?=
 =?utf-8?B?UUZkL29UeGMyc2pjQWFTSCtLWi9TeFNzUWJBVXpUWlNRT0F6QU1ZT0twbVJZ?=
 =?utf-8?B?U085L0R2eUlhV01jVEZYUzVGc3o2cTZjcy9mMEtHTjlNYTZFQ3d3d2FjU1pG?=
 =?utf-8?B?UHcvVFptbS82Y1dNNy9UWHk4NVpYMU1ISzhJTXNMLzdDcXJrRDlIWC9YcXVY?=
 =?utf-8?B?QWpMUHBPVGlnWng2ejZjTWFwNWtMMnNXQ1FacWxKck83a0VYaWQrSkJ1K1Z0?=
 =?utf-8?B?WktMczc5YXZibDZhWjBna2JkRlVSaW9DYks0RDd1RmhtaXY0YU84RUNqOUlS?=
 =?utf-8?B?NHA5UXFpVnNJMlBGM2I3Z3ZRbnphVDQ1dlB4YmQxL29NVjVLck56eUFnNHUv?=
 =?utf-8?B?WkU3QW9semxad3lpQm42TEpUUDNKZmJWeUIwTXBVK3Y4UE9TN3R0SFpnVktT?=
 =?utf-8?B?UlJzc2lwY2pZTmswc24vbHBaTWwzOWJSUCtaUklqa0dWNXFHRUZxSU5Zd3lR?=
 =?utf-8?B?dERnVytpRnA3djhBTWloc2hhdjZNaktVby8zSVJWb3dYTm5KWWVTVU43M2NJ?=
 =?utf-8?B?ZlJBbjdRbGZ4c3BYYzFRVkFpVXdBVi8wYnh6aUdwRFlJYjd1VmdVODkzK3VH?=
 =?utf-8?B?czVkbFh4UGFvUThmTWZQL3hEWURNUHljWGxlQlN4VmNIOFJ4d2FSMDV1VVBU?=
 =?utf-8?B?Tkd2cmxncnBGQTFkSGtibVgvbkdEdVN3aS9pTWtOSzMvL0tyTy9DWmptZ25D?=
 =?utf-8?B?NXNsWGJ3UHVCNFBBY29pL3JqMTg2N2R5T2ZUT3Q4elI4Rit6SUM4a0d1UXFS?=
 =?utf-8?B?eTNpYVZnTmR1Ri9KckpKYk9hQU04OEgvaEx3bHIrM2hYcEY5UU8xdFVlQXV3?=
 =?utf-8?B?Q1FsZ0MzN2V5SUg3T29STjkwZjNtNTNVN0Z6RkdkRWg3QkVjazVmZ2dPaFNy?=
 =?utf-8?B?QmFLY1JpalZOMjBrb1owT2FLMFlhQmhrR2tnSTZHNndPa1NiSm1nZUZ4ZVJT?=
 =?utf-8?B?NzllWENPd2Yza1BqUHcrVUNIa2t5MHRHSkI4dVZTK1ZCWDlSRU9xMFU2ZW9F?=
 =?utf-8?B?eXdocUhTOUdRQW9vUW5xemxMT3duVS94dkkvcFZRSTJVNldWVnVXUnpHa0JO?=
 =?utf-8?Q?KabFsGI4jWbW/5edPmGUthxSKzHaG9Ib3ub6+5CjJqF8P?=
X-MS-Exchange-AntiSpam-MessageData-1: tnUObBfaevRapQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65d8a570-cb91-43a2-27b9-08df0725cb0b
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB6873.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 06:05:01.2835
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ofeeHkjh1742F1V89hunluYUnC+dORj7aa9W6f6IjyipRqDYNGGJt8mIKBEquhfrFaAamQwwDGHLb9Z8jPtnhg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PPF351A22FF6

On Sat Aug 29, 2026 at 10:33 AM JST, John Hubbard wrote:
<...>
> @@ -600,17 +610,43 @@ pub(crate) fn send_command_no_wait<M>(&self, bar: B=
ar0<'_>, command: M) -> Resul
>          self.inner.lock().send_command(bar, command).map(|_| ())
>      }
> =20
> -    /// Receive a message from the GSP.
> +    /// Receive a message from the GSP, matching on the function code al=
one.
>      ///
> -    /// Matches on the function code alone, for a caller awaiting an uns=
olicited GSP event rather
> -    /// than a reply to a command. See [`CmdqInner::receive_msg`].
> -    pub(crate) fn receive_msg<M: MessageFromGsp>(&self, timeout: Delta) =
-> Result<M>
> +    /// Returns `ERANGE` if the message that arrives is not of type `M`.=
 See
> +    /// [`CmdqInner::receive_msg`].
> +    fn receive_msg<M: MessageFromGsp>(&self, timeout: Delta) -> Result<M=
>
>      where
>          // This allows all error types, including `Infallible`, to be us=
ed for `M::InitError`.
>          Error: From<M::InitError>,
>      {
>          self.inner.lock().receive_msg(timeout, None)
>      }
> +
> +    /// Waits for an unsolicited GSP event of type `M`, dispatching any =
other event that arrives
> +    /// first.
> +    ///
> +    /// # Errors
> +    ///
> +    /// - `ETIMEDOUT` if the event does not arrive within [`Self::RECEIV=
E_TIMEOUT`] of the call,
> +    ///   however many other events are dispatched while waiting.

We also return the errors from `receive_msg`, this should be documented.

> +    pub(crate) fn await_msg<M: MessageFromGsp>(&self) -> Result<M>
> +    where
> +        // This allows all error types, including `Infallible`, to be us=
ed for `M::InitError`.
> +        Error: From<M::InitError>,
> +    {
> +        let deadline =3D Instant::<Monotonic>::now() + Self::RECEIVE_TIM=
EOUT;
> +        loop {
> +            let remaining =3D deadline - Instant::<Monotonic>::now();
> +            if remaining.is_negative() {
> +                break Err(ETIMEDOUT);
> +            }
> +            match self.receive_msg::<M>(remaining) {
> +                Ok(msg) =3D> break Ok(msg),
> +                Err(ERANGE) =3D> continue,
> +                Err(e) =3D> break Err(e),
> +            }
> +        }
> +    }

Note that this will release the lock between calls to `receive_msg`. If
a `send_command` comes in from another thread at the wrong time, that
one *does* keep the lock until it has received the reply it expects - so
our reply will be consumed silently and we will timeout.

I guess you can just remove `Cmdq::receive_msg` here: acquire the lock
at the beginning of `await_msg`, and call `inner.receive_msg` from it
directly. The GSP queue is synchronous by design anyway, so that's what
we want even if it looks strange to hold a lock for potentially 5
seconds.
