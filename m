Received: from CWXP265CU008.outbound.protection.outlook.com (mail-ukwestazon11020129.outbound.protection.outlook.com [52.101.195.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28D3D331A53
	for <nova-gpu@lists.linux.dev>; Fri,  2 Oct 2026 09:50:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.195.129
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790934623; cv=fail; b=lnWsukN7scr9rfR0+BBu/G4/11lhBAdJ1kaIWXXUByzCiGc/9PoAG2jlZ4krwh1KHuAOv2Pwlrnf/8ezciSQCuD3RaTxZWd3mm33FP93o0kAa6fF5cGZN1WBnaqhRLK7RrY+OGk4Kltdhhqtj4acZIdpbQcda4T6uo6vlmObFgE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790934623; c=relaxed/simple;
	bh=FexaYsFlst2E+VvYRyiJwGtbQySjoJyQ5vYRGEPcyCM=;
	h=Content-Type:Date:Message-Id:From:To:Cc:Subject:References:
	 In-Reply-To:MIME-Version; b=gtZB0LgwwFSUoqox7PqSNbhyVR59eRyUx8Pj1REgoRGQwkZayH6fJ/1K5Tvkl5sZNvgCcY5cHEB/ARzkUeTCaHAtBjECJxMVve/rOjPiO2jhrmhqCLRM8CBrbQnpSTiMrq6NIMjZbO6srU1anLAPuTwgJ4TAxJ6o7KIlVlnOpHg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=QCx0QJCM; arc=fail smtp.client-ip=52.101.195.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="QCx0QJCM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Yn9Z0xdlK9wCRUF5jqrBUQla8t7/UTBoCTzKoqGtks7cfWA2tfH1ZaXwrCoE2vqm8U5HwRk1ZS+RxS0CAdJmZxAm70uz4YDa+A41eZy73XzN1ik1Zj2DVu+G7nECQXBwkzjeDty/gFWFy+6JGtPA+zyNjoq/qHjhLYszIqR71uvYLJxuslumO68lyx/Nhm019d+wv/QGKY6QTzg6eVctdkyeoTSsSZGZus3xbOrDuTkmYFHxhtjdgmARah7uOKF9sogwUihXNAXB9HW+azLjzuEL8hxvGKdlofTwsIxK2SbARG9iAmOlOAdKmK7CuXTnd+M0FIPpnYT/dNcDVpD4wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fxuyrxRK/53xf0VkCCE2D5xzETqqsKfXmoXo3Twna4I=;
 b=eRew7xA+JDqOtbly4fnpALvaLkJAZW7zG3FiulYngVC+oG4xP81dVOJd9mjC3jfXOkOHutqWSKZPAM69k2JHFkmu7KsJIxvIJAxxhKJDS21zQiXqXcVS/jVJKmWS6mmGUd2SRgf6uh5eeXfrQwzSQEfsrId9QEdYUYpRxyblRJiImqF5gwpbXLutM2Ze4m5dftg2IaXpYjqll0tFiKWU3h+JoXMActtwg0Ei2Co1tiCMtfTL/25LC2tf595MJwQ8OJ3voBL7maHBUuG/avk/TRQZHg265D8AD1ccV+ZgGi6T5xxOm5O+wpVjLYzTgCSJhrdF3nxhzSOviQe+CyW4Dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fxuyrxRK/53xf0VkCCE2D5xzETqqsKfXmoXo3Twna4I=;
 b=QCx0QJCMLbw7SlETGB5DPdnxnopeLFbkDM+djpknVsUX0rb6ZJWD0ekL4ZCzatWZUSE5KKJeTtSqERmq68WSfYCGWIpNaaYoODxjcviQnsAwJiDZmkzGrb9WbfobA1TKQXDaRQWvIkMZKUtoNat3t7DnGzVhhptPiOvCYY+Pzog=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4ab::19)
 by LOAP265MB8540.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4ab::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.19; Fri, 2 Oct
 2026 09:50:15 +0000
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1]) by LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1%6]) with mapi id 15.21.0472.016; Fri, 2 Oct 2026
 09:50:15 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 02 Oct 2026 10:50:14 +0100
Message-Id: <DLU9C3WDP0T6.155CTDSBPI93M@garyguo.net>
From: "Gary Guo" <gary@garyguo.net>
To: "John Hubbard" <jhubbard@nvidia.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Alexandre Courbot" <acourbot@nvidia.com>
Cc: "Timur Tabi" <ttabi@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>,
 "Eliot Courtney" <ecourtney@nvidia.com>, "Zhi Wang" <zhiw@nvidia.com>,
 "David Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>,
 "Bjorn Helgaas" <bhelgaas@google.com>, "Miguel Ojeda" <ojeda@kernel.org>,
 "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>,
 "Gary Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, <nova-gpu@lists.linux.dev>, "LKML"
 <linux-kernel@vger.kernel.org>, "Joel Fernandes" <joelagnelf@nvidia.com>
Subject: Re: [PATCH v5 02/15] rust: sync: completion: add
 wait_for_completion_timeout()
X-Mailer: aerc 0.22.0
References: <20260930034148.590687-1-jhubbard@nvidia.com>
 <20260930034148.590687-3-jhubbard@nvidia.com>
In-Reply-To: <20260930034148.590687-3-jhubbard@nvidia.com>
X-ClientProxiedBy: LO4P123CA0285.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:195::20) To LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:4ab::19)
Precedence: bulk
X-Mailing-List: nova-gpu@lists.linux.dev
List-Id: <nova-gpu.lists.linux.dev>
List-Subscribe: <mailto:nova-gpu+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:nova-gpu+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOAP265MB8560:EE_|LOAP265MB8540:EE_
X-MS-Office365-Filtering-Correlation-Id: 3056b8b5-f416-482f-8220-08df206a8f46
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|23010399003|10070799003|56012099006|10067099003|4143699003|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	JqpPtwt8hVF9ydMkcwL4tjcnCwSkZ/SQvZdEW1poECApYiKFmIsOA+aZLZg59h+oO9GB+XsxPzw6KCF59JLno8u4UsOBrUUOiFLaV1gq4incmgUVgkKMM0QTZGNlHNocmJYEN5T4pTqvY+iUSQJlQMuFFA1CsyGYcJhUjQenZUbstjAsrsxqZjk2d+5HgYwZFasLWr+pvXKVGZRTUNtibrbtA+sT9QKgjKXPx8xniVhd/xHzjsGzdg7bCUPPIbbvEIMmWNA+ARQi+I8FKfCposEzItiWqPdz4U4XSiqOQbA4zEi1HtwM3Tbd6kmrCUMFuXqf5ugmEr7bnFgQXs95fiRrbz04xaVunXYE3Px2Cv3R1egBKu9CzI8v+t2Uf0Co3jvKkN4+85D/DlxVWH0kdbvclY9qda5iKaMG4hHkcQNr7f8nP68hLzjfWmgsBURZawc4eVd1R6hB8g2OylzTnKbh6EIOlVheXnOPVLQYQ9CsUFscjyp2Yn6w9cdGW8dBhUini/GfftnvyQOzsLmhOxzJhcBOQNtvNGpLgilpgwn5ywfliz2aqvI99gGuqp9P/DWhuzY7bu4uLBdKdjCCikf2aak7vkRuHylKrFi5kBZZ36NhckbSfItLSSnTRa+e5mL6tYZb23I3SCShhL/MWfc9XVzd0rn6aIBLbO2JLK0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(23010399003)(10070799003)(56012099006)(10067099003)(4143699003)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TFhUQlVhWTFRYzdicy9wSTRaMno0V082cm5Sa2xQeGlTU2tJc0dlSlZBNVpR?=
 =?utf-8?B?cWxMQUE1TjYxYzNOMW1VbEJpU0cwcURPQ2ZiWU4vZC9xaGd4RjlwelBSMk1l?=
 =?utf-8?B?VzA3M0VQRG5vckM1MDkwRWlLUHJlR3M4bHZIeklWNExrZW9VVGRWTXdvU1RD?=
 =?utf-8?B?L1Avd05qbkRuUmIyMGtMNnFHRExIUkF3YWJFM2NxenVtQlV5bE1HMm9NV0xr?=
 =?utf-8?B?VFJrUitCQVVlOTVXVEFYSEhIdGN3QmM5UTNqTkw3RjRtem85Rk41TzVzVzNP?=
 =?utf-8?B?NUxtdklWNkR1NlA3K21idzJGbldZeVZmenkrL1pOK1ZBNDljc0dMWjNYcTNw?=
 =?utf-8?B?TXVkWjNSYVk2RllVK2IzR2lzS2gyL1dZczhOZTRkTEJid0RLL3VWSElTQWRv?=
 =?utf-8?B?R3lBRFRQZ3JoZ3BNNmcwdzNHcndKR0N4RTkwSm92RjZOcDBaZFVlZEZQVjhW?=
 =?utf-8?B?b1BnUDh3SUMrZFpjUEtIcytZUHdTWThwU3Z5MVVjRUZXeU9IakJVaTRiYlZm?=
 =?utf-8?B?cGhYVkZMWDgyVjBKR08zVGlCN2dkYnFEc090eVZsbE1ITWQzaXQ5QkVTN0No?=
 =?utf-8?B?bTRRelZUWVJ0c1hTMUtvcS9abXVCYWRHS2tIZzJnZm9FYWZUYkcyZEZFYlE3?=
 =?utf-8?B?ZjBQaFl1VitUa21mUU5XWCs5YmQ2VTF5UWRDeDRsVmxYcDNXTTVUKzI5UWIx?=
 =?utf-8?B?SENKYTFQdmgyMy9VM3RTbGFXaXRhU2QxaENiWTI0RFpBU2x4dE9WSFNtQVNr?=
 =?utf-8?B?MU1kZDBERkNQekowODRpTWtldmFNQkp5NW1EOVh5amdvTkdPTzVIeG5aNEpK?=
 =?utf-8?B?aFFTUk1STVYwM1hlZXlPM1RObVBxL0pWeHVHTzFEcldHVDNGbG9UZklLNGVC?=
 =?utf-8?B?RFA1Ulg5T2JxU1JiSnR3bjhvdTBNMW14NFUzZy9XRWpST1JVcEtTdmh0SG5z?=
 =?utf-8?B?d08wd2dOT3BDV1Y0czY2THdIZjRKQWdxZGh5ZUNSdmxuZEtIVjlPZkJ4K0lM?=
 =?utf-8?B?Yy9ONk8rMEVHVEtyaytkQzJqZWVOdFhBWngzYThyak5Edm1CZjhSa3kzMDlJ?=
 =?utf-8?B?UDcycng3UDVVdXN4UGE4OEVXWEdxSE1hT2RJbXBjMUFDVDRIQWpEMitqLzkr?=
 =?utf-8?B?NXp5M3p2Wjl1dXA3WTVycTZnM2FOTW9nTWFrL3BqalQ2V1JCR2R5b28yT1hr?=
 =?utf-8?B?a1I4RTV5STNVR0ZPNDRpVFdjVllaL1MyS2VSY05uajFXMEVON2t6Ti94Mm4v?=
 =?utf-8?B?bjR3V2MvNVF6dER2djBOTWtUMHZZRzJuN0x0aHFxYXlyd0Y2bFN4SlNBNzR5?=
 =?utf-8?B?WjMyZml2ZjNZVFhuNlpCSVZYQms5UWJ1aUJJY1oybExlZXVHUU9icW5Ec0xn?=
 =?utf-8?B?RStOR0MxNU55STgvanRrZDFtVHBDK3EyRVpEVFdVNTRyREVIa3dXS09ENlpp?=
 =?utf-8?B?eWsxc1Fmbmk3WnZKNDBoaEt6U0VXTWpjQlk4MlNYY0FDVVU5cTVQTmszemd1?=
 =?utf-8?B?WGczdE9haHBnSDRyaW1tS0tFVDBhUms2alNRVEVIZ2RwWlFIY010QkF3RHR3?=
 =?utf-8?B?SDQrTEVCbTdZb3RjcjE3ZmF1S3FuWElZRGNFa0JuUitnclkvN29FV3NkcTNF?=
 =?utf-8?B?WGh4QTFpYW5UM1BKdWFlUkpIVFg3K0VVaFUzb1kreTQxa1hKanUvZkVCZFhL?=
 =?utf-8?B?Q2RBWWxpTlVaV2o0aC9vVkYrWWwzSFVxN1J4NFAzYmRzYXdDK0M3TXZsc2hX?=
 =?utf-8?B?TGgzTlhRaGxQSDhZZklVSkdiNE4zcDFZcllSUXN5Nk53MWhleDNCb0JJdWUw?=
 =?utf-8?B?SjAvMThCaEpsNVZMbjFGcmlXTjBEbmxEeUxabnQzaWZacnlYMTVvTVRqSlBw?=
 =?utf-8?B?ajlpRmZKcDEvQkxRQTlLT21hcWUzOHh0enJUYk45cjQ0VW1FeElFWUhaUml1?=
 =?utf-8?B?RzgvakZjZ2RyRnE2SWdvb1BvY0NJL2Q4YjhkTEhzWFBNWnd0WWRWWDFJZkVG?=
 =?utf-8?B?c08zbW9TME1zSUNzT25HQjVYRzJwTWh2WmE5cWV2bHJHeVZYQnExanlaM3N1?=
 =?utf-8?B?ZDM1WFhmTlZwR3J4eXMveFN5a1RsSEx1VldHYTAxYmtyaTMvUGFkbkx4Rnh3?=
 =?utf-8?B?Mk1QWDBidHJQcXB5cHFnMEpDby9PUkkyRzJBSWYyakVacFBGb2RKUGFyeVVB?=
 =?utf-8?B?Qm5Ea29pWVhJeEgyT3VSVWtZSldWcDFKeTZ1VW9LM1FieGloc3FaOXlnbkk5?=
 =?utf-8?B?TkNYd0VUNklrTHc0MmZIKytwS3pvUVlBT1RBUFVaZHRwT1RUWnpaQmVOSGMr?=
 =?utf-8?B?QnQ5QXQrbGRUM3RaYUVqZmNvU3Z3L0V0ZXhucEJQTDJUNDRxRG5DQT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 3056b8b5-f416-482f-8220-08df206a8f46
X-MS-Exchange-CrossTenant-AuthSource: LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2026 09:50:15.3632
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j1K161n3Uhl0GT/XIfV3SIEcwZ/v2ajLVQ8mrHlkYyW/2XYm0Ou33gTS6v2WRbZNl10dPIRZFI0VCVs5NcQl3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LOAP265MB8540

On Wed Sep 30, 2026 at 4:41 AM BST, John Hubbard wrote:
> From: Joel Fernandes <joelagnelf@nvidia.com>
>
> A driver that runs an interrupt self-test during probe waits for the
> handler to fire. wait_for_completion() has no timeout, so a broken
> interrupt path stalls probe indefinitely. Add a timeout variant of
> wait_for_completion().
>
> Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
> Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
> [jhubbard: return the remaining jiffies]
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>

This email should have RfL list CC'ed.

> ---
>  rust/kernel/sync/completion.rs | 23 ++++++++++++++++++++++-
>  1 file changed, 22 insertions(+), 1 deletion(-)
>
> diff --git a/rust/kernel/sync/completion.rs b/rust/kernel/sync/completion=
.rs
> index 35ff049ff078..7e8b3c1c880e 100644
> --- a/rust/kernel/sync/completion.rs
> +++ b/rust/kernel/sync/completion.rs
> @@ -6,7 +6,12 @@
>  //!
>  //! C header: [`include/linux/completion.h`](srctree/include/linux/compl=
etion.h)
> =20
> -use crate::{bindings, prelude::*, types::Opaque};
> +use crate::{
> +    bindings,
> +    prelude::*,
> +    time::Jiffies,
> +    types::Opaque, //
> +};
> =20
>  /// Synchronization primitive to signal when a certain task has been com=
pleted.
>  ///
> @@ -111,4 +116,20 @@ pub fn wait_for_completion(&self) {
>          // SAFETY: `self.as_raw()` is a pointer to a valid `struct compl=
etion`.
>          unsafe { bindings::wait_for_completion(self.as_raw()) };
>      }
> +
> +    /// Wait for completion of a task, with a timeout.
> +    ///
> +    /// This method waits for the completion of a task, or until `timeou=
t` elapses. It is not
> +    /// interruptible. Returns the number of jiffies left when the task =
completed, or [`None`] if
> +    /// `timeout` elapsed first.
> +    ///
> +    /// See also [`Completion::complete_all`].
> +    #[inline]
> +    pub fn wait_for_completion_timeout(&self, timeout: Jiffies) -> Optio=
n<Jiffies> {

NACK. Please use the typed `Delta<Jiffy>`, not this old type alias for c_ul=
ong.
I asked Miguel to take that late last cycle because I know there'll be new =
users
that want to use Jiffies this cycle!

This would avoid you having to do clamping on the max side (but you still n=
eed
to clamp the value to be at least 0). There'll be a helper method for this,=
 but
it isn't available yet.
https://lore.kernel.org/rust-for-linux/20261002050428.2746277-3-tomo@flappi=
ng.org/

Best,
Gary

> +        // SAFETY: `self.as_raw()` is a pointer to a valid `struct compl=
etion`.
> +        match unsafe { bindings::wait_for_completion_timeout(self.as_raw=
(), timeout) } {
> +            0 =3D> None,
> +            remaining =3D> Some(remaining),
> +        }
> +    }
>  }


