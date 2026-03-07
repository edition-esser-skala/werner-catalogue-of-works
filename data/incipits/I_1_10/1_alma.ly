\version "2.24.2"
\include "header.ly"

ViolinoI = {
  \relative c' {
    \clef treble
    \key g \minor \time 4/4 \tempoMarkup "Adagio"
    r8 d'\p d( es) r d d( es)
    r a a4\trill r16 g,-!\f b-! d-! g-! b-! es,!-! g-!
    cis,4 r r16 f,-!\p a-! d-! f-! c-! f-! a-!
    g(\trill f) e(\trill d) \hA e(\trill d) c(\trill b) \tuplet 3/2 8 { a g f } f8 r4
  }
}

ViolinoII = {
  \relative c' {
    \clef treble
    \key g \minor \time 4/4 \tempoMarkup "Adagio"
    r8 b'\p b( c) r b b( c)
    r c fis4\trill r16 g,-!\f b-! d-! g-! b-! es,!-! g-!
    cis,4 r r16 f,-!\p a-! d-! f-! c-! f-! a-!
    g(\trill f) e(\trill d) \hA e(\trill d) c(\trill b) \tuplet 3/2 8 { a g f } f8 r4
  }
}

ViolaI = {
  \relative c' {
    \clef alto
    \key g \minor \time 4/4 \tempoMarkup "Adagio"
    r4 r8 es\p es( d) r es
    es4\trill r8 d d4 r
    r16 g,-!\f b!-! cis-! e8 g f4 r
    R1
  }
}

ViolaII = {
  \relative c' {
    \clef alto
    \key g \minor \time 4/4 \tempoMarkup "Adagio"
    r4 r8 c\p c( b) r c
    c4 r8 a b4 r
    r16 g-!\f b!-! cis-! e8 g f4 r
    R1
  }
}

Soprano = {
  \relative c' {
    \clef treble
    \key g \minor \time 4/4 \tempoMarkup "Adagio" \autoBeamOff
    d'4~^\solo d16[ b] g8 r d'~ d16[ fis] g8
    a16[ fis] es![ c] a[ fis] a[ c] \tuplet 3/2 8 { b[ a g] } g8 r4
    r8 e' e16[ cis] a \hA e' f8 d, r f'16[ a]
    g[ f e d] \hA e[ d] c[ b] a8 f \tuplet 3/2 8 { a16[ b c] c[ d e] }
  }
}

SopranoLyrics = \lyricmode {
  Al -- ma Ma -- ter,
  Re -- dem -- pto -- ris Ma -- ter,
  quae per -- vi -- a coe -- li, quae
  per -- vi -- a coe -- li por -- ta
}

Organo = {
  \relative c {
    \clef bass
    \key g \minor \time 4/4 \tempoMarkup "Adagio"
    g'4-\solo r g r
    fis d g r
    e cis d a
    b c f r
  }
}

BassFigures = \figuremode {
  r1
  r
  <6\\>
  <6>
}

\score {
  <<
    \new StaffGroup <<
      \new GrandStaff \with { \smallGroupDistance } <<
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
      \new GrandStaff <<
        \set GrandStaff.instrumentName = "vla"
        \new Staff {
          \set Staff.instrumentName = "1"
          \ViolaI
        }
        \new Staff {
          \set Staff.instrumentName = "2"
          \ViolaII
        }
      >>
    >>
    \new ChoirStaff <<
      \new Staff {
        \set Staff.instrumentName = "S"
        \new Voice = "Soprano" { \dynamicUp \Soprano }
      }
      \new Lyrics \lyricsto Soprano \SopranoLyrics
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
