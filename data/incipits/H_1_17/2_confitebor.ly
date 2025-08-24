\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key a \minor \time 4/4 \tempoMarkup "Andante"
    R1*2
    e'8 e a g g g~ g16 g fis fis
    g8 g, r g'4 fis16 e \hA fis8.\trill fis16
    g4 r r2
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key a \minor \time 4/4 \tempoMarkup "Andante"
    R1*2
    r8 c'4 h8 e8. e16 d8 c
    h c d e d4. d8
    d4 r r2
  }
}

Soprano = {
  \relative c' {
    \clef soprano
    \key a \minor \time 4/4 \autoBeamOff \tempoMarkup "Andante"
    a'8^\solo c16[ h] a8 gis \tuplet 3/2 8 { a16[ h c] h[ c d] } c8.\trill c16
    h4 r r2
    r8 c4^\tutti h8 e e16 e d8 c
    h c d e d2
    d4 d8^\solo d d d16 d g8 h,
  }
}

SopranoLyrics = \lyricmode {
  Con -- fi -- te -- bor ti -- bi, Do -- mi --
  ne,
  Ex -- qui -- si -- ta in o -- mnes
  vo -- lun -- ta -- tes e --
  ius. et iu -- sti -- ti -- a e -- ius
}

Alto = {
  \relative c' {
    \clef alto
    \key a \minor \time 4/4 \autoBeamOff \tempoMarkup "Andante"
    r2 r8 e4^\solo a8
    gis8. gis16 a8 h c h16 a g8 f
    e e a[ g] g g16^\tutti g g8 fis16 fis
    g8 g g g16 g g8 fis16 e \hA fis8.\trill fis16
    g4 r r2
  }
}

AltoLyrics = \lyricmode {
  in con --
  si -- li -- o iu -- sto -- rum, et con -- gre --
  ga -- ti -- o -- ne. et iu -- sti -- ti -- a
  e -- ius ma -- net in sae -- cu -- lum sae -- cu --
  li.
}

Tenore = {
  \relative c' {
    \clef tenor
    \key a \minor \time 4/4 \autoBeamOff \tempoMarkup "Andante"
    R1*2
    r8 e^\tutti d8. d16 c8 g16 a h8 c
    d e16 e d8 c h4 a
    h8 g^\solo a h16[ c] h8 h c d
  }
}

TenoreLyrics = \lyricmode {
  Con -- fes -- si -- o et ma -- gni -- fi --
  cen -- ti -- a o -- pus e -- _
  ius mi -- se -- ri -- cors et mi -- "se -"
}

Basso = {
  \relative c {
    \clef bass
    \key a \minor \time 4/4 \autoBeamOff \tempoMarkup "Andante"
    r4 r8 e^\solo a e c a
    e' e r4 r2
    c'8^\tutti a f g16 g c,8 c16 c r8 a'
    g e h c d c d4
    g,8 h'^\solo fis d16 d g8 g16[ f] e8 d
  }
}

BassoLyrics = \lyricmode {
  in to -- to cor -- de
  me -- o,
  Ma -- gna o -- pe -- ra Do -- mi -- ni: in
  o -- mnes vo -- lun -- ta -- tes e --
  ius. Me -- mo -- ri -- am fe -- cit mi -- "ra -"
}

Organo = {
  \relative c {
    \clef bass
    \key a \minor \time 4/4 \tempoMarkup "Andante"
    a8-\solo a'4 e8 c gis a4
    e'8 e'16 d c8 h a4 h
    c8-\tutti a f g c, c' h a
    g e h c d c d d,
    g h'-\solo fis d g, g'16 f e8 d
  }
}

BassFigures = \figuremode {
  r4. <_+>8 <6> r <9> <8>
  <_+>4 <6>2 <6>8 <5>
  r4 <6 5>2 r8 <6\\>
  r <6> r4 <6 4> <5 _+>
  r r2 <6>8 q
}

\score {
  <<
    \new StaffGroup <<
      \new GrandStaff <<
        \set GrandStaff.instrumentName = "vl"
        \new Staff {
          \set Staff.instrumentName = "1"
          \ViolinoI
        }
        \new Staff {
          \set Staff.instrumentName = "2"
          \ViolinoII
        }
      >>
    >>
    \new ChoirStaff <<
      \new Staff {
        \set Staff.instrumentName = "S"
        \new Voice = "Soprano" { \dynamicUp \Soprano }
      }
      \new Lyrics \lyricsto Soprano \SopranoLyrics

      \new Staff {
        \set Staff.instrumentName = "A"
        \new Voice = "Alto" { \dynamicUp \Alto }
      }
      \new Lyrics \lyricsto Alto \AltoLyrics

      \new Staff {
        \set Staff.instrumentName = "T"
        \new Voice = "Tenore" { \dynamicUp \Tenore }
      }
      \new Lyrics \lyricsto Tenore \TenoreLyrics

      \new Staff {
        \set Staff.instrumentName = "B"
        \new Voice = "Basso" { \dynamicUp \Basso }
      }
      \new Lyrics \lyricsto Basso \BassoLyrics
    >>
    \new StaffGroup <<
      \new Staff {
        \set Staff.instrumentName = \markup \center-column { "org" "b" }
        \Organo
      }
    >>
    \new FiguredBass { \BassFigures }
  >>
}
